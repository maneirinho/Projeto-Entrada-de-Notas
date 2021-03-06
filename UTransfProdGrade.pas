//ok
unit UTransfProdGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IB_Access, IB_Components, Dialogs, ExtCtrls, StdCtrls, Buttons, MessageFunctions;

type
  TfTransfProdGrade = class(TForm)
    Panel1: TPanel;
    PanelBotoes: TPanel;
    PanelProduto: TPanel;
    GroupBox9: TGroupBox;
    SpeedButtonProduto: TSpeedButton;
    EditCodProduto: TEdit;
    EditNomeProduto: TEdit;
    btOk: TBitBtn;
    btCancelar: TBitBtn;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    lbCdProduto: TLabel;
    lbNmProduto: TLabel;
    PanelNomeGrade: TPanel;
    GroupBox1: TGroupBox;
    edNmGrade: TEdit;
    edCdGrade: TEdit;
    lbCodNovaGrade: TLabel;
    lbDescricaoNovaGrade: TLabel;
    PanelNovoCodigoProduto: TPanel;
    GroupBox2: TGroupBox;
    btGerarCodigoGrade: TSpeedButton;
    btGerarCodigoProduto: TSpeedButton;
    lbQuantDigitosGrade: TLabel;
    lbQuantDigitosProduto: TLabel;
    Label1: TLabel;
    edCodNovoProduto: TEdit;
    Label2: TLabel;
    edDescricaoNovoProduto: TEdit;
    procedure btCancelarClick(Sender: TObject);
    procedure EditCodProdutoChange(Sender: TObject);
    procedure EditCodProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButtonProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure EditNomeProdutoChange(Sender: TObject);
    procedure btGerarCodigoGradeClick(Sender: TObject);
    procedure edCdGradeChange(Sender: TObject);
    procedure edCodNovoProdutoChange(Sender: TObject);
    procedure edCdGradeEnter(Sender: TObject);
    procedure edCodNovoProdutoEnter(Sender: TObject);
    procedure edCdGradeExit(Sender: TObject);
    procedure edCodNovoProdutoExit(Sender: TObject);
    procedure btGerarCodigoProdutoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    CD_NEWPRODUTO : Integer;
    CD_NEWGRADE   : Integer;
    E_O_Mesmo_Produto : Boolean;
    function TemErro: Boolean;
  public
    CD_OLDPRODUTO : Integer;
    CD_GRUPO      : Integer;
  end;

var
  fTransfProdGrade: TfTransfProdGrade;

implementation

uses UConstVar, UComum, DUtilit, UModPesquisa, DBFunctions, UDataMod;

{$R *.dfm}

procedure TfTransfProdGrade.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfTransfProdGrade.EditCodProdutoChange(Sender: TObject);
begin
  if vazio(EditCodProduto.Text) then
  begin
    EditNomeProduto.Tag := 0;
    EditNomeProduto.Clear;
    Exit;
  end;

  with CM do
  begin
    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select NM_PRODUTO, CD_PRODUTO from PRODUTOS');
    IBTabela.SQL.Add('where COD_BARRAS = :COD_BARRAS');
    if not IBTabela.Prepared then IBTabela.Prepare;
    IBTabela.ParamByName('COD_BARRAS').AsString := EditCodProduto.Text;
    IBTabela.Active := true;
    if not IBTabela.IsEmpty then
    begin
      EditNomeProduto.Tag  := IBTabela.FieldByName('CD_PRODUTO').AsInteger;
      EditNomeProduto.Text := IBTabela.FieldByName('NM_PRODUTO').AsString;
    end
    else begin
      EditNomeProduto.Tag := 0;
      EditNomeProduto.Clear;
    end;
    fDB.FechaTT(IBTabela);
  end;
end;

procedure TfTransfProdGrade.EditCodProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if CM.F3OuAltDown(key, Shift) then SpeedButtonProduto.Click;
end;

procedure TfTransfProdGrade.EditCodProdutoKeyPress(Sender: TObject;  var Key: Char);
begin
  if Vazio(EditCodProduto.Text) or (EditCodProduto.SelLength = Length(EditCodProduto.Text)) then
    ItemEsc := mPesq.PesquisaDireto(key, pqProdutos, [], EditCodProduto, '', '', false, 0, false);
end;

procedure TfTransfProdGrade.SpeedButtonProdutoClick(Sender: TObject);
begin
  ItemEsc := mPesq.Pesquisa(pqProdutos, [mdAlteracao], EditCodProduto, EditNomeProduto.Text, '', false, 0, false, false);
  if ItemEsc.CodInt <> CodigoVazio then
  begin
    EditNomeProduto.Tag := ItemEsc.CodInt;
    EditNomeProdutoChange(self);
  end;
end;

procedure TfTransfProdGrade.FormShow(Sender: TObject);
begin
  CM.PegaDadosDoProduto(CD_OLDPRODUTO);
  lbCdProduto.Caption := RegProduto.Cod_Barras;
  lbNmProduto.Caption := RegProduto.Nm_Produto;

  edCdGrade.Text      := RegProduto.Cod_Barras;
  edNmGrade.Text      := RegProduto.Nm_Produto;

  lbCodNovaGrade.Caption       := ConfigCadastro.GradeCampoCodigo;
  lbDescricaoNovaGrade.Caption := ConfigCadastro.GradeCampoDescricao;
end;

function TfTransfProdGrade.TemErro:Boolean;
var
  JaTem : boolean;
begin
  result := false;

  if CM.TemGrades(CD_OLDPRODUTO) then
  begin
    result := true;
    MensagemDeAtencao('Existe(m) Grade(s) vinculada(s) ao PRODUTO'+PL+
                         lbCdProduto.Caption+' - '+lbNmProduto.Caption+PL+
                         'Por isso, n�o � poss�vel transformar este PRODUTO em uma GRADE.');
    Exit;
  end;

  if Vazio(EditNomeProduto.Text) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio informar um Produto');
    EditCodProduto.SetFocus;
    Exit;
  end;

  if Vazio(edCdGrade.Text) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio informar um C�digo para a GRADE');
    edCdGrade.SetFocus;
    Exit;
  end;

  if Vazio(edNmGrade.Text) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio informar uma Descri��o para a GRADE');
    edNmGrade.SetFocus;
    Exit;
  end;

  if E_O_Mesmo_Produto then
  begin
    if Vazio(edCodNovoProduto.Text) then
    begin
      result := true;
      MensagemDeAtencao('� necess�rio informar um NOVO C�digo para o PRODUTO');
      edCodNovoProduto.SetFocus;
      Exit;
    end;

    if edCodNovoProduto.Text = edCdGrade.Text then
    begin
      result := true;
      MensagemDeAtencao('O "C�digo do PRODUTO" e o "C�digo da GRADE" N�O podem ser IGUAIS');
      edCodNovoProduto.SetFocus;
      Exit;
    end;
  end
  else begin
    if EditCodProduto.Text = edCdGrade.Text then
    begin
      result := true;
      MensagemDeAtencao('O "C�digo do PRODUTO" e o "C�digo da GRADE" N�O podem ser IGUAIS');
      edCdGrade.SetFocus;
      Exit;
    end;
  end;

  with CM do
  begin
    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select COD_BARRAS from PRODUTOS');
    IBTabela.SQL.Add('where COD_BARRAS = '+QuotedStr(edCdGrade.Text));
    IBTabela.SQL.Add('and CD_PRODUTO <> '+IntToStr(CD_OLDPRODUTO));
    if not IBTabela.Prepared then IBTabela.Prepare;
    IBTabela.Active := true;
    JaTem := IBTabela.RecordCount > 0;
    fDB.FechaTT(IBTabela);
  end;
  if JaTem then
  begin
    result := true;
    MensagemDeErro('C�digo j� cadastrado no campo "C�digo da GRADE"');
    edCdGrade.SetFocus;
  end;

  with CM do
  begin
    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select COD_BARRAS from GRADES');
    IBTabela.SQL.Add('where COD_BARRAS = '+QuotedStr(edCdGrade.Text));
    if not IBTabela.Prepared then IBTabela.Prepare;
    IBTabela.Active := true;
    JaTem := IBTabela.RecordCount > 0;
    fDB.FechaTT(IBTabela);
  end;
  if JaTem then
  begin
    result := true;
    MensagemDeErro('C�digo j� cadastrado no campo "C�digo da GRADE"');
    edCdGrade.SetFocus;
  end;

  if edCodNovoProduto.Visible then
  begin
    with CM do
    begin
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Select COD_BARRAS from PRODUTOS');
      IBTabela.SQL.Add('where COD_BARRAS = '+QuotedStr(edCodNovoProduto.Text));
      IBTabela.SQL.Add('and CD_PRODUTO <> '+IntToStr(CD_NEWPRODUTO));
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.Active := true;
      JaTem := IBTabela.RecordCount > 0;
      fDB.FechaTT(IBTabela);
    end;
    if JaTem then
    begin
      result := true;
      MensagemDeErro('C�digo j� cadastrado no campo "Novo C�digo do PRODUTO"');
      edCodNovoProduto.SetFocus;
    end;

    with CM do
    begin
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Select COD_BARRAS from GRADES');
      IBTabela.SQL.Add('where COD_BARRAS = '+QuotedStr(edCodNovoProduto.Text));
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.Active := true;
      JaTem := IBTabela.RecordCount > 0;
      fDB.FechaTT(IBTabela);
    end;
    if JaTem then
    begin
      result := true;
      MensagemDeErro('C�digo j� cadastrado no campo "Novo C�digo do PRODUTO"');
      edCodNovoProduto.SetFocus;
    end;
  end;
  
end;

procedure TfTransfProdGrade.btOkClick(Sender: TObject);
type
  RegNFItems = record
    CD_NOTA : Integer;
    Quantidade : Currency;
  end;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  VetNFItems : Array of RegNFItems;
  i : integer;
begin
  CD_NEWPRODUTO := EditNomeProduto.Tag;

  if MensagemDeConfirmacao('Deseja realmente Transformar o PRODUTO:'+PL+
                               lbCdProduto.Caption+' - '+lbNmProduto.Caption+PL+PL+
                              'Em uma GRADE do PRODUTO:'+PL+
                               EditCodProduto.Text+' - '+EditNomeProduto.Text+' ?'+PL+PL+
                              'Esta Opera��o � IRREVERS�VEL!', 'ATEN��O', mbNo) <> mrYes then Exit;

  if TemErro then Exit;

  try
    Screen.Cursor := crHourGlass;
    AbreAviso('Transformando Produto em Grade');

    EstaTabela    := TIB_Query.Create(self);
    EstaTransacao := TIB_Transaction.Create(self);
    EstaTabela.IB_Connection    := dTM.IBDataBaseServer;
    EstaTransacao.IB_Connection := dTM.IBDataBaseServer;
    EstaTabela.IB_Transaction   := EstaTransacao;

    try
      if not EstaTabela.IB_Transaction.InTransaction then EstaTabela.IB_Transaction.StartTransaction;

      if E_O_Mesmo_Produto then
      begin
        if TiraEspacos(EditCodProduto.Text) <> TiraEspacos(edCodNovoProduto.Text) then
        begin
          // Altera o C�digo do PRODUTO...
          LabelAviso('Alterando C�digo do Produto');
          EstaTabela.Active := false;
          EstaTabela.SQL.Clear;
          EstaTabela.SQL.Add('Update PRODUTOS set COD_BARRAS = :COD_BARRAS ');
          EstaTabela.SQL.Add('where CD_PRODUTO = :CD_PRODUTO               ');
          if not EstaTabela.Prepared then EstaTabela.Prepare;
          EstaTabela.ParamByName('COD_BARRAS').AsString  := edCodNovoProduto.Text;
          EstaTabela.ParamByName('CD_PRODUTO').AsInteger := CD_NEWPRODUTO;
          EstaTabela.ExecSQL;
        end;

        if TiraEspacos(EditCodProduto.Text) <> TiraEspacos(edCodNovoProduto.Text) then
        begin
          // Altera a Descri��o do PRODUTO...
          LabelAviso('Alterando a Descri��o do Produto');
          EstaTabela.Active := false;
          EstaTabela.SQL.Clear;
          EstaTabela.SQL.Add('Update PRODUTOS set NM_PRODUTO = :NM_PRODUTO ');
          EstaTabela.SQL.Add('where CD_PRODUTO = :CD_PRODUTO               ');
          if not EstaTabela.Prepared then EstaTabela.Prepare;
          EstaTabela.ParamByName('NM_PRODUTO').AsString  := edDescricaoNovoProduto.Text;
          EstaTabela.ParamByName('CD_PRODUTO').AsInteger := CD_NEWPRODUTO;
          EstaTabela.ExecSQL;
        end;
      end;

      // Cria a nova Grade...
      LabelAviso('Criando Nova Grade');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Insert into GRADES                      ');
      EstaTabela.SQL.Add('( CD_PRODUTO,  NM_GRADE,  COD_BARRAS )  ');
      EstaTabela.SQL.Add('Values                                  ');
      EstaTabela.SQL.Add('(:CD_PRODUTO, :NM_GRADE, :COD_BARRAS )  ');
      EstaTabela.SQL.Add('Returning CD_GRADE                      ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_PRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('NM_GRADE').AsString    := edNmGrade.Text;
      EstaTabela.ParamByName('COD_BARRAS').AsString  := edCdGrade.Text;
      EstaTabela.ExecSQL;
      CD_NEWGRADE := EstaTabela.FieldByName('CD_GRADE').AsInteger;

      // Direciona As Vendas...
      LabelAviso('Direcionando Vendas');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Update PEDIDO_ITEM set         ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_NEWPRODUTO,  ');
      EstaTabela.SQL.Add('  CD_GRADE = :CD_NEWGRADE       ');
      EstaTabela.SQL.Add('where                           ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO   ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_NEWGRADE').AsInteger   := CD_NEWGRADE;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      // Direciona Estoque...
      LabelAviso('Direcionando Estoque');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('delete from ESTOQUE              ');
      EstaTabela.SQL.Add('where                            ');
      EstaTabela.SQL.Add('    CD_PRODUTO = :CD_OLDPRODUTO  ');
      EstaTabela.SQL.Add('and CD_GRADE <> 0                ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('update ESTOQUE set             ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_NEWPRODUTO, ');
      EstaTabela.SQL.Add('  CD_GRADE = :CD_NEWGRADE      ');
      EstaTabela.SQL.Add('where                          ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO  ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_NEWGRADE').AsInteger   := CD_NEWGRADE;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      // Direciona Entrada de Notas...
      LabelAviso('Direcionando Entrada de Notas');

      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Select CD_NOTA, QUANTIDADE from ENTRADA_ITEM  ');
      EstaTabela.SQL.Add('where                                     ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO             ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.Active := true;
      SetLength(VetNFItems, 0);
      while not EstaTabela.eof do
      begin
        SetLength(VetNFItems, Length(VetNFItems)+1);
        VetNFItems[Length(VetNFItems)-1].CD_NOTA    := EstaTabela.FieldByname('CD_NOTA').AsInteger; 
        VetNFItems[Length(VetNFItems)-1].Quantidade := EstaTabela.FieldByname('QUANTIDADE').AsCurrency;
        EstaTabela.Next;
      end;
      EstaTabela.Active := false;
      // Continua direcionando Entrada de Notas...

      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('update ENTRADA_ITEM set           ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_NEWPRODUTO ');
      EstaTabela.SQL.Add('where                         ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;
      // Continua direcionando Entrada de Notas...

      for i := 0 to length(VetNFItems)-1 do
      begin
        EstaTabela.Active := false;
        EstaTabela.SQL.Clear;
        EstaTabela.SQL.Add('update or Insert into ENTRADA_GRADE                         ');
        EstaTabela.SQL.Add('  ( CD_PRODUTO,     CD_GRADE,     CD_NOTA,  QUANTIDADE) ');
        EstaTabela.SQL.Add('values                                                  ');
        EstaTabela.SQL.Add('  (:CD_NEWPRODUTO, :CD_NEWGRADE, :CD_NOTA, :QUANTIDADE) ');
        if not EstaTabela.Prepared then EstaTabela.Prepare;
        EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
        EstaTabela.ParamByName('CD_NEWGRADE').AsInteger   := CD_NEWGRADE;
        EstaTabela.ParamByName('CD_NOTA').AsInteger       := VetNFItems[i].CD_NOTA;
        EstaTabela.ParamByName('QUANTIDADE').AsCurrency   := VetNFItems[i].Quantidade;
        EstaTabela.ExecSQL;
      end;

      // Direciona As Transfer�ncias...
      LabelAviso('Direcionando Transfer�ncias');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Update TRANSFERENCIAS_ITEMS set    ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_NEWPRODUTO,     ');
      EstaTabela.SQL.Add('  CD_GRADE = :CD_NEWGRADE          ');
      EstaTabela.SQL.Add('where                              ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_NEWGRADE').AsInteger   := CD_NEWGRADE;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      // Direciona os Invent�rios...
      LabelAviso('Direcionando Invent�rios');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Update INVENTARIOS_ITEMS set       ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_NEWPRODUTO,     ');
      EstaTabela.SQL.Add('  CD_GRADE = :CD_NEWGRADE          ');
      EstaTabela.SQL.Add('where                              ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_NEWGRADE').AsInteger   := CD_NEWGRADE;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      // Direciona as Devolu��es...
      LabelAviso('Direcionando Devolu��es');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Update DEVOLUCOES_ITEMS set        ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_NEWPRODUTO,     ');
      EstaTabela.SQL.Add('  CD_GRADE = :CD_NEWGRADE          ');
      EstaTabela.SQL.Add('where                              ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_NEWGRADE').AsInteger   := CD_NEWGRADE;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      // Direciona os Kits...
      LabelAviso('Direcionando Kits');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Update KIT set                     ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_NEWPRODUTO,     ');
      EstaTabela.SQL.Add('  CD_GRADE = :CD_NEWGRADE          ');
      EstaTabela.SQL.Add('where                              ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_NEWGRADE').AsInteger   := CD_NEWGRADE;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      // Direciona os RMAs...
      LabelAviso('Direcionando RMA');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Update RMA set                     ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_NEWPRODUTO,     ');
      EstaTabela.SQL.Add('  CD_GRADE = :CD_NEWGRADE          ');
      EstaTabela.SQL.Add('where                              ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_NEWGRADE').AsInteger   := CD_NEWGRADE;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      // Direciona as Expedi��es...
      LabelAviso('Direcionando Expedi��es');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Update EXPEDICAO_ITEMS             ');
      EstaTabela.SQL.Add('  set CD_PRODUTO = :CD_NEWPRODUTO  ');
      EstaTabela.SQL.Add('where                              ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      // Direciona os N�meros de S�rie...
      LabelAviso('Direcionando Num. S�rie');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Update NUMSERIE                    ');
      EstaTabela.SQL.Add('  set CD_PRODUTO = :CD_NEWPRODUTO  ');
      EstaTabela.SQL.Add('where                              ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      // Direciona as Movimenta��es de Estoque...
      LabelAviso('Direcionando Movimenta��es de Estoque');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Update MOVESTOQUE                  ');
      EstaTabela.SQL.Add('  set CD_PRODUTO = :CD_NEWPRODUTO  ');
      EstaTabela.SQL.Add('where                              ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      // Direciona os Pedidos de Compra...
      LabelAviso('Direcionando Pedidos de Compra');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Update PEDIDOSDECOMPRA_ITEMS       ');
      EstaTabela.SQL.Add('  set CD_PRODUTO = :CD_NEWPRODUTO  ');
      EstaTabela.SQL.Add('where                              ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      // Direciona Reservas...
      LabelAviso('Direcionando Reservas');
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Update RESERVAS                    ');
      EstaTabela.SQL.Add('  set CD_PRODUTO = :CD_NEWPRODUTO  ');
      EstaTabela.SQL.Add('where                              ');
      EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_NEWPRODUTO').AsInteger := CD_NEWPRODUTO;
      EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
      EstaTabela.ExecSQL;

      if not E_O_Mesmo_Produto then
      begin
        // Deleta o Antigo Produto...
        LabelAviso('Excluindo o antigo Produto');
        EstaTabela.Active := false;
        EstaTabela.SQL.Clear;
        EstaTabela.SQL.Add('delete from PRODUTOS               ');
        EstaTabela.SQL.Add('where                              ');
        EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
        if not EstaTabela.Prepared then EstaTabela.Prepare;
        EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
        EstaTabela.ExecSQL;

        EstaTabela.Active := false;
        EstaTabela.SQL.Clear;
        EstaTabela.SQL.Add('delete from REFPRODUTOS            ');
        EstaTabela.SQL.Add('where                              ');
        EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
        if not EstaTabela.Prepared then EstaTabela.Prepare;
        EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
        EstaTabela.ExecSQL;

        EstaTabela.Active := false;
        EstaTabela.SQL.Clear;
        EstaTabela.SQL.Add('delete from PRODFORNEC             ');
        EstaTabela.SQL.Add('where                              ');
        EstaTabela.SQL.Add('  CD_PRODUTO = :CD_OLDPRODUTO      ');
        if not EstaTabela.Prepared then EstaTabela.Prepare;
        EstaTabela.ParamByName('CD_OLDPRODUTO').AsInteger := CD_OLDPRODUTO;
        EstaTabela.ExecSQL;
      end;

      EstaTabela.IB_Transaction.Commit;

      MensagemDeInformacao('Ok');
      Close;
    except
      EstaTabela.IB_Transaction.Rollback;
      MensagemDeErro('N�o foi poss�vel transformar este PRODUTO em uma GRADE');
    end;
  finally
    Screen.Cursor := crDefault;
    FechaAviso;
  end;
end;

procedure TfTransfProdGrade.EditNomeProdutoChange(Sender: TObject);
begin
  CD_NEWPRODUTO := EditNomeProduto.Tag;
  E_O_Mesmo_Produto := CD_NEWPRODUTO = CD_OLDPRODUTO;

  PanelNovoCodigoProduto.Visible := E_O_Mesmo_Produto;
  edCodNovoProduto.Text := EditCodProduto.Text;
  edDescricaoNovoProduto.Text := EditNomeProduto.Text;
end;

procedure TfTransfProdGrade.btGerarCodigoGradeClick(Sender: TObject);
begin
  edCdGrade.Text := CM.GeraCodigo;
end;

procedure TfTransfProdGrade.edCdGradeChange(Sender: TObject);
begin
  lbQuantDigitosGrade.Caption := PoeZeros(length(edCdGrade.Text), 2)+' d�gitos';
end;

procedure TfTransfProdGrade.edCodNovoProdutoChange(Sender: TObject);
begin
  lbQuantDigitosProduto.Caption := PoeZeros(length(edCodNovoProduto.Text), 2)+' d�gitos';
end;

procedure TfTransfProdGrade.edCdGradeEnter(Sender: TObject);
begin
  edCdGradeChange(self);
  lbQuantDigitosGrade.Visible := true;
  btGerarCodigoGrade.Visible := true;
end;

procedure TfTransfProdGrade.edCodNovoProdutoEnter(Sender: TObject);
begin
  edCodNovoProdutoChange(self);
  lbQuantDigitosProduto.Visible := true;
  btGerarCodigoProduto.Visible := true;
end;

procedure TfTransfProdGrade.edCdGradeExit(Sender: TObject);
begin
  lbQuantDigitosGrade.Visible := false;
  btGerarCodigoGrade.Visible := false;
  edCdGrade.Text := TiraEspacos(edCdGrade.Text);
end;

procedure TfTransfProdGrade.edCodNovoProdutoExit(Sender: TObject);
begin
  lbQuantDigitosProduto.Visible := false;
  btGerarCodigoProduto.Visible := false;
  edCodNovoProduto.Text := TiraEspacos(edCodNovoProduto.Text);
end;

procedure TfTransfProdGrade.btGerarCodigoProdutoClick(Sender: TObject);
begin
  edCodNovoProduto.Text := CM.GeraCodigo;
end;

procedure TfTransfProdGrade.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  case key of
    vk_F10 : btOk.Click;
    VK_ESCAPE : btCancelar.Click;
  end;
end;

end.
