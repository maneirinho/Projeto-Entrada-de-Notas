//ok
unit UNovaContaAPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, DUtilit, UComp, Buttons, UComum,
  IboSuperCombo, JvToolEdit, JvBaseEdits, JvExMask, JvSpin, JvExControls,
  JvGradient, MessageFunctions;

const
  tpCheque   = 0;  charCheque   = 'C';
  tpTitulo   = 1;  charTitulo   = 'T';
  tpDeposito = 2;  charDeposito = 'D';
  tpCarteira = 3;  charCarteira = 'V';

type
  TregParcelas = record
    Documento : String;
    Parcela : String;
    Valor : Currency;
    Vencimento : TDate;
    Historico : String;
  end;

  TfNovaContaAPagar = class(TForm)
    RadioGroup1: TRadioGroup;
    bt_Cancelar: TBitBtn;
    bt_Ok: TBitBtn;
    GroupBox1: TGroupBox;
    EditContaBancaria: TIboSuperCombo;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    lbParcelas: TLabel;
    gbPeriodicidade: TGroupBox;
    chMensal: TCheckBox;
    Label7: TLabel;
    chIncNumDoc: TCheckBox;
    edNumParcelas: TJvSpinEdit;
    EditPeriodo: TJvSpinEdit;
    EditCodFornecedor: TEdit;
    btPesquisaFornecedor: TSpeedButton;
    EditNomeFornecedor: TEdit;
    Label16: TLabel;
    EditRefNotaFiscal: TEdit;
    ScrollBox1: TScrollBox;
    JvGradient2: TJvGradient;
    Panel1: TPanel;
    LabelValor: TLabel;
    LabelVencimento: TLabel;
    LabelObs: TLabel;
    edDocumento1: TEdit;
    edParcela1: TEdit;
    edVencimento1: TJvDateEdit;
    edValor1: TJvCalcEdit;
    edHistorico1: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    lbTotalParcelas: TLabel;
    edTotalParcelas: TJvCalcEdit;
    edEntrada: TJvDateEdit;
    lbEntrada: TLabel;
    lbValorTotal: TLabel;
    edValorTotal: TJvCalcEdit;
    bt_Calcula: TBitBtn;
    edDocumentoInicial: TEdit;
    edParcelaInicial: TEdit;
    lbDocumentoInicial: TLabel;
    lbParcelaInicial: TLabel;
    btReplicarHistorico: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bt_CancelarClick(Sender: TObject);
    procedure bt_OkClick(Sender: TObject);
    procedure chMensalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditCodFornecedorChange(Sender: TObject);
    procedure EditCodFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCodFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure btPesquisaFornecedorClick(Sender: TObject);
    procedure btReplicarHistoricoClick(Sender: TObject);
    procedure bt_CalculaClick(Sender: TObject);
    procedure edNumParcelasChange(Sender: TObject);
    procedure edValorTotalChange(Sender: TObject);
    procedure edEntradaChange(Sender: TObject);
    procedure edDocumentoInicialChange(Sender: TObject);
    procedure edParcelaInicialChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure EditNomeFornecedorChange(Sender: TObject);
  private
    QuantParcelas : Integer;
    TaCriandoComponentes : boolean;
    TaCalculando         : boolean;
    VetParcelas : array of TRegParcelas;
    function TemErro: boolean;
    procedure Calcula;
    procedure DetonaComponentes;
    procedure CriaComponentes(ccparcelas: integer);
    procedure EventoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EventoOnChangeDoValor(Sender: TObject);
    procedure CalculaSomaTotal;
    procedure DistribuirValorParcelas;
    procedure DistribuirVencimentos;
    procedure DistribuirDocumentos;
    procedure DistribuirParcelas;
    procedure JogaParcelasParaVetor;
  public
    SeqContaAPagar: Integer;
    CD_NOTA : Integer;
  end;

var
  fNovaContaAPagar: TfNovaContaAPagar;

implementation

uses UConstVar, UDataMod, IB_Components, UModUsuarios, UModPesquisa, DBFunctions;

{$R *.dfm}

procedure TfNovaContaAPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfNovaContaAPagar.bt_CancelarClick(Sender: TObject);
begin
  Close;
end;

function TfNovaContaAPagar.TemErro: boolean;
var
  JaTem : boolean;
  i : word;
begin
  result := false;

  for i := 1 to QuantParcelas do
    TEdit(FindComponent('edDocumento'+IntToStr(i))).Text := TiraEspacos(TEdit(FindComponent('edDocumento'+IntToStr(i))).Text);

  if (not result) and (Vazio(EditNomeFornecedor.Text)) then
  begin
    Result := true;
    MensagemDeAtencao('É necessário selecionar um Fornecedor');
    EditCodFornecedor.SetFocus;
  end;

  for i := 1 to QuantParcelas do
  begin
    if (not result) and (Vazio(TiraCaracteres(TJvDateEdit(FindComponent('edVencimento'+IntToStr(i))).Text, ['/']))) then
    begin
      Result := true;
      MensagemDeAtencao('É necessário informar o vencimento.');
      TJvDateEdit(FindComponent('edVencimento'+IntToStr(i))).SetFocus;
    end;
  end;

  if (not result) and  (edTotalParcelas.Visible) and (edTotalParcelas.Value = 0) then
  begin
    Result := true;
    MensagemDeErro('O valor total da conta não pode estar zerado.');
    edValorTotal.SetFocus;
  end;

  if (not result) and (RadioGroup1.ItemIndex = tpCheque) and (Vazio(EditNomeFornecedor.Text)) then
  begin
    Result := true;
    MensagemDeAtencao('É necessário selecionar uma conta bancária para o débito');
    EditContaBancaria.SetFocus;
  end;

end;

procedure TfNovaContaAPagar.bt_OkClick(Sender: TObject);
var
  TipoDocumento : char;
  i : word;
  DataVencimento : TDate;
  Num_Documento, Parcela : String;
  AntesBarra, DepoisBarra : String;
begin
  if TemErro then Exit;
  if Vazio(EditContaBancaria.Edit2Text) then EditContaBancaria.Edit1Text := '';
  case RadioGroup1.ItemIndex of
    tpCheque   : TipoDocumento := charCheque;
    tpTitulo   : TipoDocumento := charTitulo;
    tpDeposito : TipoDocumento := charDeposito;
    tpCarteira : TipoDocumento := charCarteira;
  end;

  with DtM do begin
    if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
    try
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Insert into CONTASAPAGAR');
      IBTabela.SQL.Add('( CD_FORNECEDOR,  TIPOPAGAMENTO,  EMISSAO,  CD_CONTABANCARIA,  REF_NOTAFISCAL,  LOGIN,  BAIXADO, ');
      IBTabela.SQL.Add(' VENCIMENTO,  VALOR,  PARCELA,  NUM_DOCUMENTO,  HISTORICO,  CD_NOTA )');
      IBTabela.SQL.Add('Values');
      IBTabela.SQL.Add('(:CD_FORNECEDOR, :TIPOPAGAMENTO, :EMISSAO, :CD_CONTABANCARIA, :REF_NOTAFISCAL, :LOGIN, :BAIXADO, ');
      IBTabela.SQL.Add(':VENCIMENTO, :VALOR, :PARCELA, :NUM_DOCUMENTO, :HISTORICO, :CD_NOTA )');

      JogaParcelasParaVetor;
      //  Foi necessário jogar tudo para um vetor primeiro porque tava dando erro...
      for i := 1 to QuantParcelas do
      begin
        if not IBTabela.Prepared then IBTabela.Prepare;
        IBTabela.ParamByName('CD_FORNECEDOR').AsString    := EditCodFornecedor.Text;
        IBTabela.ParamByName('TIPOPAGAMENTO').AsString    := TipoDocumento;
        IBTabela.ParamByName('EMISSAO').AsDateTime        := CM.NowDoServidor;
        IBTabela.ParamByName('CD_CONTABANCARIA').AsString := EditContaBancaria.Edit1Text;
        IBTabela.ParamByName('REF_NOTAFISCAL').AsString   := EditRefNotaFiscal.Text;
        IBTabela.ParamByName('CD_NOTA').AsInteger         := CD_NOTA;
        IBTabela.ParamByName('LOGIN').AsString            := RegUsuario.Login;
        IBTabela.ParamByName('BAIXADO').AsString          := 'F';
        IBTabela.ParamByName('VALOR').AsCurrency          := VetParcelas[i-1].Valor;
        IBTabela.ParamByName('VENCIMENTO').AsDateTime     := VetParcelas[i-1].Vencimento;
        IBTabela.ParamByName('PARCELA').AsString          := VetParcelas[i-1].Parcela;
        IBTabela.ParamByName('NUM_DOCUMENTO').AsString    := VetParcelas[i-1].Documento;
        IBTabela.ParamByName('HISTORICO').AsString        := VetParcelas[i-1].Historico;
        IBTabela.ExecSQL;
      end;

      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('update FORNECEDORES set ');
      IBTabela.SQL.Add('CP_ULTIMOTIPODOC = :CP_ULTIMOTIPODOC,');
      IBTabela.SQL.Add('CP_QTDPARCELAS   = :CP_QTDPARCELAS,');
      IBTabela.SQL.Add('CP_PERIODICIDADE = :CP_PERIODICIDADE,');
      IBTabela.SQL.Add('CP_PERIODMENSAL  = :CP_PERIODMENSAL,');
      IBTabela.SQL.Add('CP_CONTABANCARIA = :CP_CONTABANCARIA');
      IBTabela.SQL.Add('where CD_FORNECEDOR = :CD_FORNECEDOR');
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.ParamByName('CD_FORNECEDOR').AsString     := EditCodFornecedor.Text;
      IBTabela.ParamByName('CP_ULTIMOTIPODOC').AsString  := TipoDocumento;
      IBTabela.ParamByName('CP_QTDPARCELAS').AsInteger   := trunc(edNumParcelas.Value);
      IBTabela.ParamByName('CP_PERIODICIDADE').AsInteger := trunc(EditPeriodo.Value);
      IBTabela.ParamByName('CP_PERIODMENSAL').AsString   := BooleanToChar(chMensal.Checked);
      IBTabela.ParamByName('CP_CONTABANCARIA').AsInteger := StrToIntZ(EditContaBancaria.Edit1Text, 0);
      IBTabela.ExecSQL;

      IBTabela.IB_Transaction.Commit;
      MensagemDeInformacao('Ok');

      Close;
    except
      on E: exception do begin
        LogDeErros(E.Message);
        IBTabela.IB_Transaction.RollBack;
        MensagemDeErro('Não foi possível incluir esta conta');
      end;
    end;
  end;
end;

procedure TfNovaContaAPagar.DetonaComponentes;
var
  i : Integer;
begin
  for i := 2 to QuantParcelas do
  begin
    TJvCalcEdit(FindComponent('edValor'+IntToStr(i))).Free;
    TJvDateEdit(FindComponent('edVencimento'+IntToStr(i))).Free;
    TEdit(FindComponent('edDocumento'+IntToStr(i))).Free;
    TEdit(FindComponent('edParcela'+IntToStr(i))).Free;
    TEdit(FindComponent('edHistorico'+IntToStr(i))).Free;
  end;
  Refresh;
  Repaint;
end;

Procedure TfNovaContaAPagar.CalculaSomaTotal;
var
  ValorTotalParcelas : Currency;
  i : integer;
begin
  if TaCriandoComponentes then Exit;

  ValorTotalParcelas := 0;
  for i := 1 to QuantParcelas do
    ValorTotalParcelas := ValorTotalParcelas + TJvCalcEdit(FindComponent('edValor'+IntToStr(i))).Value;

  edTotalParcelas.Value := ValorTotalParcelas;

  if (edTotalParcelas.Value = edValorTotal.Value) then
  begin
    edTotalParcelas.Color := clYellow;
    edTotalParcelas.Font.Color := clBlack;
  end
  else begin
    edTotalParcelas.Color := clRed;
    edTotalParcelas.Font.Color := clWhite;
  end;
end;

procedure TfNovaContaAPagar.EventoOnChangeDoValor(Sender: TObject);
begin
  if TaCriandoComponentes or TaCalculando then exit;
  CalculaSomaTotal;
end;

procedure TfNovaContaAPagar.EventoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Nome : String;
  Numero : Integer;
begin
  if TaCriandoComponentes then exit;

  case key of
    vk_Down :
    begin
      Key := 0;

      Nome := TControl(Sender).Name;

{             if Sender is TJvCalcEdit then Nome := TJvCalcEdit(Sender).Name
      else if Sender is TJvDateEdit then Nome := TJvDateEdit(Sender).Name
      else if Sender is TEdit       then Nome := TEdit(Sender).Name;}

      Numero := StrToInt(DeixaNumeros(Nome));
      Nome   := TiraNumeros(Nome);

      if Numero < QuantParcelas then
      begin
        Numero := Numero + 1;
        if Sender is TJvCalcEdit then TJvCalcEdit(FindComponent(Nome+IntToStr(Numero))).SetFocus
        else if Sender is TJvDateEdit then TJvDateEdit(FindComponent(Nome+IntToStr(Numero))).SetFocus
        else if Sender is TEdit then TEdit(FindComponent(Nome+IntToStr(Numero))).SetFocus;
      end;
    end;
    vk_Up :
    begin
      Key := 0;
      Nome := TControl(Sender).Name;

{           if Sender is TJvCalcEdit then Nome := TJvCalcEdit(Sender).Name
      else if Sender is TJvDateEdit then Nome := TJvDateEdit(Sender).Name
      else if Sender is TEdit       then Nome := TEdit(Sender).Name^}

      Numero := StrToInt(DeixaNumeros(Nome));
      Nome   := TiraNumeros(Nome);

      if Numero > 1 then
      begin
        Numero := Numero - 1;
        if Sender is TJvCalcEdit then TJvCalcEdit(FindComponent(Nome+IntToStr(Numero))).SetFocus
        else if Sender is TJvDateEdit then TJvDateEdit(FindComponent(Nome+IntToStr(Numero))).SetFocus
        else if Sender is TEdit then TEdit(FindComponent(Nome+IntToStr(Numero))).SetFocus;
      end;
    end;
  end;
end;

procedure TfNovaContaAPagar.CriaComponentes(ccparcelas:integer);
var
  i  : Integer;
  EditValor : TJvCalcEdit;
  EditVenc  : TJvDateEdit;
  EditHist  : TEdit;
  EditDoc   : TEdit;
  EditParc  : TEdit;
begin
  TaCriandoComponentes    := true;

  for i := 2 to ccparcelas do
  begin
    // Cria o Edit para Documento
    EditDoc := TEdit.Create(Self);
    EditDoc.Top := i*edDocumento1.Height + (i*3) - (edDocumento1.Height);
    EditDoc.parent := ScrollBox1;
    EditDoc.left := edDocumento1.left;
    EditDoc.Width := edDocumento1.Width;
    EditDoc.Name := 'edDocumento'+intToStr(i);
    EditDoc.Text := '';
    EditDoc.CharCase := ecUpperCase;
    EditDoc.OnKeyDown := EventoKeyDown;
    EditDoc.Tag  := 999;

    // Cria o Edit para Parcela
    EditParc := TEdit.Create(Self);
    EditParc.Top := i*edParcela1.Height + (i*3) - (edParcela1.Height);
    EditParc.parent := ScrollBox1;
    EditParc.left := edParcela1.left;
    EditParc.Width := edParcela1.Width;
    EditParc.Name := 'edParcela'+intToStr(i);
    EditParc.Text := '';
    EditParc.CharCase := ecUpperCase;
    EditParc.OnKeyDown := EventoKeyDown;
    EditParc.Tag  := 999;

    // Cria o Edit para Vencimento
    EditVenc := TJvDateEdit.Create(Self);
    EditVenc.Top := i*edVencimento1.Height + (i*3) - (edVencimento1.Height);
    EditVenc.parent := ScrollBox1;
    EditVenc.left := edVencimento1.left;
    EditVenc.Width := edVencimento1.Width;
    EditVenc.Name := 'edVencimento'+intToStr(i);
    EditVenc.Text := '';
    EditVenc.OnKeyDown := EventoKeyDown;
    EditVenc.Tag  := 999;

    // Cria o Edit para Valor
    EditValor := TJvCalcEdit.Create(Self);
    EditValor.Top := i* edValor1.Height + (i*3) - (edValor1.Height);
    EditValor.parent := ScrollBox1;
    EditValor.ButtonWidth := 0;
    EditValor.left := edValor1.Left;
    EditValor.Width := edValor1.Width;
    EditValor.DisplayFormat := ',0.00;-,0.00';
    EditValor.Name := 'edValor'+intToStr(i);
    EditValor.Text := '';
    EditValor.OnChange := EventoOnChangeDoValor;
    EditValor.OnKeyDown := EventoKeyDown;
    EditValor.Tag  := 999;

    // Cria o Edit para Histórico
    EditHist := TEdit.Create(Self);
    EditHist.Top := i*edHistorico1.Height + (i*3) - (edHistorico1.Height);
    EditHist.parent := ScrollBox1;
    EditHist.left := edHistorico1.left;
    EditHist.Width := edHistorico1.Width;
    EditHist.Name := 'edHistorico'+intToStr(i);
    EditHist.Text := '';
    EditHist.CharCase := ecUpperCase;
    EditHist.OnKeyDown := EventoKeyDown;
    EditHist.Tag  := 999;

  end;
  Refresh;
  Repaint;
  QuantParcelas := ccParcelas;
  TaCriandoComponentes := false;
end;

Procedure TfNovaContaAPagar.Calcula;
begin
//  if (not fCrediario.Visible) or TaPreenchendo or TaCriandoComponentes then Exit;
  try
    try
      Screen.Cursor := crHourGlass;
      ScrollBox1.Visible := false;
      DetonaComponentes;
      QuantParcelas := trunc(edNumParcelas.Value);
      TaCalculando := true;
      TaCriandoComponentes := true;

      CriaComponentes(QuantParcelas);
      repeat until not TaCriandoComponentes;

      DistribuirValorParcelas;
      DistribuirVencimentos;
      DistribuirDocumentos;
      DistribuirParcelas;

      TaCriandoComponentes := false;
      CalculaSomaTotal;

      bt_Calcula.Font.Style := [];
      bt_Calcula.Font.Color := clBlack;
    except
    end;
  finally
    TaCalculando := false;
    ScrollBox1.Visible := true;
    Screen.Cursor := crDefault;
//    FechaAviso;
  end;
end;

procedure TfNovaContaAPagar.chMensalClick(Sender: TObject);
begin
  if ChMensal.Checked then
  begin
    DesligaComponente(self, Label7);
    DesligaComponente(self, EditPeriodo);
  end
  else begin
    LigaComponente(self, Label7);
    LigaComponente(self, EditPeriodo);
  end;
  DistribuirVencimentos;
end;

procedure TfNovaContaAPagar.FormShow(Sender: TObject);
begin
  edEntrada.Date := CM.NowDoServidor; 
  if StrToIntZ(EditCodFornecedor.Text, 0) < 1 then EditCodFornecedor.Clear;
  edNumParcelasChange(self);

  FechaAviso;
  Screen.Cursor := crDefault;
end;

procedure TfNovaContaAPagar.EditCodFornecedorChange(Sender: TObject);
begin
  CM.BuscaRegistro(EditCodFornecedor, EditNomeFornecedor, 'FORNECEDORES', 'CD_FORNECEDOR', 'NM_FORNECEDOR', '');
end;

procedure TfNovaContaAPagar.EditCodFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if CM.F3OuAltDown(key, shift) then btPesquisaFornecedor.Click;
end;

procedure TfNovaContaAPagar.EditCodFornecedorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in SetNumeros) then
    ItemEsc := mPesq.PesquisaDireto(key, pqFornecedores, [mdInclusao, mdAlteracao], EditCodFornecedor);
end;

procedure TfNovaContaAPagar.btPesquisaFornecedorClick(Sender: TObject);
begin
  ItemEsc := mPesq.Pesquisa(pqFornecedores, [mdInclusao, mdAlteracao], EditCodFornecedor, EditNomeFornecedor.Text);
end;

procedure TfNovaContaAPagar.btReplicarHistoricoClick(Sender: TObject);
var
  i : word;
begin
  for i := 2 to QuantParcelas do
    TEdit(FindComponent('edHistorico'+IntToStr(i))).Text := edHistorico1.Text;
end;

procedure TfNovaContaAPagar.bt_CalculaClick(Sender: TObject);
begin
  Calcula;
end;

procedure TfNovaContaAPagar.JogaParcelasParaVetor;
var
  i : word;
begin
  setLength(VetParcelas, QuantParcelas);
  for i := 0 to QuantParcelas -1 do
  begin
    VetParcelas[i].Valor      := TJvCalcEdit(FindComponent('edValor'+IntToStr(i+1))).Value;
    VetParcelas[i].Vencimento := TJvDateEdit(FindComponent('edVencimento'+IntToStr(i+1))).Date;
    VetParcelas[i].Documento  := TEdit(FindComponent('edDocumento'+IntToStr(i+1))).Text;
    VetParcelas[i].Parcela    := TEdit(FindComponent('edParcela'+IntToStr(i+1))).Text;
    VetParcelas[i].Historico  := TEdit(FindComponent('edHistorico'+IntToStr(i+1))).Text;
  end;
end;

procedure TfNovaContaAPagar.edNumParcelasChange(Sender: TObject);
var
  Ligado : boolean;
begin
  Ligado := edNumParcelas.Value > 1;

  lbValorTotal.Visible        := Ligado;
  edValorTotal.Visible        := Ligado;
  lbEntrada.Visible           := Ligado;
  edEntrada.Visible           := Ligado;
  gbPeriodicidade.Visible     := Ligado;
  lbDocumentoInicial.Visible  := Ligado;
  edDocumentoInicial.Visible  := Ligado;
  chIncNumDoc.Visible         := Ligado;
  lbParcelaInicial.Visible    := Ligado;
  edParcelaInicial.Visible    := Ligado;
  lbTotalParcelas.Visible     := Ligado;
  edTotalParcelas.Visible     := Ligado;
  btReplicarHistorico.Visible := Ligado;

  Calcula;
end;

procedure TfNovaContaAPagar.DistribuirValorParcelas;
var
  i : word;
  dif: Currency;
  ValorParcela: Currency;
begin
  ValorParcela := edValorTotal.Value / QuantParcelas;

  for i := 1 to QuantParcelas do
    TJvCalcEdit(FindComponent('edValor'+IntToStr(i))).Value := ValorParcela;

  dif := (ArredondaReal(ValorParcela, 2) * edNumParcelas.Value) - edValorTotal.Value;
  try TJvCalcEdit(FindComponent('edValor'+IntToStr(QuantParcelas))).Value := TJvCalcEdit(FindComponent('edValor'+IntToStr(QuantParcelas))).Value - dif;   except end;
end;

procedure TfNovaContaAPagar.DistribuirVencimentos;
var
  i : word;
begin
  for i := 1 to QuantParcelas do
  begin
    if i = 1 then
      TJvDateEdit(FindComponent('edVencimento'+IntToStr(i))).Date := edEntrada.Date
    else begin
      if chMensal.Checked then //Periodo Mensal?
        TJvDateEdit(FindComponent('edVencimento'+IntToStr(i))).Date := IncMonth(edEntrada.Date, i-1)
      else
        TJvDateEdit(FindComponent('edVencimento'+IntToStr(i))).Date := edEntrada.Date + trunc(EditPeriodo.Value)*(i-1);
    end;
  end;
end;

procedure TfNovaContaAPagar.DistribuirDocumentos;
var
  i : word;
  SeqDocumento : String;
begin
  SeqDocumento := edDocumentoInicial.Text;

  for i := 1 to QuantParcelas do
  begin
    if i = 1 then
      TEdit(FindComponent('edDocumento'+IntToStr(i))).Text := edDocumentoInicial.Text
    else begin
      if chIncNumDoc.Checked then
        TEdit(FindComponent('edDocumento'+IntToStr(i))).Text := SeqDocumento
      else
        TEdit(FindComponent('edDocumento'+IntToStr(i))).Text := edDocumentoInicial.Text;
    end;
    SeqDocumento := IncrementaString(SeqDocumento, false);
  end;
end;

procedure TfNovaContaAPagar.DistribuirParcelas;
var
  i : word;
  SeqParcela : String;
begin
  if vazio(edParcelaInicial.Text) then edParcelaInicial.Text := '1';
  SeqParcela   := edParcelaInicial.Text;

  for i := 1 to QuantParcelas do
  begin
    if i = 1 then TEdit(FindComponent('edParcela'+IntToStr(i))).Text := edParcelaInicial.Text
             else TEdit(FindComponent('edParcela'+IntToStr(i))).Text := SeqParcela;
    SeqParcela := IncrementaString(SeqParcela, true);
  end;
end;


procedure TfNovaContaAPagar.edValorTotalChange(Sender: TObject);
begin
  DistribuirValorParcelas;
end;

procedure TfNovaContaAPagar.edEntradaChange(Sender: TObject);
begin
  DistribuirVencimentos;
end;

procedure TfNovaContaAPagar.edDocumentoInicialChange(Sender: TObject);
begin
  DistribuirDocumentos;
end;

procedure TfNovaContaAPagar.edParcelaInicialChange(Sender: TObject);
begin
  DistribuirParcelas;
end;

procedure TfNovaContaAPagar.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_F10 : bt_Ok.Click;
  end;
end;

procedure TfNovaContaAPagar.FormCreate(Sender: TObject);
begin
  QuantParcelas := 1;
  CD_NOTA := 0;
  edValor1.OnChange       := EventoOnChangeDoValor;
  edDocumento1.OnKeyDown  := EventoKeyDown;
  edParcela1.OnKeyDown    := EventoKeyDown;
  edVencimento1.OnKeyDown := EventoKeyDown;
  edValor1.OnKeyDown      := EventoKeyDown;
  edHistorico1.OnKeyDown  := EventoKeyDown;
end;

procedure TfNovaContaAPagar.EditNomeFornecedorChange(Sender: TObject);
begin
  if Vazio(EditNomeFornecedor.Text) then Exit;
  with DtM do begin
    try
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Select coalesce(CP_ULTIMOTIPODOC, ''T'') as CP_ULTIMOTIPODOC, ');
      IBTabela.SQL.Add('       coalesce(CP_QTDPARCELAS, 1)       as CP_QTDPARCELAS,   ');
      IBTabela.SQL.Add('       coalesce(CP_PERIODICIDADE, 30)    as CP_PERIODICIDADE, ');
      IBTabela.SQL.Add('       coalesce(CP_PERIODMENSAL, ''F'')  as CP_PERIODMENSAL,  ');
      IBTabela.SQL.Add('       coalesce(CP_CONTABANCARIA, 0)     as CP_CONTABANCARIA  ');
      IBTabela.SQL.Add('from FORNECEDORES                                             ');
      IBTabela.SQL.Add('where CD_FORNECEDOR = :CD_FORNECEDOR                          ');
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.ParamByName('CD_FORNECEDOR').AsString := EditCodFornecedor.Text;
      IBTabela.Active := true;
      case StrToChar(IBTabela.FieldByName('CP_ULTIMOTIPODOC').AsString, 'T') of
        'C': RadioGroup1.ItemIndex := tpCheque;
        'T': RadioGroup1.ItemIndex := tpTitulo;
        'D': RadioGroup1.ItemIndex := tpDeposito;
        'V': RadioGroup1.ItemIndex := tpCarteira;
      end;
      edNumParcelas.Value := IBTabela.FieldByName('CP_QTDPARCELAS').AsInteger;
      EditPeriodo.Value   := IBTabela.FieldByName('CP_PERIODICIDADE').AsInteger;
      chMensal.Checked    := IBTabela.FieldByName('CP_PERIODMENSAL').AsString = 'V';
      EditContaBancaria.Edit1Text := IBTabela.FieldByName('CP_CONTABANCARIA').AsString;
    finally
      fDB.FechaTT(IBTabela);
    end;
  end;
end;

end.
