//ok
unit UPesqProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, DB, DUtilit, Buttons,
  IBODataset, UComum, JvExControls, JvXPCore, JvXPButtons, JvComponentBase,
  JvgCheckBox, JvXPCheckCtrls, IB_Components, JvLabel, UDataMod, MMJPanel,
  UConstVar, DBFunctions, JvGradient, JvBalloonHint, JvSpeedButton, MessageFunctions;

const
  psCodigo = 0;
  psNome   = 1;

type
  TfPesqProduto = class(TForm)
    MMJPanel1: TMMJPanel;
    DataSource1: TDataSource;
    IBPesquisa: TIBOQuery;
    Transacao: TIBOTransaction;
    MMJPanel2: TMMJPanel;
    btOk: TBitBtn;
    btCancelar: TBitBtn;
    btCadastrar: TBitBtn;
    MMJPanel3: TMMJPanel;
    MMJPanel4: TMMJPanel;
    edDescricao: TEdit;
    chSomenteVinculados: TJvXPCheckbox;
    chLembrarUltimaPesquisa: TJvXPCheckbox;
    lbCodVenda: TLabel;
    IBPesquisaCOD_BARRAS: TStringField;
    IBPesquisaNM_PRODUTO: TStringField;
    IBPesquisaCD_PRODUTO: TIntegerField;
    IBPesquisaPRECOVENDA: TBCDField;
    IBPesquisaPRECOCUSTO: TBCDField;
    IBPesquisaQUANTESTOQUE: TBCDField;
    IBPesquisaAPLICACAO: TStringField;
    IBPesquisaESTOQUEMINIMO: TBCDField;
    PanelLado: TMMJPanel;
    lbCapDescricao: TJvLabel;
    btAlterar: TBitBtn;
    edCodigo: TEdit;
    lbCapCodigo: TJvLabel;
    Notebook1: TNotebook;
    wwDBGrid: TwwDBGrid;
    PanelProdutoPesq: TPanel;
    lbCodigo: TLabel;
    lbDescricao: TLabel;
    lbCapPreco: TLabel;
    lbPreco: TLabel;
    lbCapEstoque: TLabel;
    lbEstoque: TLabel;
    lbCapQuantidade: TLabel;
    lbQuantidade: TLabel;
    Bevel1: TBevel;
    Image1: TImage;
    JvGradient1: TJvGradient;
    GroupBoxModoPesquisa: TGroupBox;
    CheckBoxIncremental: TJvXPCheckbox;
    CheckBoxComposta: TJvXPCheckbox;
    Bevel2: TBevel;
    chMultiplosCampos: TJvXPCheckbox;
    IBPesquisaGRUPO: TStringField;
    chDetectarCampo: TJvXPCheckbox;
    imgSemFoto: TImage;
    chMostrarInativos: TJvXPCheckbox;
    IBPesquisaINATIVO: TStringField;
    JvBalloonHint1: TJvBalloonHint;
    btMostrarEstoques: TJvSpeedButton;
    btMostrarFoto: TJvSpeedButton;
    btMostrarPrecos: TJvSpeedButton;
    procedure edDescricaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edDescricaoChange(Sender: TObject);
    procedure wwDBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure wwDBGridDblClick(Sender: TObject);
    procedure CheckBoxIncrementalClick(Sender: TObject);
    procedure chLembrarUltimaPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chSomenteVinculadosClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btCadastrarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure wwDBGridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormActivate(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoEnter(Sender: TObject);
    procedure edDescricaoEnter(Sender: TObject);
    procedure edCodigoChange(Sender: TObject);
    procedure chDetectarCampoClick(Sender: TObject);
    procedure edDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure btMostrarPrecosClick(Sender: TObject);
    procedure btMostrarEstoquesClick(Sender: TObject);
    procedure btMostrarFotoClick(Sender: TObject);
  private
    PodePesquisar   : boolean;
    UltimaPalavra   : String;
    EditSelectAll : boolean;
    UltimoTexto : String;
    CodigoEntrada : String;
    PegouProdutoPeloCodigo : Boolean;
    procedure ExecutaBuscaTexto;
    procedure PegaInfoCampos;
    procedure AjustaPropriedadesDoForm;
    procedure MostraGrade;
    procedure DefineCampo(dcCodigoOuDescricao: char);
    procedure LimpaProdutoPesquisado;
    procedure DefineColunas;
  public
    BotaoPressionado : TBotaoPressionado;
    MostraPrecoCusto: Boolean;
    MostraInativos  : Boolean;
    EntraCodigo     : Boolean;
    ValorEntrada    : String;
    FiltroExterno   : String;
    ChaveDoRegistro : String;
    Select, SelectNormal, SelectComVinculo : String;
    Filtro : String;
    ModoConsulta    : boolean;
    ItemEscolhido   : TItemEscolhido;
    Vinculo         : integer;
    PodeAbrirGrade  : boolean;
  end;

var
  fPesqProduto: TfPesqProduto;
  C : word;

implementation

uses UNovoProduto, UModUsuarios, UIni, UCadProdutos, UEstoquesDepositos, USelecGrade,
     UMostraFoto, UPrecosDoProduto;

{$R *.dfm}

procedure TfPesqProduto.FormCreate(Sender: TObject);
var
  i : integer;
begin
  MostraInativos := False;
  chMostrarInativos.Checked := false;
  CodigoEntrada := '�';
  BotaoPressionado := bpCancelado;
  MostraPrecoCusto := false;
  PodeAbrirGrade  := true;
  EntraCodigo := false;
  IBPesquisa.Active := false;
  IBPesquisa.SQL.Clear;
  IBPesquisa.IB_Connection := DtM.IBDataBaseServer;
  Transacao.IB_Connection := IBPesquisa.IB_Connection;
  ValorEntrada := '';
  IBPesquisa.Close;
  PodePesquisar := false;
  ItemEscolhido.CodExt  := '';
  ItemEscolhido.CodInt  := CodigoVazio;
  PegaChavesINI;
end;

procedure TfPesqProduto.FormShow(Sender: TObject);
var
  S : String;
begin
  try
    btAlterar.Visible := false;//s� utilizado no m�dulo do PDV

    AjustaPropriedadesDoForm;
    chSomenteVinculados.Visible := (Vinculo > 0);
    chSomenteVinculados.Checked :=  LeIni(EIni.Pesquisa.PROD_Vinculado, false) and chSomenteVinculados.Visible;

    CheckBoxIncremental.Checked     := LeIni(EIni.Pesquisa.PROD_Incremental, true);
    CheckBoxComposta.Checked        := LeIni(EIni.Pesquisa.PROD_Composta, true);
    chLembrarUltimaPesquisa.Checked := LeIni(EIni.Pesquisa.PROD_AbrirUltAcesso, true);
    chDetectarCampo.Checked         := LeIni(EIni.Pesquisa.PROD_DetectarCampo, true);
    chMultiplosCampos.Checked       := LeIni(EIni.Pesquisa.PROD_MultiplosCampos, true);
    chMostrarInativos.Checked       := MostraInativos;

    if chLembrarUltimaPesquisa.Checked then
      edDescricao.Text := LeIni(EIni.Pesquisa.PROD_UltimoPesquisado, '')
    else edDescricao.Clear;
    PegaInfoCampos;

    EditSelectAll := true;
    if (not Vazio(ValorEntrada)) and (not EntraCodigo) then
    begin
      EditSelectAll := not (ValorEntrada[length(ValorEntrada)] = '�');
      if not EditSelectAll then delete(ValorEntrada, length(ValorEntrada), 1);
      edDescricao.Text := ValorEntrada;
    end;

    UltimaPalavra := edDescricao.Text;
    IBPesquisa.Active := false;
    IBPesquisa.SQL.Clear;

    if chSomenteVinculados.Checked then Select := SelectComVinculo
                                   else Select := SelectNormal;

    IBPesquisa.SQL.Add(Select);
    PodePesquisar := true;

    if not Vazio(FiltroExterno) then
    begin
      IBPesquisa.Filter := FiltroExterno;
      IBPesquisa.Filtered := true;
    end;

    if EntraCodigo then
    begin
      edCodigo.SetFocus;
      edCodigo.Text := ValorEntrada;
      edDescricao.Clear;
    end
    else begin
      Notebook1.PageIndex := 0;
      edDescricao.SetFocus;

      ExecutaBuscaTexto;
      DefineColunas;

      if chLembrarUltimaPesquisa.Checked then
      begin
        S := LeIni(eIni.Pesquisa.PROD_UltimoPesquisado, '');
        try
          IBPesquisa.Locate('NM_PRODUTO', S, [loCaseInsensitive]);
        except
        end;
      end;
    end;

    if CodVenda.CodigoDaVenda > 0 then
    begin
      Caption := Caption + 'Cod. Venda: '+CodVenda.Descricao;
      lbCodVenda.Caption := CodVenda.Descricao;
      lbCodVenda.Visible :=  true;
    end
    else lbCodVenda.Visible := false;
  finally
    FechaAviso;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfPesqProduto.edDescricaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
                    if edDescricao.Text = UltimaPalavra then btOk.OnClick(Self)
                    else begin
                      ExecutaBuscaTexto;
                      edDescricao.SelectAll;
                    end;
                  end
                  else begin
                    btOk.OnClick(self);
                  end;
                end;
  end;
end;

procedure TfPesqProduto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_Escape : Close;
    vk_F3     : edDescricao.SetFocus;
    vk_F2     : if Shift = [] then if btCadastrar.Visible then btCadastrar.OnClick(self);
    vk_F5     : if Shift = [] then if btAlterar.Visible   then btAlterar.OnClick(self);
    vk_F8     : if Shift = [] then btMostrarPrecos.Click;
    vk_F9     : if Shift = [] then btMostrarEstoques.Click;
    vk_F12    : if Shift = [] then btMostrarFoto.Click;
  end;
end;

procedure TfPesqProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaIni(eIni.Pesquisa.PROD_Incremental,       CheckBoxIncremental.Checked);
  GravaIni(eIni.Pesquisa.PROD_Composta,          CheckBoxComposta.Checked);
  GravaIni(eIni.Pesquisa.PROD_AbrirUltAcesso,    chLembrarUltimaPesquisa.Checked);
  GravaIni(eIni.Pesquisa.PROD_DetectarCampo,     chDetectarCampo.Checked);
  GravaIni(eIni.Pesquisa.PROD_MultiplosCampos,   chMultiplosCampos.Checked);
  GravaIni(eIni.Pesquisa.PROD_UltimoPesquisado,  edDescricao.Text);
  GravaIni(eIni.Pesquisa.PROD_UltimoSelecionado, IBPesquisa.FieldByName('NM_PRODUTO').AsString);

  if chSomenteVinculados.Visible then
    GravaIni(eIni.Pesquisa.PROD_Vinculado, chSomenteVinculados.Checked);

  fDB.FechaTT(IBPesquisa);
end;

procedure TfPesqProduto.ExecutaBuscaTexto;
var
  Texto : String;
begin
  if not PodePesquisar then Exit;
  Texto := edDescricao.Text;

  if chMultiplosCampos.Checked then
    CM.BuscaTexto(IbPesquisa, Texto, Select, ['NM_PRODUTO', 'APLICACAO', 'G.STRING'], 'PRODUTOS', '', 'NM_PRODUTO', CheckBoxComposta.Checked)
  else
    CM.BuscaTexto(IbPesquisa, Texto, Select, ['NM_PRODUTO'], 'PRODUTOS', '', 'NM_PRODUTO', CheckBoxComposta.Checked);

  UltimaPalavra := edDescricao.Text;

  IBPesquisaPRECOCUSTO.Visible := MostraPrecoCusto;
  IBPesquisaGRUPO.Visible := chMultiplosCampos.Checked;
end;

procedure TfPesqProduto.edDescricaoChange(Sender: TObject);
begin
  if not (edDescricao.Focused) then Exit;

  if (edDescricao.Focused) and (chDetectarCampo.Checked) and (ENumeroInteiro(edDescricao.Text)) then
  begin
    DefineCampo('C');
    edCodigo.Text := edDescricao.Text;
    edCodigo.SetFocus;
    edCodigo.SelStart := length(edCodigo.Text);
    edDescricao.text := UltimoTexto;
    Exit;
  end;

  if CheckBoxIncremental.Checked then    // SE FOR INCREMENTAL...
    ExecutaBuscaTexto
  else
    UltimaPalavra := '';
end;

procedure TfPesqProduto.wwDBGridDblClick(Sender: TObject);
begin
  btOk.OnClick(self);
end;

procedure TfPesqProduto.wwDBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Pt : TPoint;
begin
//  if key in [vk_Down, vk_Up] then
  begin
    {Obt�m o point no centro do Button1}
    Pt.x := edDescricao.Left + (edDescricao.Width  div 2);
    Pt.y := edDescricao.Top  + (edDescricao.Height div 2);
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

procedure TfPesqProduto.CheckBoxIncrementalClick(Sender: TObject);
begin
  try
    edDescricao.SetFocus;
    ExecutaBuscaTexto;
  except
  end;
end;

procedure TfPesqProduto.chLembrarUltimaPesquisaClick(Sender: TObject);
begin
  PegaInfoCampos;
  try
    edDescricao.SetFocus;
  except
  end;
end;

procedure TfPesqProduto.chSomenteVinculadosClick(Sender: TObject);
begin
  if IBPesquisa.Active then
  begin
    IBPesquisa.Active := false;
    IBPesquisa.SQL.Clear;
    PegaInfoCampos;

    if chSomenteVinculados.Checked then Select := SelectComVinculo
                                   else Select := SelectNormal;
    IBPesquisa.SQL.Add(Select);

    try
      ExecutaBuscaTexto;
      edDescricao.SetFocus;
    except
    end;
  end;
end;

procedure TfPesqProduto.btOkClick(Sender: TObject);
var
  NaoPegouNada : Boolean;
begin
  BotaoPressionado := bpOk;
  NaoPegouNada := False;

  ItemEscolhido.CodInt := CodigoVazio;
  ItemEscolhido.CodExt := '';
  ItemEscolhido.SubCod := 0;
  ItemEscolhido.Descricao := '';

  case Notebook1.PageIndex of
    1 :  //C�digo
    begin
      NaoPegouNada := not PegouProdutoPeloCodigo;
    end;
    0 :  //Descri��o
    begin
      if IBPesquisa.IsEmpty then
        NaoPegouNada := True
      else begin
        RegProduto.CD_Produto := IBPesquisa.FieldByName('CD_PRODUTO').AsInteger;
        RegProduto.Cod_Barras := IBPesquisa.FieldByName('COD_BARRAS').AsString;
        RegProduto.Grade.CD_Grade := 0;
        RegProduto.NM_Produto := IBPesquisa.FieldByName('NM_PRODUTO').AsString;
      end;
    end;
  end;


  // V� se tem Grade...
  if (PodeAbrirGrade) and (CM.TemGrades(RegProduto.CD_Produto)) and (ItemEscolhido.SubCod = 0) then
  begin
    if not CM.PegaGrade(RegProduto.CD_Produto) then
      NaoPegouNada := True
    else begin
      ItemEscolhido.CodInt    := RegProduto.CD_Produto;
      ItemEscolhido.CodExt    := RegProduto.Cod_Barras;
      ItemEscolhido.SubCod    := RegProduto.Grade.CD_Grade;
      ItemEscolhido.Descricao := RegProduto.NM_Produto+' ('+RegProduto.Grade.Descricao+')';
    end
  end
  else begin
    ItemEscolhido.CodInt    := RegProduto.CD_Produto;
    ItemEscolhido.CodExt    := RegProduto.Cod_Barras;
    ItemEscolhido.SubCod    := RegProduto.Grade.CD_Grade;
    ItemEscolhido.Descricao := RegProduto.NM_Produto;
  end;

  if NaoPegouNada then
  begin
    ItemEscolhido.CodInt := CodigoVazio;
    ItemEscolhido.CodExt := '';
    ItemEscolhido.SubCod := 0;
    ItemEscolhido.Descricao := '';
  end;

  if not ModoConsulta then
    self.Close
  else begin
    case Notebook1.PageIndex of
      1 :  //C�digo
      begin
        edCodigo.SetFocus;
        edCodigo.SelectAll;
      end;
      0 :  //Descricao
      begin
        edDescricao.SetFocus;
        edDescricao.SelectAll;
      end;
    end;
  end;
end;

procedure TfPesqProduto.btCancelarClick(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
  ItemEscolhido.CodInt := CodigoVazio;
  ItemEscolhido.CodExt := '';
  ItemEscolhido.SubCod := 0;
  ItemEscolhido.Descricao := '';
  self.Close;
end;

procedure TfPesqProduto.AjustaPropriedadesDoForm;
begin
  btMostrarFoto.Visible := True;
  btMostrarPrecos.Visible := CM.TemCodVenda;
  btMostrarEstoques.Visible := CM.TemDepositos;
end;

procedure TfPesqProduto.PegaInfoCampos;
var
  SelectTemp : String;
  Preco      : String;
  CampoGrupo : String;
begin
  if CodVenda.CodigoDaVenda > 0 then
                                  Preco := 'TP.PRECO as PRECOVENDA'
                                else begin
                                  Preco := 'PRODUTOS.PDV_PRECOVENDA as PRECOVENDA';
                                end;
  if chMultiplosCampos.Checked then
    CampoGrupo := ', G.STRING as GRUPO '
  else
    CampoGrupo := ', '''' as GRUPO ';

  SelectNormal := ' SELECT PRODUTOS.COD_BARRAS, PRODUTOS.NM_PRODUTO, PRODUTOS.CD_PRODUTO, '+Preco+', PRODUTOS.PRECOCUSTO, E.ESTOQUEATUAL as QUANTESTOQUE, PRODUTOS.ESTOQUEMINIMO, PRODUTOS.APLICACAO, PRODUTOS.INATIVO '+CampoGrupo+PL+
                  ' FROM PRODUTOS '+PL+
                  ' left outer join SP_PEGAESTOQUE(PRODUTOS.CD_PRODUTO,  0) E on 1=1'+PL;

  if CodVenda.CodigoDaVenda > 0 then
    SelectNormal := SelectNormal + ' left outer join sp_tipopreco(PRODUTOS.CD_PRODUTO, '+IntToStr(CodVenda.CodigoDaVenda)+') TP on 1=1 ';
  if chMultiplosCampos.Checked then
    SelectNormal := SelectNormal + ' left outer join sp_string_grupo(PRODUTOS.CD_GRUPO) G on 1=1 ';

  SelectNormal := SelectNormal + ' where PRODUTOS.CD_PRODUTO > 0 ';
  if (not chMostrarInativos.Checked) then SelectNormal := SelectNormal + ' and PRODUTOS.INATIVO = ''F'' ';
  SelectComVinculo := SelectNormal + ' and PRODUTOS.CD_PRODUTO in (Select CD_PRODUTO from PRODFORNEC where CD_FORNECEDOR = '+IntToStr(Vinculo)+')';

  Filtro  := '';
end;

procedure TfPesqProduto.btCadastrarClick(Sender: TObject);
begin
  if not mUsers.TemAcessoPermissao(sgCadProdutos, 'I') then Exit;
  Application.CreateForm(TfNovoProduto, fNovoProduto);
  fNovoProduto.ShowModal;
  FreeAndNil(fNovoProduto);

  with CM do
  begin
    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select NM_PRODUTO from PRODUTOS');
    IBTabela.SQL.Add('where CD_PRODUTO = :CD_PRODUTO');
    if not IBTabela.Prepared then IBTabela.Prepare;
    IBTabela.ParamByName('CD_PRODUTO').AsInteger := ItemEsc.CodInt;
    IBTabela.Active := true;
    edDescricao.Text := IBTabela.FieldByName('NM_PRODUTO').AsString;
    edDescricao.SetFocus;
    edDescricao.SelectAll;
    if not CheckBoxIncremental.Checked then ExecutaBuscaTexto;
    fDB.FechaTT(IBTabela);
  end;
end;

procedure TfPesqProduto.btAlterarClick(Sender: TObject);
begin
  if Modulo = moPDV then Exit;
  if not mUsers.TemAcessoPermissao(sgCadProdutos, 'A') then Exit;
  Application.CreateForm(TfCadProdutos, fCadProdutos);
  AbreCad.EntraNaInclusao  := false;
  AbreCad.EntraNaAlteracao := IBPesquisa.FieldByName('CD_PRODUTO').AsInteger;
  fCadProdutos.ShowModal;

  with CM do
  begin
    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select NM_PRODUTO from PRODUTOS');
    IBTabela.SQL.Add('where CD_PRODUTO = :CD_PRODUTO');
    if not IBTabela.Prepared then IBTabela.Prepare;
    IBTabela.ParamByName('CD_PRODUTO').AsInteger := ItemEsc.CodInt;
    IBTabela.Active := true;
    edDescricao.Text := IBTabela.FieldByName('NM_PRODUTO').AsString;
    edDescricao.SetFocus;
    edDescricao.SelectAll;

    FreeAndNil(fCadProdutos);
    fDB.FechaTT(IBTabela);
  end;
end;

procedure TfPesqProduto.wwDBGridCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if (Field.FieldName = 'NM_PRODUTO') and (not Highlight) then
    ABrush.Color := clInfoBk;

  if (IBPesquisa.FieldByName('INATIVO').AsString = 'V') then
    AFont.Color := clGray
  else begin
    if (Field = IBPesquisa.FieldByName('QUANTESTOQUE')) then
    begin
      if (IBPesquisa.FieldByName('QUANTESTOQUE').AsCurrency <= 0) then
        AFont.Color := clRed
      else begin
        if (IBPesquisa.FieldByName('QUANTESTOQUE').AsCurrency <= IBPesquisa.FieldByName('ESTOQUEMINIMO').AsCurrency) then
          AFont.Color := $000080FF
        else begin
          if Highlight then
            AFont.Color := clWhite
          else
            AFont.Color := clBlack;
        end;
      end;
    end;
  end;

  if Highlight then
  begin
    ABrush.Color := clNavy;
    AFont.Style  := AFont.Style + [fsBold];
    AFont.Color  := clWhite;
  end;
end;

procedure TfPesqProduto.MostraGrade;
begin
  Application.CreateForm(TfSelecionaGrade, fSelecionaGrade);
  fSelecionaGrade.CD_PRODUTO := IBPesquisa.FieldByName('CD_PRODUTO').AsInteger;
  fSelecionaGrade.ShowModal;
  FreeAndNil(fSelecionaGrade);
end;

procedure TfPesqProduto.FormActivate(Sender: TObject);
begin
  if EditSelectAll then edDescricao.SelectAll
                   else edDescricao.SelStart := length(edDescricao.Text);
end;

procedure TfPesqProduto.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if CodigoEntrada = edCodigo.Text then btOk.Click;
  end
end;

procedure TfPesqProduto.LimpaProdutoPesquisado;
begin
  PegouProdutoPeloCodigo := false;
  lbDescricao.Font.Color := clBlack;
  lbCodigo.Caption := 'Entre com o C�digo do Produto desejado...';
  lbDescricao.Caption := '';
  lbQuantidade.Caption := '';
  lbEstoque.Caption := '';
  lbPreco.Caption := '';
  lbCapQuantidade.Visible := false;
  lbCapEstoque.Visible := false;
  lbCapPreco.Visible := false;
  Image1.Visible := false;
end;

procedure TfPesqProduto.DefineCampo(dcCodigoOuDescricao:char);
begin
  case dcCodigoOuDescricao of
    'C' : begin
            CodigoEntrada := '�';
            edCodigo.Color := clBlack;
            edCodigo.Font.Color := clYellow;
            edCodigo.SelectAll;
            lbCapCodigo.Font.Color := clBlack;
            edDescricao.Color := clSilver;
            edDescricao.Font.Color := clSilver;
            lbCapDescricao.Font.Color := clSilver;
            chLembrarUltimaPesquisa.Visible := false;
            GroupBoxModoPesquisa.Visible    := false;
            chSomenteVinculados.Visible     := false;
            chMultiplosCampos.Visible       := false;
            LimpaProdutoPesquisado;
            Notebook1.PageIndex := 1;
          end;
    'D' : begin
            edCodigo.Color := clSilver;
            edCodigo.Font.Color := clSilver;
            lbCapCodigo.Font.Color := clSilver;
            edDescricao.Color := clBlack;
            edDescricao.Font.Color := clYellow;
            edDescricao.SelectAll;
            lbCapDescricao.Font.Color := clBlack;
            chLembrarUltimaPesquisa.Visible := true;
            chMultiplosCampos.Visible       := true;
            GroupBoxModoPesquisa.Visible    := true;
            chSomenteVinculados.Visible     := true;
            Notebook1.PageIndex := 0;
            DefineColunas;
          end;

  end;
end;

procedure TfPesqProduto.DefineColunas;
begin
  try
    if not MostraPrecoCusto then
    begin
      wwDBGrid.ColWidthsPixels[0] := trunc(01.6 * wwDBGrid.Width / 100); // Coluna Fixa
      wwDBGrid.ColWidthsPixels[1] := trunc(15.3 * wwDBGrid.Width / 100); // C�digo
      wwDBGrid.ColWidthsPixels[2] := trunc(57.0 * wwDBGrid.Width / 100); // descri��o
      wwDBGrid.ColWidthsPixels[3] := trunc(10.1 * wwDBGrid.Width / 100); // Estoque
      wwDBGrid.ColWidthsPixels[4] := trunc(11.9 * wwDBGrid.Width / 100); // Pre�o
    end
    else begin
      wwDBGrid.ColWidthsPixels[0] := trunc(01.6 * wwDBGrid.Width / 100); // Coluna Fixa
      wwDBGrid.ColWidthsPixels[1] := trunc(15.3 * wwDBGrid.Width / 100); // C�digo
      wwDBGrid.ColWidthsPixels[2] := trunc(49.1 * wwDBGrid.Width / 100); // descri��o
      wwDBGrid.ColWidthsPixels[3] := trunc(10.1 * wwDBGrid.Width / 100); // Estoque
      wwDBGrid.ColWidthsPixels[4] := trunc(10.0 * wwDBGrid.Width / 100); // Pre�o
      wwDBGrid.ColWidthsPixels[5] := trunc(10.0 * wwDBGrid.Width / 100); // Custo
    end;
  except
  end;
end;

procedure TfPesqProduto.edCodigoEnter(Sender: TObject);
begin
  DefineCampo('C');
end;

procedure TfPesqProduto.edDescricaoEnter(Sender: TObject);
begin
  DefineCampo('D');
end;

procedure TfPesqProduto.edCodigoChange(Sender: TObject);
begin
  if (edCodigo.Focused) and (chDetectarCampo.Checked) and (Vazio(SoNumeros(edCodigo.Text))) then
  begin
    DefineCampo('D');
    edDescricao.Text := edCodigo.Text;
    edDescricao.SetFocus;
    edDescricao.SelStart := length(edDescricao.Text);
    edCodigo.Clear;
    Exit;
  end;
end;

procedure TfPesqProduto.chDetectarCampoClick(Sender: TObject);
begin
  try
    case Notebook1.PageIndex of
      0 : edDescricao.SetFocus;
      1 : edCodigo.SetFocus;
    end;
  except
  end;
end;

procedure TfPesqProduto.edDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  UltimoTexto := edDescricao.Text;
end;

procedure TfPesqProduto.btMostrarPrecosClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfPrecosDoProduto, fPrecosDoProduto);
    fPrecosDoProduto.CD_PRODUTO           := IBPesquisa.FieldByName('CD_PRODUTO').AsInteger;
    fPrecosDoProduto.ShowModal;
  finally
    FreeAndNil(fPrecosDoProduto);
  end;
end;

procedure TfPesqProduto.btMostrarEstoquesClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfEstoqueDepositos, fEstoqueDepositos);
    fEstoqueDepositos.CodProduto := IBPesquisa.FieldByName('CD_PRODUTO').AsInteger;
    fEstoqueDepositos.ModoConsulta := true;
    fEstoqueDepositos.ShowModal;
  finally
    FreeAndNil(fEstoqueDepositos);
  end;
end;

procedure TfPesqProduto.btMostrarFotoClick(Sender: TObject);
begin
  if (Notebook1.PageIndex = 1) and (not PegouProdutoPeloCodigo) then Exit; // Se a pesquisa � por C�DIGO e N�o pegou nada, cai fora...
  if (Notebook1.PageIndex = 0) and (IBPesquisa.RecordCount = 0) then Exit; // Se a pesquisa � por DESCRI��O e N�o tem registros, cai fora...

  try
    Application.CreateForm(TfMostraFoto, fMostraFoto);
    if Notebook1.PageIndex = 0 then
      CM.PegaDadosDoProduto(IBPesquisa.FieldByName('CD_PRODUTO').AsInteger, 0, true);

    if RegProduto.Foto.Empty then fMostraFoto.Image1.Picture := imgSemFoto.Picture
                             else fMostraFoto.Image1.Picture.Assign(RegProduto.Foto);

    fMostraFoto.Caption := IBPesquisa.FieldByName('COD_BARRAS').AsString +' - '+ IBPesquisa.FieldByName('NM_PRODUTO').AsString;
    fMostraFoto.ShowModal;
  finally
    FreeAndNil(fMostraFoto);
  end;
end;

end.


