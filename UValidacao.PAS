unit UValidacao;

interface

uses
  SysUtils, Classes, Dialogs, Windows, Controls, DB, StdCtrls, Forms, Graphics, ExtCtrls;

const  
//  Caracteres = '1234567890ABCDEFGHJKLNPQRSTUVWXYZ';
  Caracteres = '3DJ456T9CQGH81VEWKY7URPZ2N0LSXBFA';
  T = 33;   // NÃO TEM OS CARACTERES (O, I, M)!!!!!

// Qtde. Caracteres Créditos
  carID   = 10;
  carRS   = 18;
  carCN   = 40;
  carMQ   = 10;
  carVAL  = 20;
  carBLQ  = 15;
  carEXP  = 15;
  carALT  = 10;

type
  TmVAL = class(TDataModule)
  private
    function ColocaDF(Valor: String): String;
    function Desembaralha(Valor: String; key: integer): String;
    function Embaralha(Valor: String; key: integer): String;
    function Mistura(Valor: String): String;
    function referente(valor:integer; max:integer=t): integer;
    function RetiraDF(Valor: String): String;
    function TrocaCaracteres(Texto: String; ID1, ID2: word): String;
  public
    function  VerificaSistemaExpirado(vsComTimer:Boolean=false):boolean;

    procedure AtualizaSituacaoDosCreditos;
    procedure ColocaCreditos(ccDataValidade: TDate; ccQuantMaquinas, ccID: Integer; ccRegistraCliente: Boolean);
    procedure GravaIDCreditos(giCNPJ, giRazaoSocial: String);
    function  PegaInfoCreditos: boolean;
    function  CriptografaCreditos(Valor: String):String;
    function  DescriptografaCreditos(Valor: String):String;
    function  VerificaValoresValidos(vvValor:String; vvSistema:String; vvID:Integer; vvConfereID:boolean):boolean;
    function  VerificaDFValido(Valor:String):boolean;
    procedure CRED_PegaDadosDaChave(dcChave:String; var dcSistema:String; var dcID:String; var dcValidade:String; var dcQtdeMaquinas:String);
  end;

var
  mVAL: TmVAL;

  function  QualquerCaracter: char;
  function  CRED_DeCripto_BLQ(ccBLQ: String; ccID: Integer): Boolean;
  function  CRED_DeCripto_ID(ccID: String):Integer;
  function  CRED_DeCripto_VAL(ccVAL: String; ccID: Integer): TDate;
  function  CRED_EnCripto_BLQ(ccBLQ: Boolean; ccID: Integer): String;
  function  CRED_EnCripto_ID(ccID: Integer): String;
  function  CRED_EnCripto_MQ(ccMQ, ccID: Integer): String;
  function  CRED_EnCripto_VAL(ccVAL: TDate; ccID: Integer): String;
  function  CRED_DeCripto_MQ(ccMQ: String; ccID: Integer): Integer;
  function  CRED_DeCripto_EXP(ccEXP: String; ccID: Integer): Boolean;
  function  CRED_EnCripto_ALT(ccALT, ccID: Integer): String;
  function  CRED_DeCripto_ALT(ccALT: String; ccID: Integer): Integer;
  function  CRED_EnCripto_EXP(ccEXP:Boolean; ccID:Integer):String;

implementation

uses DUtilit, UComum, IB_Components, USistemaExpiradoTimer, USistemaExpirado, IB_Access;


{$R *.dfm}


function TmVAL.referente(valor:integer; max:integer=t): integer;
var
  dif : integer;
begin
  dif := Valor;

  if Valor > max then
  begin
    repeat
      dif := dif - Max
    until dif <= Max;
  end
  else begin
    if Valor < 1 then
    begin
      repeat
        dif := Max + dif;
      until dif >= 1;
    end;
  end;

  result := dif;
end;

function TmVAL.TrocaCaracteres(Texto: String; ID1, ID2: word):String;
var
  x : char;
begin
  x := Texto[ID1];
  Texto[ID1] := Texto[ID2];
  Texto[ID2] := x;
  result := Texto;
end;

function TmVAL.Mistura(Valor:String):String;
begin
  if Length(Valor) <> 16 then
  begin
    result := 'X';
    Exit;
  end;

  Valor := TrocaCaracteres(Valor, 1, 10);
  Valor := TrocaCaracteres(Valor, 2, 14);
  Valor := TrocaCaracteres(Valor, 3, 11);
  Valor := TrocaCaracteres(Valor, 4, 13);
  Valor := TrocaCaracteres(Valor, 5, 12);
  Valor := TrocaCaracteres(Valor, 6, 16);
  Valor := TrocaCaracteres(Valor, 7, 15);
  Valor := TrocaCaracteres(Valor, 8, 9);
  result := Valor;
end;

function TmVAL.Embaralha(Valor:String; key:integer):String;
var
  Soma,
  i, k : integer;
begin
  result := Valor;
  for i := 1 to length(valor) do
  begin
    Soma := 1;
    for k := 1 to length(valor) do
      if k <> i then
        Soma := Soma + pos(Result[k], Caracteres)*key;
    result[i] := caracteres[referente(pos(Result[i], Caracteres) + soma)];
  end;
end;

function TmVAL.Desembaralha(Valor:String; key:integer):String;
var
  Soma,
  i, k : integer;
begin
  result := Valor;
  for i := length(Valor) downto 1 do
  begin
    Soma := 1;
    for k := length(Valor) downto 1 do
      if k <> i then
        Soma := Soma + pos(result[k], Caracteres)*key;
    result[i] := caracteres[referente(pos(result[i], Caracteres) - soma)];
  end;
end;

function TmVAL.VerificaDFValido(Valor:String):boolean;
var
  A, B, C, D : String;
  DF1, DF2, DF3, DF4 : String;
begin
  result := false;
  if length(Valor) <> 20 then Exit;

  DF1 := copy(Valor, 5,  1);
  DF2 := copy(Valor, 10, 1);
  DF3 := copy(Valor, 15, 1);
  DF4 := copy(Valor, 20, 1);

  A := copy(Valor, 1,  4);
  B := copy(Valor, 6,  4);
  C := copy(Valor, 11, 4);
  D := copy(Valor, 16, 4);

  result := (pos(DF1, caracteres) = referente(pos(A[1], caracteres)+pos(A[2], caracteres)+pos(A[3], caracteres)+pos(A[4], caracteres))) and
            (pos(DF2, caracteres) = referente(pos(B[1], caracteres)+pos(B[2], caracteres)+pos(B[3], caracteres)+pos(B[4], caracteres))) and
            (pos(DF3, caracteres) = referente(pos(C[1], caracteres)+pos(C[2], caracteres)+pos(C[3], caracteres)+pos(C[4], caracteres))) and
            (pos(DF4, caracteres) = referente(pos(D[1], caracteres)+pos(D[2], caracteres)+pos(D[3], caracteres)+pos(D[4], caracteres))) ;
end;

function TmVAL.ColocaDF(Valor:String):String;
var
  A, B, C, D : String;
begin
  if length(Valor) <> 16 then Exit;
  A := copy(Valor,  1, 4);
  B := copy(Valor,  5, 4);
  C := copy(Valor,  9, 4);
  D := copy(Valor, 13, 4);

  A := A + Caracteres[Referente(pos(A[1], Caracteres)+pos(A[2], Caracteres)+pos(A[3], Caracteres)+pos(A[4], Caracteres))];
  B := B + Caracteres[Referente(pos(B[1], Caracteres)+pos(B[2], Caracteres)+pos(B[3], Caracteres)+pos(B[4], Caracteres))];
  C := C + Caracteres[Referente(pos(C[1], Caracteres)+pos(C[2], Caracteres)+pos(C[3], Caracteres)+pos(C[4], Caracteres))];
  D := D + Caracteres[Referente(pos(D[1], Caracteres)+pos(D[2], Caracteres)+pos(D[3], Caracteres)+pos(D[4], Caracteres))];

  result := A+B+C+D;
end;

function TmVAL.RetiraDF(Valor:String):String;
begin
  result := 'x';
  if length(Valor) <> 20 then Exit;
//  if not VerificaDFValido(Valor) then Exit;

  delete(valor, 20, 1);
  delete(valor, 15, 1);
  delete(valor, 10, 1);
  delete(valor, 5, 1);

  result := valor;
end;

procedure TmVAL.CRED_PegaDadosDaChave(dcChave:String; var dcSistema:String; var dcID:String; var dcValidade:String; var dcQtdeMaquinas:String);
begin
  if length(dcChave) <> 16 then
  begin
    dcSistema      := 'XX';
    dcID           := 'XXXXX';
    dcValidade     := 'XXXXXX';
    dcQtdeMaquinas := 'XXX';
  end
  else begin
    dcSistema      := copy(dcChave,  1, 2);
    dcID           := copy(dcChave,  3, 5);
    dcValidade     := copy(dcChave,  8, 6);
    dcQtdeMaquinas := copy(dcChave, 14, 3);
  end;
end;

function TmVAL.VerificaValoresValidos(vvValor:String; vvSistema:String; vvID:Integer; vvConfereID:boolean):boolean;
var
  Sistema, ID, Validade, Quantidade : String;
  Cond1, Cond2, Cond3, Cond4: boolean;
begin
  result := false;
  if length(vvValor) <> 16 then Exit;

  CRED_PegaDadosDaChave(vvValor, Sistema, ID, Validade, Quantidade);

  Cond1 := Sistema = vvSistema;
  Cond2 := (not vvConfereID)  or  ((ENumeroInteiro(ID))and(StrToInt(ID)=vvID));
  Cond3 := DataValida(Validade[1]+Validade[2]+'/'+Validade[3]+Validade[4]+'/'+Validade[5]+Validade[6]);
  Cond4 := ENumeroInteiro(Quantidade);

  result := Cond1 and Cond2 and Cond3 and Cond4;
end;

function TmVAL.CriptografaCreditos(Valor: String):String;
var
  i, indice : integer;
  Posic, key : integer;
  Tamanho : word;
begin
  Result := '';
  Valor := uppercase(Valor);
  Tamanho := length(Valor);
  Valor := Mistura(Valor);
  Valor := Embaralha(Valor, 17);

  for i := 1 to Tamanho do
  begin
    key := length(Result);
    Posic := pos(Valor[i], Caracteres);
    indice := Posic + i + (key * 7) + ((key * 5) mod i);
    indice := Referente(indice);
    Result := Result + caracteres[indice];
  end;

  result := ColocaDF(result);
end;

function TmVAL.DesCriptografaCreditos(Valor: String):String;
var
  i, indice : integer;
  Tamanho : word;
  Posic, key : integer;
begin
  Result := '';
  Valor := uppercase(Valor);
  Valor := RetiraDF(Valor);
  Tamanho := length(Valor);

  for i := 1 to Tamanho do
  begin
    key := length(Result);
    Posic := pos(Valor[i], Caracteres);
    indice := Posic - i - (key * 7) - ((key * 5) mod i);
    indice := referente(indice);
    Result := result + caracteres[indice];
  end;

  Result := Desembaralha(Result, 17);
  Result := Mistura(result);
end;

function QualquerCaracter: char;
const
  CARACTERES = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  T = 36-1;
begin
  result := CARACTERES[random(T)+1];
end;

function CRED_EnCripto_ID(ccID:Integer):String;
var
  ID, S : String;
begin
  ID := PoeZeros(ccID, 5);
  S := '1234567890';
  randomize;
  S[1]  := ID[1];
  S[2]  := QualquerCaracter;
  S[3]  := ID[2];
  S[4]  := QualquerCaracter;
  S[5]  := ID[3];
  S[6]  := QualquerCaracter;
  S[7]  := ID[4];
  S[8]  := QualquerCaracter;
  S[9]  := ID[5];
  S[10] := QualquerCaracter;

  result := Cripto(S);
end;

function CRED_DeCripto_ID(ccID: String):Integer;
var
  S : String;
begin
  result := 0;
  S := Descripto(ccID);
  if length(S) >= carID then S := S[1]+S[3]+S[5]+S[7]+S[9];
  result := StrToIntZ(S, 0);
end;

function CRED_EnCripto_MQ(ccMQ, ccID:Integer):String;
var
  ID, MQ, S : String;
begin
  ID := PoeZeros(ccID, 5);
  MQ := PoeZeros(ccMQ, 3);
  S := '1234567890';
  randomize;
  S[1]  := ID[1];
  S[2]  := MQ[1];
  S[3]  := QualquerCaracter;
  S[4]  := ID[2];
  S[5]  := MQ[2];
  S[6]  := ID[3];
  S[7]  := QualquerCaracter;
  S[8]  := MQ[3];
  S[9]  := ID[4];
  S[10] := ID[5];

  result := Cripto(S);
end;

function CRED_DeCripto_MQ(ccMQ: String; ccID:Integer):Integer;
var
  S : String;
  MQ, ID : String;
begin
  result := 0;
  MQ := '000';
  S := Descripto(ccMQ);
  if Length(S) >= carMQ then
  begin
    MQ := S[2]+S[5]+S[8];
    ID := S[1]+S[4]+S[6]+S[9]+S[10];
  end;
  if (ENumeroInteiro(ID)) and (StrToInt(ID) = ccID) then result := StrToIntZ(MQ, 0);
end;

function CRED_EnCripto_VAL(ccVAL:TDate; ccID:Integer):String;
var
  ID, VAL, S : String;
begin
  ID := PoeZeros(ccID, 5);
  VAL := FormatDateTime('ddmmyy', ccVAL);
  S := '12345678901234567890';
  randomize;
  S[1]  := ID[1];
  S[2]  := VAL[1];
  S[3]  := QualquerCaracter;
  S[4]  := ID[2];
  S[5]  := VAL[2];
  S[6]  := QualquerCaracter;
  S[7]  := ID[3];
  S[8]  := VAL[3];
  S[9]  := QualquerCaracter;
  S[10] := ID[4];
  S[11] := VAL[4];
  S[12] := QualquerCaracter;
  S[13] := ID[5];
  S[14] := VAL[5];
  S[15] := QualquerCaracter;
  S[16] := QualquerCaracter;
  S[17] := VAL[6];
  S[18] := QualquerCaracter;
  S[19] := QualquerCaracter;
  S[20] := QualquerCaracter;

  result := Cripto(S);
end;

function CRED_DeCripto_VAL(ccVAL: String; ccID:Integer):TDate;
var
  S : String;
  VAL, ID : String;
begin
  result := now -1;
  VAL := FormatDateTime('ddmmyy', result);
  S := Descripto(ccVAL);
  if Length(S) >= carVAL then
  begin
    VAL := S[2]+S[5]+S[8]+S[11]+S[14]+S[17];
    ID  := S[1]+S[4]+S[7]+S[10]+S[13];
  end;

  try
    if (ENumeroInteiro(ID)) and (StrToInt(ID) = ccID) then result := StrToDate(VAL[1]+VAL[2]+'/'+VAL[3]+VAL[4]+'/'+VAL[5]+VAL[6]);
  except
  end;
end;

function CRED_EnCripto_BLQ(ccBLQ:Boolean; ccID:Integer):String;
var
  ID, BLQ, S : String;
begin
  ID := PoeZeros(ccID, 5);
  if ccBLQ then BLQ := 'V'
           else BLQ := 'F';
  S := '123456789012345';
  randomize;
  S[1]  := QualquerCaracter;
  S[2]  := QualquerCaracter;
  S[3]  := ID[1];
  S[4]  := QualquerCaracter;
  S[5]  := ID[2];
  S[6]  := QualquerCaracter;
  S[7]  := BLQ[1];
  S[8]  := QualquerCaracter;
  S[9]  := ID[3];
  S[10] := QualquerCaracter;
  S[11] := ID[4];
  S[12] := QualquerCaracter;
  S[13] := ID[5];
  S[14] := QualquerCaracter;
  S[15] := QualquerCaracter;

  result := Cripto(S);
end;

function CRED_DeCripto_BLQ(ccBLQ: String; ccID:Integer):Boolean;
var
  S : String;
  BLQ, ID : String;
begin
  result := true;
  BLQ := 'V';
  S := Descripto(ccBLQ);
  if Length(S) >= carBLQ then
  begin
    BLQ := S[7];
    ID  := S[3]+S[5]+S[9]+S[11]+S[13];
  end;
  if (ENumeroInteiro(ID)) and (StrToInt(ID) = ccID) and (BLQ = 'F') then result := false;
end;

function CRED_EnCripto_EXP(ccEXP:Boolean; ccID:Integer):String;
var
  ID, EXP, S : String;
begin
  ID := PoeZeros(ccID, 5);
  if ccEXP then EXP := 'V'
           else EXP := 'F';
  S := '123456789012345';
  randomize;
  S[1]  := QualquerCaracter;
  S[2]  := QualquerCaracter;
  S[3]  := ID[1];
  S[4]  := QualquerCaracter;
  S[5]  := ID[2];
  S[6]  := QualquerCaracter;
  S[7]  := EXP[1];
  S[8]  := QualquerCaracter;
  S[9]  := ID[3];
  S[10] := QualquerCaracter;
  S[11] := ID[4];
  S[12] := QualquerCaracter;
  S[13] := ID[5];
  S[14] := QualquerCaracter;
  S[15] := QualquerCaracter;

  result := Cripto(S);
end;

function CRED_DeCripto_EXP(ccEXP: String; ccID:Integer):Boolean;
var
  S : String;
  EXP, ID : String;
begin
  result := true;
  EXP := 'V';
  S := Descripto(ccEXP);
  if Length(S) >= carEXP then
  begin
    EXP := S[7];
    ID  := S[3]+S[5]+S[9]+S[11]+S[13];
  end;

  if (ENumeroInteiro(ID)) and (StrToInt(ID) = ccID) and (EXP = 'F') then result := false;
end;

function CRED_EnCripto_ALT(ccALT, ccID:Integer):String;
var
  ID, ALT, S : String;
begin
  ID := PoeZeros(ccID, 5);
  ALT := PoeZeros(ccALT, 2);
  S := '1234567890';
  randomize;
  S[1]  := QualquerCaracter;
  S[2]  := ID[1];
  S[3]  := QualquerCaracter;
  S[4]  := ALT[1];
  S[5]  := ID[2];
  S[6]  := ID[3];
  S[7]  := ALT[2];
  S[8]  := QualquerCaracter;
  S[9]  := ID[4];
  S[10] := ID[5];

  result := Cripto(S);
end;

function CRED_DeCripto_ALT(ccALT: String; ccID:Integer):Integer;
var
  S : String;
  ALT, ID : String;
begin
  result := 0;
  ALT := '000';
  S := Descripto(ccALT);
  if Length(S) >= carALT then
  begin
    ALT := S[4]+S[7];
    ID := S[2]+S[5]+S[6]+S[9]+S[10];
  end;

  if (ENumeroInteiro(ID)) and (StrToInt(ID) = ccID) then result := StrToIntZ(ALT, 0);
end;


function TmVAL.VerificaSistemaExpirado(vsComTimer:Boolean=false):boolean;
begin
  result := false;
  if RegCreditos.Bloqueado then
  begin
    result := true;
    FechaAviso;

    if vsComTimer then
    begin
      Application.CreateForm(tfSistemaExpiradoTimer, fSistemaExpiradoTimer);
      fSistemaExpiradoTimer.ShowModal;
      fSistemaExpiradoTimer.Free;
    end
    else begin
      Application.CreateForm(tfSistemaExpirado, fSistemaExpirado);
      fSistemaExpirado.ShowModal;
      fSistemaExpirado.Free;
    end;
  end;
end;

function TmVAL.PegaInfoCreditos: boolean;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  S : String;
  Agora : TDateTime;
begin
  try
    EstaTabela := TIB_Query.Create(self);
    EstaTransacao := TIB_Transaction.Create(self);
    EstaTabela.IB_Connection := CM.IBTabela.IB_Connection;
    EstaTransacao.IB_Connection := CM.IBTabela.IB_Connection;
    EstaTabela.IB_Transaction := EstaTransacao;

    Agora := CM.NowDoServidor;
    try
      EstaTransacao.StartTransaction;
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('select * from SECSYSTEM S left join CREDITOS C on 1=1');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.Active := true;

      RegCreditos.ID := CRED_DeCripto_ID(EstaTabela.FieldByName('SECID').AsString);
      RegCreditos.RazaoSocial := Descripto(EstaTabela.FieldByName('SECRS').AsString);
      RegCreditos.CNPJ := Descripto(EstaTabela.FieldByName('SECCN').AsString);
      RegCreditos.QtdeMaquinas := CRED_DeCripto_MQ(EstaTabela.FieldByName('SECMQ').AsString, RegCreditos.ID);
      RegCreditos.Validade  := CRED_DeCripto_VAL(EstaTabela.FieldByName('VAL').AsString, RegCreditos.ID);
      RegCreditos.Bloqueado := CRED_DeCripto_BLQ(EstaTabela.FieldByName('BLQ').AsString, RegCreditos.ID);
      RegCreditos.Expirado  := CRED_DeCripto_EXP(EstaTabela.FieldByName('EXP').AsString, RegCreditos.ID);
      RegCreditos.QtdeAlteracoes := CRED_DeCripto_ALT(EstaTabela.FieldByName('ALT').AsString, RegCreditos.ID);

      RegCreditos.UltimaCarga    := EstaTabela.FieldByName('ULTIMACARGA').AsDateTime;
      RegCreditos.UltimaAbertura := EstaTabela.FieldByName('ULTIMAABERTURA').AsDateTime;
      RegCreditos.UltimaDataHora := EstaTabela.FieldByName('ULTIMADATAHORA').AsDateTime;
      RegCreditos.Sistema := 'FC';

      EstaTabela.Active := false;
      result := true;
    except
      result := false;
      RegCreditos.ID := 0;
      RegCreditos.Bloqueado := true;
      RegCreditos.Expirado  := true;
      RegCreditos.CNPJ      := '';
      RegCreditos.RazaoSocial    := '';
      RegCreditos.QtdeAlteracoes := 0;
      RegCreditos.QtdeMaquinas   := 0;
      RegCreditos.UltimaAbertura := Agora;
      RegCreditos.UltimaCarga    := Agora;
      RegCreditos.UltimaDataHora := Agora;
      RegCreditos.Validade       := StrToDate('01/01/1900');
      RegCreditos.Sistema := 'FC';
    end;
  finally
    CM.FechaTT(EstaTabela);
    EstaTabela.Free;
    EstaTransacao.Free;
  end;
end;

procedure TmVAL.ColocaCreditos(ccDataValidade:TDate; ccQuantMaquinas:Integer; ccID:Integer; ccRegistraCliente:Boolean);
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  S  : String;
  I : Integer;
begin
  try
    with CM do
    begin
      Screen.Cursor := crHourGlass;
      CM.AbreAviso('Atribuindo Créditos');
      EstaTabela := TIB_Query.Create(self);
      EstaTransacao := TIB_Transaction.Create(self);
      EstaTabela.IB_Connection := IBTabela.IB_Connection;
      EstaTransacao.IB_Connection := IBTabela.IB_Connection;
      EstaTabela.IB_Transaction := EstaTransacao;
      try
        EstaTransacao.StartTransaction;
        if not ccRegistraCliente then
        begin
          EstaTabela.Active := false;
          EstaTabela.SQL.Clear;
          EstaTabela.SQL.Add('select SECID from SECSYSTEM');
          if not EstaTabela.Prepared then EstaTabela.Prepare;
          EstaTabela.Active := true;
          I := CRED_DeCripto_ID(EstaTabela.FieldByName('SECID').AsString);
          if I <> ccID then
          begin
            FechaAviso;
            CM.MensagemDeErro('Código de Cliente não confere');
            raise Exception.Create('Código de Cliente não confere');
          end;
        end
        else begin
          if not CM.DefineValores(moRetaguarda, 'SECSYSTEM', ['SECID', CRED_EnCripto_ID(ccID)], '', true) then Exception.Create('SQL não pode ser executado');
        end;

        S := CRED_EnCripto_MQ(ccQuantMaquinas, ccID);
        if not CM.DefineValores(moRetaguarda, 'SECSYSTEM', ['SECMQ', S], '', true) then Exception.Create('SQL não pode ser executado');

        if not CM.DefineValores(moRetaguarda, 'CREDITOS', ['VAL',          CRED_EnCripto_VAL(ccDataValidade, ccID),
                                                              'BLQ',          CRED_EnCripto_BLQ(false, ccID),
                                                              'EXP',          CRED_EnCripto_EXP(false, ccID),
                                                              'ALT',          CRED_EnCripto_ALT(0, ccID),
                                                              'ULTIMACARGA',  CM.NowDoServidor], '', true) then Exception.Create('SQL não pode ser executado');
      except
        EstaTabela.IB_Transaction.RollBack;
        FechaAviso;
        CM.MensagemDeErro('Não foi possível atribuir Créditos ao sistema');
      end;
    end;
  finally
    CM.FechaTT(EstaTabela);
    EstaTabela.Free;
    EstaTransacao.Free;
    Screen.Cursor := crDefault;
    FechaAviso;
  end;
end;

procedure TmVAL.GravaIDCreditos(giCNPJ, giRazaoSocial:String);
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  IDStr : String;
begin
  try
    with CM do
    begin
      Screen.Cursor := crHourGlass;
      CM.AbreAviso('Atribuindo Créditos');
      EstaTabela := TIB_Query.Create(self);
      EstaTransacao := TIB_Transaction.Create(self);
      EstaTabela.IB_Connection := IBTabela.IB_Connection;
      EstaTransacao.IB_Connection := IBTabela.IB_Connection;
      EstaTabela.IB_Transaction := EstaTransacao;
      try
        EstaTabela.IB_Transaction.StartTransaction;
        EstaTabela.Active := false;
        EstaTabela.SQL.Clear;
        EstaTabela.SQL.Add('Update SECSYSTEM set SECCN=:SECCN, SECRS=:SECRS');
        if not EstaTabela.Prepared then EstaTabela.Prepare;
        EstaTabela.ParamByName('SECCN').AsString := Cripto(giCNPJ);
        EstaTabela.ParamByName('SECRS').AsString := Cripto(giRazaoSocial);
        EstaTabela.ExecSQL;
        EstaTabela.IB_Transaction.Commit;
      except
        EstaTabela.IB_Transaction.Rollback;
        CM.MensagemDeErro('Não foi possível atribuir Créditos ao sistema');
      end;
    end;
  finally
    EstaTabela.Free;
    EstaTransacao.Free;
    Screen.Cursor := crDefault;
    FechaAviso;
  end;
end;

procedure TmVAL.AtualizaSituacaoDosCreditos;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  IDStr : String;
  Expirado, Bloqueado : Boolean;
  Agora : TDateTime;
begin
  try
    with CM do
    begin
      EstaTabela := TIB_Query.Create(self);
      EstaTransacao := TIB_Transaction.Create(self);
      EstaTabela.IB_Connection := IBTabela.IB_Connection;
      EstaTransacao.IB_Connection := IBTabela.IB_Connection;
      EstaTabela.IB_Transaction := EstaTransacao;
      try
        Agora := CM.NowDoServidor;
        Expirado := DataHoraInicial(Agora) > DataHoraFinal(RegCreditos.Validade);
        RegCreditos.Atraso := trunc(Agora - RegCreditos.Validade);
        Bloqueado := RegCreditos.Atraso > credDiasParaBloqueio;

        EstaTabela.IB_Transaction.StartTransaction;
        if Expirado then
        begin
          EstaTabela.Active := false;
          EstaTabela.SQL.Clear;
          EstaTabela.SQL.Add('Update CREDITOS set EXP = :EXP');
          if not EstaTabela.Prepared then EstaTabela.Prepare;
          EstaTabela.ParamByName('EXP').AsString := BooleanToChar(true);
          EstaTabela.ExecSQL;
        end;

        if Bloqueado then
        begin
          EstaTabela.Active := false;
          EstaTabela.SQL.Clear;
          EstaTabela.SQL.Add('Update CREDITOS set BLQ = :BLQ');
          if not EstaTabela.Prepared then EstaTabela.Prepare;
          EstaTabela.ParamByName('BLQ').AsString := BooleanToChar(true);
          EstaTabela.ExecSQL;
        end;

        EstaTabela.IB_Transaction.Commit;
      except
        EstaTabela.IB_Transaction.Rollback;
      end;
    end;
  finally
    mVal.PegaInfoCreditos;
    EstaTabela.Free;
    EstaTransacao.Free;
    Screen.Cursor := crDefault;
    FechaAviso;
  end;
end;


end.


