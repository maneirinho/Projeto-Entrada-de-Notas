//ok
unit UPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, DB, DUtilit, Buttons,
  DBFunctions, IB_Components, JvExControls, JvXPCore, JvXPCheckCtrls, JvLabel,
  UConstVar, MMJPanel, IBODataset, UComum, JvXPButtons, JvComponentBase, JvgCheckBox,
  MessageFunctions;

const
  psCodigo = 0;
  psNome   = 1;

  ModoDesenvolvimento = true;

type
  TRegInfoField = record
    FieldName      : String;
    Caption        : String;
    Width          : word;
    Alignment      : TAlignment;
    DisplayFormat  : String;
    DataType       : TFieldType;
  end;

  TfPesquisa = class(TForm)
    MMJPanel1: TMMJPanel;
    Label1: TJvLabel;
    Label2: TJvLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    CheckBoxIncremental: TJvXPCheckbox;
    CheckBoxComposta: TJvXPCheckbox;
    wwDBGrid: TwwDBGrid;
    CheckBoxUltimoAcessado: TJvXPCheckbox;
    CheckBoxSomenteVinculados: TJvXPCheckbox;
    btOk: TBitBtn;
    btCancelar: TBitBtn;
    btCadastrar: TBitBtn;
    btAlterar: TBitBtn;
    DataSource1: TDataSource;
    IBPesquisa: TIBOQuery;
    Transacao: TIBOTransaction;
    lbInformacoes: TLabel;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure wwDBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure wwDBGridDblClick(Sender: TObject);
    procedure CheckBoxIncrementalClick(Sender: TObject);
    procedure CheckBoxUltimoAcessadoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBoxSomenteVinculadosClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btCadastrarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure wwDBGridColWidthChanged(Sender: TObject; Column: Integer);
    procedure FormActivate(Sender: TObject);
  private
    CampoPesquisa   : String;
    TabelaPesquisa  : String;
    PodePesquisar   : boolean;
    UltimaPalavra   : String;
    MudouComboAuto  : boolean;
    InfoField : Array of TRegInfoField;
    FormCadastro : TForm;
    EditSelectAll : boolean;
    procedure DetectaTipoPesquisa;
    procedure ExecutaBuscaTexto;
    procedure PegaInfoCampos;
    procedure AjustaPropriedadesDoForm;
    procedure AjustaPropriedadesDoGrid;
    procedure IncluiCampo(icCaption, icFieldName: String; icWidth:Integer; icDataType: TFieldType; icAlignment: TAlignment = taCenter; icDisplayFormat: String = '');
    procedure LimpaCampos;
    procedure PosicionaComponentes;
    function  PegaPropCampo(ppNomeDoCampo: String): integer;
    procedure CriaFormCadastro;
    procedure MostraGrade;
    function Pode(pdOperacao: char): boolean;
  public
    BotaoPressionado : TBotaoPressionado;
    EntradaDeNotas  : Boolean;
    MostraInativos  : Boolean;
    ValorEntrada    : String;
    FiltroExterno   : String;
    ChaveDoRegistro : String;
    PesquisarOQue   : TPesquisarOQue;
    Select, SelectNormal, SelectComVinculo : String;
    Filtro : String;
    CampoResultadoInt : String;
    CampoResultadoExt : String;
    CampoDescricao    : String;
    ModoConsulta    : boolean;
    ItemEscolhido   : TItemEscolhido;
    Vinculo         : integer;
    Conexao         : TIBODatabase;
  end;

var
  fPesquisa: TfPesquisa;
  C : word;

implementation

uses UModUsuarios, UCadFornecedores, UCadSimilares, UProdutosDoFornecedor;

{$R *.dfm}

procedure TfPesquisa.DetectaTipoPesquisa;
begin
  if not PodePesquisar then Exit;
  if not ConfigGeral.AutoDetectaCampoPesquisa then exit;

  MudouComboAuto := true;
  if not Vazio(Edit1.Text) then
  begin
    if (ComboBox1.ItemIndex = psNome) and (ENumero(Edit1.Text)) then
    begin
      ComboBox1.ItemIndex := psCodigo;
      ComboBox1Change(self);
    end;
    if (ComboBox1.ItemIndex = psCodigo) and (PorcentNumero(Edit1.Text)< PorcentCodigo) then
    begin
      ComboBox1.ItemIndex := psNome;
      ComboBox1Change(self);
    end;
  end;
  MudouComboAuto := false;
end;

procedure TfPesquisa.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_Down  : if (Shift = []) and (IBPesquisa.Active) then IBPesquisa.Next;
    vk_Up    : if (Shift = []) and (IBPesquisa.Active) then IBPesquisa.Prior;
    vk_Next  : if (Shift = []) and (IBPesquisa.Active) then IBPesquisa.MoveBy(+10);
    vk_Prior : if (Shift = []) and (IBPesquisa.Active) then IBPesquisa.MoveBy(-10);
    vk_End   : if (Shift = [ssCtrl]) and (IBPesquisa.Active) then IBPesquisa.Last;
    vk_Home  : if (Shift = [ssCtrl]) and (IBPesquisa.Active) then IBPesquisa.First;

    vk_Return : begin
                  if NOT CheckBoxIncremental.Checked then
                  begin
                    DetectaTipoPesquisa;
                    if Edit1.Text = UltimaPalavra then btOk.OnClick(Self)
                    else begin
                      ExecutaBuscaTexto;
                      Edit1.SelectAll;
                    end;
                  end
                  else begin
                    btOk.OnClick(self);
                  end;
                end;
  end;
end;

procedure TfPesquisa.ComboBox1Change(Sender: TObject);
begin
//  Edit1.Width := StrToInt(TiraEspacos(StringPos(ComboBox1.Text, '�', 2)));
  CampoPesquisa := TiraEspacos(StringPos(ComboBox1.Text, '�', 3));
  TabelaPesquisa := TiraEspacos(StringPos(ComboBox1.Text, '�', 4));
  if not MudouComboAuto then Edit1.Clear;
end;

procedure TfPesquisa.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_Escape : Close;
    vk_F3     : Edit1.SetFocus;
    vk_F2     : if Shift = [] then if btCadastrar.Visible then btCadastrar.OnClick(self);
    vk_F5     : if Shift = [] then if btAlterar.Visible   then btAlterar.OnClick(self);
    vk_F9     : if Shift = [] then
                begin
                  case PesquisarOQue of
                    pqFornecedores :
                    begin
                      Application.CreateForm(TfProdutosDoFornecedor, fProdutosDoFornecedor);
                      fProdutosDoFornecedor.CodFornecedor := IBPesquisa.FieldByName(CampoResultadoInt).AsInteger;
                      fProdutosDoFornecedor.ShowModal;
                      FreeAndNil(fProdutosDoFornecedor);
                    end;
                    pqRepresentantes :
                    begin
                      Application.CreateForm(TfProdutosDoFornecedor, fProdutosDoFornecedor);
                      fProdutosDoFornecedor.CodRepresentante := IBPesquisa.FieldByName(CampoResultadoInt).AsInteger;
                      fProdutosDoFornecedor.ShowModal;
                      FreeAndNil(fProdutosDoFornecedor);

                    end;
                    pqPedidos    : CM.MostraItems(IBPesquisa.FieldByName('NUM_DOCUMENTO').AsInteger, 'P');
                    pqOrcamentos : CM.MostraItems(IBPesquisa.FieldByName('NUM_DOCUMENTO').AsInteger, 'O');
                    pqVendas     : CM.MostraItems(IBPesquisa.FieldByName('NUM_DOCUMENTO').AsInteger, 'V');
                    pqPedidosEVendas : CM.MostraItems(IBPesquisa.FieldByName('NUM_DOCUMENTO').AsInteger, StrToChar(IBPesquisa.FieldByName('PED_ORC_VENDA').AsString, 'P'));

                  end;
                end;
    vk_F11    : begin
                  if ComboBox1.ItemIndex > 0 then
                    ComboBox1.ItemIndex := ComboBox1.ItemIndex -1
                  else
                    ComboBox1.ItemIndex := ComboBox1.Items.Count -1;
                  ComboBox1.OnChange(self);
                  Edit1.Clear;
                  Edit1.SetFocus;
                end;
    vk_F12    : begin
                  if ComboBox1.ItemIndex < ComboBox1.Items.Count -1 then
                    ComboBox1.ItemIndex := ComboBox1.ItemIndex + 1
                  else
                    ComboBox1.ItemIndex := 0;
                  ComboBox1.OnChange(self);
                  Edit1.Clear;
                  Edit1.SetFocus;
                end;
  end;
end;

procedure TfPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaValorNoRegistro(ChaveDoRegistro,   'Campo', ComboBox1.ItemIndex, 'I');
  SalvaBooleanNoRegistro(ChaveDoRegistro, 'PesquisaIncremental', CheckBoxIncremental.Checked);
  SalvaBooleanNoRegistro(ChaveDoRegistro, 'PesquisaComposta', CheckBoxComposta.Checked);
  SalvaBooleanNoRegistro(ChaveDoRegistro, 'AbrirUltimoAcesso', CheckBoxUltimoAcessado.Checked);
  SalvaStringNoRegistro(ChaveDoRegistro,  'UltimoPesquisado', Edit1.Text);
  SalvaStringNoRegistro(ChaveDoRegistro,  'UltimoSelecionado', IBPesquisa.FieldByName(CampoPesquisa).AsString);

  if CheckBoxSomenteVinculados.Visible then
    SalvaBooleanNoRegistro(ChaveDoRegistro, 'VinculoFornec', CheckBoxSomenteVinculados.Checked);

  fDB.FechaTT(IBPesquisa);
end;

procedure TfPesquisa.FormCreate(Sender: TObject);
var
  i : integer;
begin
  EntradaDeNotas := false;

  BotaoPressionado := bpCancelado;
  ValorEntrada := '';
  IBPesquisa.Close;
  MudouComboAuto := false;
  PodePesquisar := false;
  ItemEscolhido.CodExt  := '';
  ItemEscolhido.CodInt  := CodigoVazio;
end;

procedure TfPesquisa.FormShow(Sender: TObject);
var
  S : String;
begin
  try
    IBPesquisa.IB_Connection := Conexao;
    Transacao.IB_Connection  := Conexao;

    PegaInfoCampos;
    AjustaPropriedadesDoForm;
    CheckBoxSomenteVinculados.Visible := (Vinculo > 0); 
    CheckBoxSomenteVinculados.Checked := LeBooleanDoRegistro(ChaveDoRegistro, 'VinculoFornec', false);
    if not CheckBoxSomenteVinculados.Visible then CheckBoxSomenteVinculados.Checked := false;

    ComboBox1.ItemIndex := LeIntegerDoRegistro(ChaveDoRegistro, 'Campo', 0);
    ComboBox1Change(self);
    CheckBoxIncremental.Checked    := LeBooleanDoRegistro(ChaveDoRegistro, 'PesquisaIncremental', true);
    CheckBoxComposta.Checked       := LeBooleanDoRegistro(ChaveDoRegistro, 'PesquisaComposta', true);
    CheckBoxUltimoAcessado.Checked := LeBooleanDoRegistro(ChaveDoRegistro, 'AbrirUltimoAcesso', true);

    if CheckBoxUltimoAcessado.Checked then
      Edit1.Text := LeValorDoRegistro(ChaveDoRegistro, 'UltimoPesquisado', 'S', '')
    else Edit1.Clear;

    EditSelectAll := true;
    if not Vazio(ValorEntrada) then
    begin
      EditSelectAll := not (ValorEntrada[length(ValorEntrada)] = '�');
      if not EditSelectAll then delete(ValorEntrada, length(ValorEntrada), 1);
      Edit1.Text := ValorEntrada;
    end;

    UltimaPalavra := Edit1.Text;

    IBPesquisa.Active := false;
    IBPesquisa.SQL.Clear;

    if CheckBoxSomenteVinculados.Checked then Select := SelectComVinculo
                                         else Select := SelectNormal;

    IBPesquisa.SQL.Add(Select);
    PodePesquisar := true;

    if not Vazio(FiltroExterno) then
    begin
      IBPesquisa.Filter := FiltroExterno;
      IBPesquisa.Filtered := true;
    end;

    ExecutaBuscaTexto;
    AjustaPropriedadesDoGrid;
    if CheckBoxUltimoAcessado.Checked then
    begin
      S := LeStringDoRegistro(ChaveDoRegistro, 'UltimoSelecionado', '');
      try
        IBPesquisa.Locate(CampoPesquisa, S, [loCaseInsensitive]);
      except
      end;
    end;
  finally
    FechaAviso;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfPesquisa.ExecutaBuscaTexto;
var
  Texto : String;
begin
  if not PodePesquisar then Exit;
  Texto := Edit1.Text;

  CM.BuscaTexto(IbPesquisa, Texto, Select, CampoPesquisa, TabelaPesquisa, '', CampoPesquisa, CheckBoxComposta.Checked);
  UltimaPalavra := Edit1.Text;
  AjustaPropriedadesDoGrid;
end;

procedure TfPesquisa.Edit1Change(Sender: TObject);
begin
  if CheckBoxIncremental.Checked then    // SE FOR INCREMENTAL...
  begin
    DetectaTipoPesquisa;
    ExecutaBuscaTexto;
  end
  else UltimaPalavra := '';
end;

procedure TfPesquisa.wwDBGridDblClick(Sender: TObject);
begin
  btOk.OnClick(self);
end;

procedure TfPesquisa.wwDBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Pt : TPoint;
begin
//  if key in [vk_Down, vk_Up] then
  begin
    {Obt�m o point no centro do Button1}
    Pt.x := Edit1.Left + (Edit1.Width div 2);
    Pt.y := Edit1.Top + (Edit1.Height div 2);
    {Converte Pt para as coordenadas da tela }
    Pt := ClientToScreen(Pt);
    Pt.x := Round(Pt.x * (65535 / Screen.Width));
    Pt.y := Round(Pt.y * (65535 / Screen.Height));
    {Move o mouse}
    Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MOVE, Pt.x, Pt.y, 0, 0);
    {Simula o pressionamento do bot�o esquerdo do mouse}
    Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, Pt.x, Pt.y, 0, 0);
    { Simula soltando o bot�o esquerdo do mouse }
    Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, Pt.x, Pt.y, 0, 0);
  end;
end;

procedure TfPesquisa.CheckBoxIncrementalClick(Sender: TObject);
begin
  try
    Edit1.SetFocus;
    ExecutaBuscaTexto;
  except
  end;
end;

procedure TfPesquisa.CheckBoxUltimoAcessadoClick(Sender: TObject);
begin
  try
    Edit1.SetFocus;
  except
  end;
end;

function TfPesquisa.PegaPropCampo(ppNomeDoCampo:String):integer;
var
  i : word;
begin
  result := -1;
  for i := 0 to length(InfoField)-1 do
  begin
    if InfoField[i].FieldName = ppNomeDoCampo then
    begin
      result := i;
      break;
    end;
  end;
end;

procedure TfPesquisa.AjustaPropriedadesDoGrid;
var
  i : word;
  pos : integer;
begin
  IBPesquisa.disableControls;
  try
    for i := 0 to IBPesquisa.Fields.Count-1 do
    begin
      pos := PegaPropCampo(IBPesquisa.Fields[i].FieldName);
      if pos < 0 then
      begin
        IBPesquisa.Fields[i].Visible := false;
      end
      else begin
        IBPesquisa.Fields[i].DisplayLabel := InfoField[pos].Caption;
        IBPesquisa.Fields[i].DisplayWidth := InfoField[pos].Width;
        IBPesquisa.Fields[i].Alignment    := InfoField[pos].Alignment;
        case InfoField[pos].DataType of
          ftFloat    : TFloatField(IBPesquisa.Fields[i]    as TField).DisplayFormat := InfoField[pos].DisplayFormat;
          ftCurrency : TCurrencyField(IBPesquisa.Fields[i] as TField).DisplayFormat := InfoField[pos].DisplayFormat;
          ftString   : TStringField(IBPesquisa.Fields[i]   as TField).EditMask      := InfoField[pos].DisplayFormat;
          ftDateTime : TDateTimeField(IBPesquisa.Fields[i] as TField).DisplayFormat := InfoField[pos].DisplayFormat;
          ftDate     : TDateField(IBPesquisa.Fields[i]     as TField).DisplayFormat := InfoField[pos].DisplayFormat;
          ftTime     : TTimeField(IBPesquisa.Fields[i]     as TField).DisplayFormat := InfoField[pos].DisplayFormat;
          ftInteger  : TTimeField(IBPesquisa.Fields[i]     as TField).DisplayFormat := InfoField[pos].DisplayFormat;
        end;
        IBPesquisa.Fields[i].Index := pos;  //  Tem que ser o �ltimo
      end;
    end;
  finally
    IBPesquisa.enableControls;
  end;
end;

procedure TfPesquisa.CheckBoxSomenteVinculadosClick(Sender: TObject);
begin
  if IBPesquisa.Active then
  begin
    IBPesquisa.Active := false;
    IBPesquisa.SQL.Clear;

    if CheckBoxSomenteVinculados.Checked then Select := SelectComVinculo
                                         else Select := SelectNormal;
    IBPesquisa.SQL.Add(Select);
    if not IBPesquisa.Prepared then IBPesquisa.Prepare;
    IBPesquisa.Active := true;
    Edit1.SetFocus;
  end;
  AjustaPropriedadesDoGrid;
end;

procedure TfPesquisa.IncluiCampo(icCaption, icFieldName: String; icWidth:Integer; icDataType: TFieldType; icAlignment: TAlignment = taCenter; icDisplayFormat: String = '');
begin
  SetLength(InfoField, Length(InfoField)+1);
  with InfoField[Length(InfoField)-1] do begin
    Caption        := icCaption;
    FieldName      := icFieldName;
    Width          := icWidth;
    Alignment      := icAlignment;
    DisplayFormat  := icDisplayFormat;
    DataType       := icDataType;
  end;
end;

procedure TfPesquisa.LimpaCampos;
begin
  SetLength(InfoField, 0);
end;

procedure TfPesquisa.btOkClick(Sender: TObject);
begin
  BotaoPressionado := bpOk;
  if IBPesquisa.IsEmpty then
  begin
    ItemEscolhido.CodInt := CodigoVazio;
    ItemEscolhido.CodExt := '';
    ItemEscolhido.Descricao := '';
    ItemEscolhido.SubCod := 0;
  end
  else begin
    ItemEscolhido.CodInt := IBPesquisa.FieldByName(CampoResultadoInt).AsInteger;
    ItemEscolhido.CodExt := IBPesquisa.FieldByName(CampoResultadoExt).AsString;
    ItemEscolhido.Descricao := IBPesquisa.FieldByName(CampoDescricao).AsString;
  end;
  if not ModoConsulta then
    self.Close
  else begin
    if CM.TemGrades(IBPesquisa.FieldByName('CD_PRODUTO').AsInteger) then
      MostraGrade;
    Edit1.SetFocus;
    Edit1.SelectAll;
  end;
end;

procedure TfPesquisa.btCancelarClick(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
  ItemEscolhido.CodInt := CodigoVazio;
  ItemEscolhido.CodExt := '';
  ItemEscolhido.Descricao := '';
  self.Close;
end;

procedure TfPesquisa.PosicionaComponentes;
begin
  wwDBGrid.Width   := Width - 35;
  btOk.Left        := wwDBGrid.Left + wwDBGrid.Width - btOk.Width;
  btCancelar.Left  := btOk.Left;
  ComboBox1.Left   := wwDBGrid.Left + wwDBGrid.Width - ComboBox1.Width;
  Label2.Left      := wwDBGrid.Left + wwDBGrid.Width - Label2.Width;
  Edit1.Width      := ComboBox1.Left - 15 - 15;
end;

procedure TfPesquisa.AjustaPropriedadesDoForm;
begin
  case PesquisarOQue of
    pqClientes     : Caption := 'Pesquisa de Clientes';
    pqVendedores   : Caption := 'Pesquisa de Vendedores';
    pqUsuarios     : Caption := 'Pesquisa de Usu�rios';
    pqEmpresas     : Caption := 'Pesquisa de Empresas';
    pqCertificados : Caption := 'Pesquisa de Certificados';
    pqOrcamentos   : Caption := 'Pesquisa de Or�amentos';
    pqPedidos      : Caption := 'Pesquisa de Pedidos';
    pqVendas       : Caption := 'Pesquisa de Vendas';
    pqPedidosEVendas : Caption := 'Pesquisa de Pedidos';
    pqFornecedores : Caption := 'Pesquisa de Fornecedores';
    pqEntradaNotas : Caption := 'Pesquisa de Entrada de Notas';
    pqCodVenda     : Caption := 'Pesquisa de C�d. Venda';
    pqPracas       : Caption := 'Pesquisa de Pra�as';
    pqSimilares    : Caption := 'Pesquisa de Similares';
    pqConfBoletos  : Caption := 'Pesquisa de Defini��es de Boletos';
    pqMunicipios   : Caption := 'Pesquisa Munic�pios';
    pqCFOP         : Caption := 'Pesquisa de CFOP';
    pqRepresentantes : Caption := 'Pesquisa de Representantes';
    pqClientesCategorias : Caption := 'Categorias de Clientes';
    pqUsuariosClassif    : Caption := 'Classifica��o de Usu�rios';
  end;

  case PesquisarOQue of
    pqClientes : CheckBoxSomenteVinculados.Caption := 'Clientes vinculados';
  end;

  lbInformacoes.Visible := true;
  case PesquisarOQue of
    pqFornecedores   : lbInformacoes.Caption := '<F9> Produtos do Fornecedor';
    pqRepresentantes : lbInformacoes.Caption := '<F9> Produtos do Representante';
    pqPedidos        : lbInformacoes.Caption := '<F9> Produtos do '+Descr_PedPV;
    pqPedidosEVendas : lbInformacoes.Caption := '<F9> Produtos do Pedido';
    pqOrcamentos     : lbInformacoes.Caption := '<F9> Produtos do '+Descr_OrcDAV;
    pqVendas         : lbInformacoes.Caption := '<F9> Produtos da Venda';
    else lbInformacoes.Visible := false;
  end;

  case PesquisarOQue of
    pqClientes :
    begin
      if Modulo = moPDV then
      begin
        btCadastrar.Visible := InfoPDV.PodeCadastClientes;
        btAlterar.Visible   := InfoPDV.PodeCadastClientes;
      end;
    end;
  end;
end;

procedure TfPesquisa.PegaInfoCampos;
var
  SelectTemp : String;
  Preco      : String;
begin
  case PesquisarOQue of
    //##########################################################################
    pqMunicipios : begin
      Width := 542;
      CampoResultadoInt := 'CD_MUNICIPIO';
      CampoResultadoExt := 'CD_MUNICIPIO';
      CampoDescricao    := 'NM_MUNICIPIO';
      SelectNormal := ' SELECT CD_MUNICIPIO, NM_MUNICIPIO FROM TAB_MUNICIPIOS '+
                      ' where CD_MUNICIPIO > 0 ';
      SelectComVinculo := '';
      Filtro  := '';
      ChaveDoRegistro := RegChaveForms+'\PesqMunicipios';
      ComboBox1.Clear;

      ComboBox1.Clear;
      ComboBox1.Items.Add('C�digo'   +Espacos100+'� 135 � CD_MUNICIPIO � TAB_MUNICIPIOS');
      ComboBox1.Items.Add('Descri��o'+Espacos100+'� 500 � NM_MUNICIPIO � TAB_MUNICIPIOS');

      LimpaCampos;
      IncluiCampo('C�digo',    'CD_MUNICIPIO',  12, ftInteger, taCenter, '');
      IncluiCampo('Descri��o', 'NM_MUNICIPIO',  65, ftString,  taLeftJustify, '');
    end;

    //##########################################################################
    pqCFOP : begin
      Width := 542;
      CampoResultadoInt := 'CFOP';
      CampoResultadoExt := 'CFOP';
      CampoDescricao    := 'NATUREZA';
      SelectNormal := ' SELECT CFOP, NATUREZA FROM TAB_CFOP '+
                      ' where 1=1 ';
      SelectComVinculo := '';
      Filtro  := '';
      ChaveDoRegistro := RegChaveForms+'\PesqCFOP';
      ComboBox1.Clear;

      ComboBox1.Clear;
      ComboBox1.Items.Add('CFOP'    +Espacos100+'� 85 � CFOP � TAB_CFOP');
      ComboBox1.Items.Add('Natureza'+Espacos100+'� 550 � NATUREZA � TAB_CFOP');

      LimpaCampos;
      IncluiCampo('CFOP',    'CFOP',  12, ftString, taCenter, '');
      IncluiCampo('Natureza da Opera��o', 'NATUREZA',  65, ftString,  taLeftJustify, '');
    end;

    //##########################################################################
    pqFornecedores : begin
      Width := 610;
      CampoResultadoInt := 'CD_FORNECEDOR';
      CampoResultadoExt := 'CD_FORNECEDOR';
      CampoDescricao    := 'NM_FORNECEDOR';
      SelectNormal := ' SELECT CD_FORNECEDOR, NM_FORNECEDOR, NOMEFANTASIA, CGC FROM FORNECEDORES '+
                      ' where CD_FORNECEDOR > 0 ';
      if not MostraInativos then SelectNormal := SelectNormal + ' and INATIVO = ''F'' ';
      SelectComVinculo := '';
      Filtro  := '';
      ChaveDoRegistro := RegChaveForms+'\PesqFornecedores';
      ComboBox1.Clear;

      ComboBox1.Clear;
      ComboBox1.Items.Add('C�digo'             +Espacos100+'� 135 � CD_FORNECEDOR � FORNECEDORES');
      ComboBox1.Items.Add('Raz�o Social/Nome'  +Espacos100+'� 465 � NM_FORNECEDOR � FORNECEDORES');
      ComboBox1.Items.Add('Nome Fant./Apelido' +Espacos100+'� 465 � NOMEFANTASIA � FORNECEDORES');
      ComboBox1.Items.Add('CNPJ'               +Espacos100+'� 465 � CGC � FORNECEDORES');

      LimpaCampos;
      IncluiCampo('C�digo',             'CD_FORNECEDOR',  06, ftInteger, taCenter, '');
      IncluiCampo('Raz�o Social/Nome',  'NM_FORNECEDOR',  32, ftString,  taLeftJustify, '');
      IncluiCampo('Nome Fant./Apelido', 'NOMEFANTASIA',   30, ftString,  taLeftJustify, '');
      IncluiCampo('CNPJ / CPF',         'CGC',            17, ftString,  taLeftJustify, '');
    end;

    //##########################################################################
    pqRepresentantes : begin
      Width := 542;
      CampoResultadoInt := 'CD_REPRESENTANTE';
      CampoResultadoExt := 'CD_REPRESENTANTE';
      CampoDescricao    := 'NM_REPRESENTANTE';
      SelectNormal := ' SELECT CD_REPRESENTANTE, NM_REPRESENTANTE FROM REPRESENTANTES '+
                      ' where CD_REPRESENTANTE > 0 ';
      if not MostraInativos then SelectNormal := SelectNormal + ' and INATIVO = ''F'' ';
      SelectComVinculo := '';
      Filtro  := '';
      ChaveDoRegistro := RegChaveForms+'\PesqRepresentantes';
      ComboBox1.Clear;

      ComboBox1.Clear;
      ComboBox1.Items.Add('C�digo'   +Espacos100+'� 135 � CD_REPRESENTANTE � REPRESENTANTES');
      ComboBox1.Items.Add('Nome'     +Espacos100+'� 500 � NM_REPRESENTANTE � REPRESENTANTES');

      LimpaCampos;
      IncluiCampo('C�digo', 'CD_REPRESENTANTE',  12, ftInteger, taCenter, '');
      IncluiCampo('Nome',   'NM_REPRESENTANTE',  65, ftString,  taLeftJustify, '');
    end;

    //##########################################################################
    pqUsuariosClassif : begin
      Width := 542;
      CampoResultadoInt := 'CD_USUARIOCLASSIF';
      CampoResultadoExt := 'CD_USUARIOCLASSIF';
      CampoDescricao    := 'NM_USUARIOCLASSIF';
      SelectNormal := ' SELECT CD_USUARIOCLASSIF, NM_USUARIOCLASSIF FROM USUARIOS_CLASSIF '+
                      ' where CD_USUARIOCLASSIF > 0 ';
      SelectComVinculo := '';
      Filtro  := '';
      ChaveDoRegistro := RegChaveForms+'\PesqUsuariosClassif';
      ComboBox1.Clear;

      ComboBox1.Clear;
      ComboBox1.Items.Add('C�digo'   +Espacos100+'� 135 � CD_USUARIOCLASSIF � USUARIOS_CLASSIF');
      ComboBox1.Items.Add('Descri��o'+Espacos100+'� 500 � NM_USUARIOCLASSIF � USUARIOS_CLASSIF');

      LimpaCampos;
      IncluiCampo('C�digo',    'CD_USUARIOCLASSIF',  12, ftInteger, taCenter, '');
      IncluiCampo('Descri��o', 'NM_USUARIOCLASSIF',  65, ftString,  taLeftJustify, '');
    end;

    //##########################################################################
    pqEntradaNotas : begin
      Width := 742;
      CampoResultadoInt := 'CD_NOTA';
      CampoResultadoExt := 'CD_NOTA';
      CampoDescricao    := 'NUM_DOCUMENTO';
      SelectNormal := ' SELECT ENTRADA.DT_ENTRADA, ENTRADA.NUM_DOCUMENTO, ENTRADA.CNPJ, FORNECEDORES.NM_FORNECEDOR, FORNECEDORES.NOMEFANTASIA, ENTRADA.VALOR_TOTAL_NOTA, ENTRADA.CD_NOTA FROM ENTRADA '+PL+
                      ' left outer join FORNECEDORES on ENTRADA.CD_FORNECEDOR = FORNECEDORES.CD_FORNECEDOR ';
      SelectComVinculo := '';
      Filtro  := 'NOTA_FECHADA = ''V'' ';
      ChaveDoRegistro := RegChaveForms+'\PesqEntradaNotas';
      ComboBox1.Clear;

      ComboBox1.Items.Add('N� Nota'      +Espacos100+'� 135 � NUM_DOCUMENTO � ENTRADA');
      ComboBox1.Items.Add('Nome Fantasia'+Espacos100+'� 577 � NOMEFANTASIA � F');
      ComboBox1.Items.Add('Fornecedor'   +Espacos100+'� 577 � NM_FORNECEDOR � F');
      ComboBox1.Items.Add('Data'         +Espacos100+'� 135 � DT_ENTRADA � ENTRADA');
      ComboBox1.Items.Add('CNPJ'         +Espacos100+'� 285 � CNPJ � ENTRADA');

      LimpaCampos;
      IncluiCampo('Data',            'DT_ENTRADA',       10, ftDateTime, taCenter,       'dd/mm/yyyy');
      IncluiCampo('N� Nota',         'NUM_DOCUMENTO',    09, ftInteger,  taLeftJustify,  '');
      IncluiCampo('CNPJ',            'CNPJ',             17, ftString,   taLeftJustify,  '');
      IncluiCampo('Fornecedor',      'NM_FORNECEDOR',    28, ftString,   taLeftJustify,  '');
      IncluiCampo('Nome Fanatsia',   'NOMEFANTASIA',     28, ftString,   taLeftJustify,  '');
      IncluiCampo('Valor da Nota',   'VALOR_TOTAL_NOTA', 14, ftCurrency, taRightJustify, ',0.00;-,0.00');
    end;

    //##########################################################################
    pqCodVenda : begin
      Width := 542;
      CampoResultadoInt := 'CD_VENDA';
      CampoResultadoExt := 'CD_VENDA';
      CampoDescricao    := 'NM_VENDA';
      SelectNormal := ' SELECT CD_VENDA, NM_VENDA from CODIGOVENDA where CD_VENDA > 0 ';
      if not MostraInativos then SelectNormal := SelectNormal + ' and INATIVO = ''F'' ';
      SelectComVinculo := '';
      Filtro  := '';
      ChaveDoRegistro := RegChaveForms+'\PesqCodVenda';
      ComboBox1.Clear;

      ComboBox1.Items.Add('C�digo'       +Espacos100+'� 135 � CD_VENDA � CODIGOVENDA');
      ComboBox1.Items.Add('Descri��o'    +Espacos100+'� 500 � NM_VENDA � CODIGOVENDA');

      LimpaCampos;
      IncluiCampo('C�digo',    'CD_VENDA', 12, ftInteger,  taCenter,       '');
      IncluiCampo('Descri��o', 'NM_VENDA', 65, ftString,   taLeftJustify,  '');
    end;

    //##########################################################################
    pqSimilares : begin
      Width := 542;
      CampoResultadoInt := 'CD_SIMILAR';
      CampoResultadoExt := 'CD_SIMILAR';
      CampoDescricao    := 'NM_SIMILAR';
      SelectNormal := ' SELECT CD_SIMILAR, NM_SIMILAR from SIMILARES ';
      SelectComVinculo := '';
      Filtro  := '';
      ChaveDoRegistro := RegChaveForms+'\PesqSimilares';
      ComboBox1.Clear;

      ComboBox1.Items.Add('C�digo'       +Espacos100+'� 135 � CD_SIMILAR � SIMILARES');
      ComboBox1.Items.Add('Descri��o'    +Espacos100+'� 500 � NM_SIMILAR � SIMILARES');

      LimpaCampos;
      IncluiCampo('C�digo',    'CD_SIMILAR', 12, ftInteger,  taCenter,       '');
      IncluiCampo('Descri��o', 'NM_SIMILAR', 65, ftString,   taLeftJustify,  '');
    end;
  end;
  PosicionaComponentes;
end;

procedure TfPesquisa.btCadastrarClick(Sender: TObject);
begin
  CriaFormCadastro;
  AbreCad.EntraNaInclusao  := true;
  AbreCad.EntraNaAlteracao := CodigoVazio;

  AbreAviso('Abrindo tela de cadastro');
  FormCadastro.ShowModal;
  FreeAndNil(FormCadastro);

  with CM do
  begin
    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select '+CampoPesquisa+' from '+TabelaPesquisa);
    IBTabela.SQL.Add('where '+CampoResultadoInt+' = :'+CampoResultadoInt);
    if not IBTabela.Prepared then IBTabela.Prepare;
    IBTabela.ParamByName(CampoResultadoInt).AsInteger := ItemEsc.CodInt;
    IBTabela.Active := true;
    Edit1.Text := IBTabela.FieldByName(CampoPesquisa).AsString;
    Edit1.SetFocus;
    Edit1.SelectAll;
    if not CheckBoxIncremental.Checked then
    begin
      DetectaTipoPesquisa;
      ExecutaBuscaTexto;
    end;
    fDB.FechaTT(IBTabela);
  end;
end;

procedure TfPesquisa.CriaFormCadastro;
begin
  case PesquisarOQue of
    pqFornecedores : begin
                       FormCadastro := fCadFornecedores;
                       Application.CreateForm(TfCadFornecedores, FormCadastro);
                     end;
    pqSimilares    : begin
                       FormCadastro := fCadSimilares;
                       Application.CreateForm(TfCadSimilares, FormCadastro);
                     end;
  end;
end;

function TfPesquisa.Pode(pdOperacao:char):boolean;
begin
  case PesquisarOQue of
    pqFornecedores:       result := mUsers.TemAcessoPermissao(sgCadFornecedores, pdOperacao);
    pqUsuarios:           result := mUsers.TemAcessoPermissao(sgCadUsuarios, pdOperacao);
    pqEmpresas:           result := mUsers.TemAcessoPermissao(sgCadEmpresas, pdOperacao);
    pqRepresentantes:     result := mUsers.TemAcessoPermissao(sgCadFornecedores, pdOperacao);
    pqUsuariosClassif:    result := mUsers.TemAcessoPermissao(sgCadUsuarios, pdOperacao);
    pqCFOP:            result := mUsers.TemAcessoPermissao(sgCadCFOP, pdOperacao);
    else result := true;
  end;
end;

procedure TfPesquisa.btAlterarClick(Sender: TObject);
begin
  if not Pode('A') then Exit;

  CriaFormCadastro;
  AbreCad.EntraNaInclusao  := false;
  AbreCad.EntraNaAlteracao := IBPesquisa.FieldByName(CampoResultadoInt).AsInteger;
  FormCadastro.ShowModal;

  with CM do
  begin
    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select '+CampoPesquisa+' from '+TabelaPesquisa);
    IBTabela.SQL.Add('where '+CampoResultadoInt+' = :'+CampoResultadoInt);
    if not IBTabela.Prepared then IBTabela.Prepare;
    IBTabela.ParamByName(CampoResultadoInt).AsInteger := ItemEsc.CodInt;
    IBTabela.Active := true;
    Edit1.Text := IBTabela.FieldByName(CampoPesquisa).AsString;
    Edit1.SetFocus;
    Edit1.SelectAll;

    FreeAndNil(FormCadastro);
    fDB.FechaTT(IBTabela);
  end;
end;

procedure TfPesquisa.wwDBGridColWidthChanged(Sender: TObject; Column: Integer);
var
  i : word;
begin
  if ModoDesenvolvimento then
  begin
    PodePesquisar := false;
    Edit1.Text := '';
    for i := 0 to wwDBGrid.FieldCount-1 do
      if wwDBGrid.Fields[i].Visible then
        Edit1.Text := Edit1.Text + intToStr(wwDBGrid.Fields[i].DisplayWidth)+'  -  ';
  end;
end;

procedure TfPesquisa.MostraGrade;
begin
end;

procedure TfPesquisa.FormActivate(Sender: TObject);
begin
  if EditSelectAll then Edit1.SelectAll
                   else Edit1.SelStart := length(Edit1.Text);
end;

end.


