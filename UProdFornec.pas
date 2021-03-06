//ok
unit UProdFornec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Mask, JvExMask,
  JvToolEdit, Buttons, JvBaseEdits, JvDBControls, DB, DBClient, IB_Components,
  JvExControls, JvGradient, JvLabel, JvSpin, ComCtrls, IB_Access, MessageFunctions;

const
  EstaChave = '\ProdFornec';

type
  TfProdFornec = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    wwDBGrid1: TwwDBGrid;
    GroupBox2: TGroupBox;
    btCalcular: TBitBtn;
    btSair: TBitBtn;
    DataSource1: TDataSource;
    JvGradient1: TJvGradient;
    Label1: TLabel;
    edPeriodo: TJvSpinEdit;
    GroupBox1: TGroupBox;
    edValorFrete: TJvCalcEdit;
    rgTipoFrete: TRadioGroup;
    Label2: TLabel;
    IBProdutos: TIB_Query;
    TRProdutos: TIB_Transaction;
    edObs: TMemo;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    edTempoEstimado: TJvSpinEdit;
    lbQtdeItems: TJvLabel;
    btGerarPedidoCompra: TBitBtn;
    lbValorTotal: TJvLabel;
    rgTipoQuantidade: TRadioGroup;
    CDS: TClientDataSet;
    CDSCOD_BARRAS: TStringField;
    CDSCODPRODFORNEC: TStringField;
    CDSNM_PRODUTO: TStringField;
    CDSUND_CONVERSAO: TCurrencyField;
    CDSPRECOCUSTO: TCurrencyField;
    CDSVALOR_IPI: TCurrencyField;
    CDSVALOR_FRETE: TCurrencyField;
    CDSCUSTOREAL: TCurrencyField;
    CDSQTDE_SUGERIDA: TCurrencyField;
    CDSQTDE_DESEJADA: TCurrencyField;
    CDSSUBTOTAL: TCurrencyField;
    CDSPRECOVENDA: TCurrencyField;
    CDSESTOQUEMINIMO: TCurrencyField;
    CDSESTOQUEATUAL: TCurrencyField;
    CDSMEDIADIARIA: TCurrencyField;
    CDSMEDIAMENSAL: TCurrencyField;
    CDSMES01: TCurrencyField;
    CDSMES02: TCurrencyField;
    CDSMES03: TCurrencyField;
    CDSMES04: TCurrencyField;
    CDSMES05: TCurrencyField;
    CDSMES06: TCurrencyField;
    CDSMES07: TCurrencyField;
    CDSMES08: TCurrencyField;
    CDSMES09: TCurrencyField;
    CDSMES10: TCurrencyField;
    CDSMES11: TCurrencyField;
    CDSMES12: TCurrencyField;
    CDSCD_PRODUTO: TIntegerField;
    CDSCD_GRUPO: TIntegerField;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    cbEstoque: TComboBox;
    Bevel1: TBevel;
    Panel4: TPanel;
    btAbrir: TSpeedButton;
    btSalvar: TSpeedButton;
    btExibir: TSpeedButton;
    btEditar: TSpeedButton;
    btApagar: TSpeedButton;
    OpenDialog1: TOpenDialog;
    btDesfazer: TSpeedButton;
    PageControl1: TPageControl;
    TabFornecedor: TTabSheet;
    TabRepresentante: TTabSheet;
    EditCDFornecedor: TEdit;
    btBuscaFornecedor: TSpeedButton;
    EditNmFornecedor: TEdit;
    EditCDRepresentante: TEdit;
    btBuscaRepresentante: TSpeedButton;
    EditNmRepresentante: TEdit;
    chMostrarQuantZero: TCheckBox;
    chMostrarProdInativos: TCheckBox;
    Label3: TLabel;
    edGrupo: TEdit;
    btBuscaGrupo: TBitBtn;
    procedure EditCDFornecedorChange(Sender: TObject);
    procedure EditCDFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCDFornecedorKeyPress(Sender: TObject; var Key: Char); procedure btBuscaFornecedorClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCalcularClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCDFornecedorExit(Sender: TObject);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject; AFieldName: String);
    procedure edObsEnter(Sender: TObject);
    procedure edObsExit(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure wwDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure btGerarPedidoCompraClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure btExibirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btAbrirClick(Sender: TObject);
    procedure btDesfazerClick(Sender: TObject);
    procedure EditCDRepresentanteChange(Sender: TObject);
    procedure EditCDRepresentanteExit(Sender: TObject);
    procedure EditCDRepresentanteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCDRepresentanteKeyPress(Sender: TObject; var Key: Char);
    procedure btBuscaRepresentanteClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btBuscaGrupoClick(Sender: TObject);
  private
    AlterouInformacoes : boolean;
    ValorTotal      : Currency;
    QtdeItems       : Integer;
    ChaveDoRegistro : String;
    ImprimeSegundaPagina : boolean;
    TaImprimindo    : boolean; 
    function TemErro: boolean;
    procedure Reseta;
    procedure ExibeTodasAsColunas;
    procedure CalculaTotais;
    procedure SalvaDesfazer;
    procedure ControlZ;
  public
    { Public declarations }
  end;

var
  fProdFornec: TfProdFornec;

implementation

uses DUtilit, UComum, DateUtils, UDataMod, UModPesquisa, UCadGruposProdutos,
     UConstVar, UModUsuarios, DBFunctions, UEditaProdFornec;

{$R *.dfm}

procedure TfProdFornec.Reseta;
begin
  CDS.EmptyDataSet;
end;

procedure TfProdFornec.EditCDFornecedorChange(Sender: TObject);
begin
  Reseta;
  CM.BuscaRegistro(EditCDFornecedor, EditNmFornecedor, 'FORNECEDORES', 'CD_FORNECEDOR', 'NM_FORNECEDOR', 'INATIVO <> ''V''');
  edObs.Clear;
end;

procedure TfProdFornec.EditCDFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if CM.F3OuAltDown(key, shift) then btBuscaFornecedor.Click;
end;

procedure TfProdFornec.EditCDFornecedorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in SetNumeros) then
    ItemEsc := mPesq.PesquisaDireto(key, pqFornecedores, [mdInclusao, mdAlteracao], EditCDFornecedor);
end;

procedure TfProdFornec.btBuscaFornecedorClick(Sender: TObject);
begin
  mPesq.Pesquisa(pqFornecedores, [], EditCdFornecedor, EditNmFornecedor.Text);
  EditCDFornecedorExit(EditCDFornecedor);
end;

procedure TfProdFornec.btSairClick(Sender: TObject);
begin
  if (not CDS.IsEmpty) and (AlterouInformacoes) then
  begin
    if MensagemDeConfirmacao('As informa��es editadas ser�o perdidas.'+PL+'Deseja sair?') <> mrYes then Exit;
  end;

  Close;
end;

procedure TfProdFornec.FormCreate(Sender: TObject);
var
  Arq : String;
begin
  Arq := PathComBarra(DiretorioDoExecutavel)+'PCTEMP.ctz';
  if FileExists(Arq) then DeleteFile(Arq);

  ChaveDoRegistro := RegChaveForms+EstaChave;

  rgTipoFrete.ItemIndex  := CM.BuscaValorDoComponente(self, rgTipoFrete, 0);
  rgTipoQuantidade.ItemIndex := CM.BuscaValorDoComponente(self, rgTipoQuantidade, 0);
  try edValorFrete.Value := StrToFloat(CM.BuscaValorDoComponente(self, edValorFrete, '0')); except end;
  edPeriodo.Value        := CM.BuscaValorDoComponente(self, edPeriodo, 6);
  edTempoEstimado.Value  := CM.BuscaValorDoComponente(self, edTempoEstimado, 30);
  EditCDFornecedor.Text  := CM.BuscaValorDoComponente(self, EditCDFornecedor, '');
  EditCDRepresentante.Text  := CM.BuscaValorDoComponente(self, EditCDRepresentante, '');
  PageControl1.ActivePageIndex  := CM.BuscaValorDoComponente(self, PageControl1, 0);
  chMostrarQuantZero.Checked    := CM.BuscaValorDoComponente(self, chMostrarQuantZero, true);
  chMostrarProdInativos.Checked := CM.BuscaValorDoComponente(self, chMostrarProdInativos, false);
  EditCDFornecedorExit(EditCDFornecedor);

  cbEstoque.Clear;
  cbEstoque.Items.Add('***** ESTOQUE GERAL *****' + Espacos200 + '�0');

  with CM do begin
    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select CD_DEPOSITO, NM_DEPOSITO from DEPOSITOS where INATIVO <> ''V'' order by NM_DEPOSITO');
    if not IBTabela.Prepared then IBTabela.Prepare;
    IBTabela.Active := true;
    while not IBTabela.eof do
    begin
      cbEstoque.Items.Add(IBTabela.FieldByName('NM_DEPOSITO').AsString + Espacos200 +'�'+ IBTabela.FieldByName('CD_DEPOSITO').AsString);
      IBTabela.Next;
    end;
    fDB.FechaTT(IBTabela);
  end;
  cbEstoque.ItemIndex := 0;
end;

procedure TfProdFornec.btCalcularClick(Sender: TObject);
type
  TRegMes = record
    Mes : word;
    Ano : word;
  end;
var
  VetMes : Array of TRegMes;
  Mes, Ano, i : word;
  Hoje : TDate;
  MediaMensal : Currency;
  MediaDiaria : Currency;
  P, R : Currency;
  CodEstoque : integer;
begin
  if (not CDS.IsEmpty) and (AlterouInformacoes) then
  begin
    if MensagemDeConfirmacao('As informa��es editadas ser�o perdidas.'+PL+'Deseja recalcular?') <> mrYes then Exit;
  end;

  if TemErro then Exit;

  AlterouInformacoes := false;
  lbQtdeItems.Visible := false;
  lbValorTotal.Visible := false;
  CM.SalvaValorDoComponente(self, rgTipoFrete, rgTipoFrete.ItemIndex);
  CM.SalvaValorDoComponente(self, rgTipoQuantidade, rgTipoQuantidade.ItemIndex);
  CM.SalvaValorDoComponente(self, edValorFrete, edValorFrete.Text);
  CM.SalvaValorDoComponente(self, edPeriodo, trunc(edPeriodo.Value));
  CM.SalvaValorDoComponente(self, edTempoEstimado, trunc(edTempoEstimado.Value));
  CM.SalvaValorDoComponente(self, EditCDFornecedor, EditCDFornecedor.Text);
  CM.SalvaValorDoComponente(self, EditCDRepresentante, EditCDRepresentante.Text);
  CM.SalvaValorDoComponente(self, chMostrarQuantZero, chMostrarQuantZero.Checked);
  CM.SalvaValorDoComponente(self, chMostrarProdInativos, chMostrarProdInativos.Checked);

  Reseta;
  btCalcular.Enabled := false;

  try
    try
      AbreAviso('Calculando informa��es', 0, 0, 100);
      Screen.Cursor := crHourGlass;

      CodEstoque := StrToIntZ(PegaAPartirDoUltimo(cbEstoque.Text, '�'), 0);

      ExibeTodasAsColunas;

      Hoje := CM.NowDoServidor;
      Mes := MonthOf(Hoje);
      Ano := YearOf(Hoje);
      setLength(VetMes, 1);
      VetMes[0].Mes := Mes;
      VetMes[0].Ano := Ano;
      for i := 1 to trunc(edPeriodo.Value) do
      begin
        dec(Mes);
        if Mes <= 0 then
        begin
          Mes := 12;
          dec(Ano);
        end;
        setLength(VetMes, Length(VetMes)+1);
        VetMes[i].Mes := Mes;
        VetMes[i].Ano := Ano;
      end;

      for i := 1 to 12 do
        CDS.FieldByName('MES'+PoeZeros(i, 2)).Visible := false;
      for i := length(VetMes)-1 downto 0 do
      begin
        CDS.FieldByName('MES'+PoeZeros(VetMes[i].Mes, 2)).Index := 100+i;
        CDS.FieldByName('MES'+PoeZeros(VetMes[i].Mes, 2)).Visible := true;
      end;

      IBProdutos.Active := false;
      IBProdutos.SQL.Clear;
      IBProdutos.SQL.Add('select');
      IBProdutos.SQL.Add('PRODFORNEC.COD_PROD_FORNEC   ,');
      IBProdutos.SQL.Add('PRODUTOS.CD_PRODUTO          ,');
      IBProdutos.SQL.Add('PRODUTOS.COD_BARRAS          ,');
      IBProdutos.SQL.Add('PRODUTOS.NM_PRODUTO          ,');
      IBProdutos.SQL.Add('PRODUTOS.UNIDADE             ,');
      IBProdutos.SQL.Add('PRODUTOS.PRECOCUSTO          ,');
      IBProdutos.SQL.Add('PRODUTOS.CD_GRUPO            ,');
      IBProdutos.SQL.Add('coalesce(PRODUTOS.IPI, 0) IPI,');
      IBProdutos.SQL.Add('PRODUTOS.PRECOVENDA         ,');
      IBProdutos.SQL.Add('coalesce(PRODUTOS.UNDCONVERSAOENTRADA, 1) UNDCONVERSAO,');
      IBProdutos.SQL.Add('coalesce(PRODUTOS.ESTOQUEMINIMO, 0) EST_MINIMO,');
      IBProdutos.SQL.Add('E.ESTOQUEATUAL as EST_ATUAL,');
      IBProdutos.SQL.Add('REFPRODUTOS.DT_ULTIMACOMPRA  ,');
      IBProdutos.SQL.Add('REFPRODUTOS.DT_ULTIMAVENDA    ');

      if PageControl1.ActivePage = TabFornecedor then
        IBProdutos.SQL.Add('from PRODFORNEC')
      else begin
        IBProdutos.SQL.Add('from REPRESENT_FORNEC');
        IBProdutos.SQL.Add('left outer join PRODFORNEC on PRODFORNEC.CD_FORNECEDOR = REPRESENT_FORNEC.CD_FORNECEDOR');
      end;

      IBProdutos.SQL.Add('inner join PRODUTOS on PRODUTOS.CD_PRODUTO = PRODFORNEC.CD_PRODUTO');
      IBProdutos.SQL.Add('left outer join REFPRODUTOS on REFPRODUTOS.CD_PRODUTO = PRODFORNEC.CD_PRODUTO');

      if CodEstoque > 0 then
      begin
        IBProdutos.SQL.Add('left outer join SP_PEGAESTOQUE(PRODUTOS.CD_PRODUTO,  0, '+IntToStr(CodEstoque)+') E on 1=1');
        IBProdutos.SQL.Add('left outer join ESTOQUE on ESTOQUE.CD_DEPOSITO = '+IntToStr(CodEstoque)+' and ESTOQUE.CD_PRODUTO = PRODFORNEC.CD_PRODUTO');
      end
      else begin
        IBProdutos.SQL.Add('left outer join SP_PEGAESTOQUE(PRODUTOS.CD_PRODUTO,  0, 0) E on 1=1');
      end;

      if PageControl1.ActivePage = TabFornecedor then
        IBProdutos.SQL.Add('WHERE PRODFORNEC.CD_FORNECEDOR = :FORNECEDOR')
      else
        IBProdutos.SQL.Add('WHERE REPRESENT_FORNEC.CD_REPRESENTANTE = :CD_REPRESENTANTE');

      if not chMostrarProdInativos.Checked then
        IBProdutos.SQL.Add('AND PRODUTOS.INATIVO <> ''V'' ');

      if edGrupo.tag <> 0 then
        IBProdutos.SQL.Add('and (select PERTENCE from SP_PERTENCE_AO_GRUPO(PRODUTOS.CD_GRUPO, '+intToStr(edGrupo.tag)+')) = ''V'' ');
      IBProdutos.SQL.Add('order by PRODUTOS.NM_PRODUTO');
      fDB.SalvaSQL(IBProdutos.SQL);

      if not IBProdutos.Prepared then IBProdutos.Prepare;
      if PageControl1.ActivePage = TabFornecedor then
        IBProdutos.ParamByName('FORNECEDOR').AsString := EditCDFornecedor.Text
      else
        IBProdutos.ParamByName('CD_REPRESENTANTE').AsString := EditCDRepresentante.Text;

      IBProdutos.Active := true;
      MaxProgressoAviso(IBProdutos.RecordCount);
      IBProdutos.First;
      ValorTotal := 0;
      QtdeItems  := 0;
      while not IBProdutos.eof do
      begin
        IncProgressoAviso;
        CDS.Append;
        CDS.FieldByName('CD_PRODUTO').AsInteger      := IBProdutos.FieldByName('CD_PRODUTO').AsInteger;
        CDS.FieldByName('COD_BARRAS').AsString       := IBProdutos.FieldByName('COD_BARRAS').AsString;
        CDS.FieldByName('CODPRODFORNEC').AsString    := IBProdutos.FieldByName('COD_PROD_FORNEC').AsString;
        CDS.FieldByName('NM_PRODUTO').AsString       := IBProdutos.FieldByName('NM_PRODUTO').AsString;
        CDS.FieldByName('CD_GRUPO').AsInteger        := IBProdutos.FieldByName('CD_GRUPO').AsInteger;
        CDS.FieldByName('PRECOCUSTO').AsCurrency     := IBProdutos.FieldByName('PRECOCUSTO').AsCurrency;
        CDS.FieldByName('VALOR_IPI').AsCurrency      := (IBProdutos.FieldByName('IPI').AsCurrency * IBProdutos.FieldByName('PRECOCUSTO').AsCurrency)/100;
        CDS.FieldByName('ESTOQUEATUAL').AsCurrency   := IBProdutos.FieldByName('EST_ATUAL').AsCurrency;
        CDS.FieldByName('ESTOQUEMINIMO').AsCurrency  := IBProdutos.FieldByName('EST_MINIMO').AsCurrency;
        CDS.FieldByName('PRECOVENDA').AsCurrency     := IBProdutos.FieldByName('PRECOVENDA').AsCurrency;
        CDS.FieldByName('UND_CONVERSAO').AsCurrency  := IBProdutos.FieldByName('UNDCONVERSAO').AsCurrency;

        // Calcula vendas mensais
        with DtM do
        begin
          IBTabela.Active := false;
          IBTabela.SQL.Clear;
          IBTabela.SQL.Add('select');
          IBTabela.SQL.Add('sum(VI.QUANTIDADE) as QUANTIDADE');
          IBTabela.SQL.Add('from PEDIDO_ITEM VI');
          IBTabela.SQL.Add('left outer join PEDIDO V on V.NUM_DOCUMENTO = VI.NUM_DOCUMENTO ');
          IBTabela.SQL.Add('where VI.CD_PRODUTO = :CD_PRODUTO            ');
          IBTabela.SQL.Add('and   V.CANCELADO <> ''V''                   ');
          IBTabela.SQL.Add('and   extract(month from V.DATA_HORA) = :MES ');
          IBTabela.SQL.Add('and   extract(year  from V.DATA_HORA) = :ANO ');

          MediaMensal := 0;
          for i := 0 to length(VetMes)-1 do
          begin
            IBTabela.Active := false;
            if not IBTabela.prepared then IBTabela.prepare;
            IBTabela.ParamByName('CD_PRODUTO').AsInteger := IBProdutos.FieldByName('CD_PRODUTO').AsInteger;
            IBTabela.ParamByName('MES').AsInteger := vetMes[i].Mes;
            IBTabela.ParamByName('ANO').AsInteger := vetMes[i].Ano;
            IBTabela.Active := true;

            if i > 0 then MediaMensal := MediaMensal + IBTabela.FieldByName('QUANTIDADE').AsCurrency;
            CDS.FieldByName('MES'+PoeZeros(vetMes[i].Mes, 2)).AsCurrency := IBTabela.FieldByName('QUANTIDADE').AsCurrency;
          end;
          fDB.FechaTT(IBTabela);
        end;
        MediaMensal := DivZero(MediaMensal, length(VetMes)-1);
        MediaDiaria := DivZero(MediaMensal, 30);

        CDS.FieldByName('MEDIAMENSAL').AsCurrency := MediaMensal;
        CDS.FieldByName('MEDIADIARIA').AsCurrency := MediaDiaria;
        case rgTipoFrete.ItemIndex of
          0 : CDS.FieldByName('VALOR_FRETE').AsCurrency := 0;
          1 : CDS.FieldByName('VALOR_FRETE').AsCurrency := edValorFrete.Value / CDS.FieldByName('UND_CONVERSAO').AsCurrency;
          2 : CDS.FieldByName('VALOR_FRETE').AsCurrency := edValorFrete.Value;
        end;
        CDS.FieldByName('CUSTOREAL').AsCurrency       := CDS.FieldByName('PRECOCUSTO').AsCurrency + CDS.FieldByName('VALOR_IPI').AsCurrency + CDS.FieldByName('VALOR_FRETE').AsCurrency;

        if (edTempoEstimado.Value = 0) and (edPeriodo.Value = 0) then
        begin
          CDS.FieldByName('QTDE_SUGERIDA').AsCurrency := NegatZero(IBProdutos.FieldByName('EST_MINIMO').AsCurrency - IBProdutos.FieldByName('EST_ATUAL').AsCurrency);
        end
        else begin
          CDS.FieldByName('QTDE_SUGERIDA').AsCurrency   := NegatZero((MediaDiaria * edTempoEstimado.Value) + CDS.FieldByName('ESTOQUEMINIMO').AsCurrency - CDS.FieldByName('ESTOQUEATUAL').AsCurrency);
          if rgTipoQuantidade.itemindex = 1 then
            CDS.FieldByName('QTDE_SUGERIDA').AsCurrency := NegatZero(CDS.FieldByName('QTDE_SUGERIDA').AsCurrency / CDS.FieldByName('UND_CONVERSAO').AsCurrency);
        end;

        CDS.FieldByName('QTDE_DESEJADA').AsCurrency   := NegatZero(CDS.FieldByName('QTDE_SUGERIDA').AsCurrency);
        CDS.FieldByName('SUBTOTAL').AsCurrency        := CDS.FieldByName('CUSTOREAL').AsCurrency * CDS.FieldByName('QTDE_DESEJADA').AsCurrency;

        if (CDS.FieldByName('QTDE_SUGERIDA').AsCurrency = 0) and (not chMostrarQuantZero.Checked) then
          CDS.Cancel
        else
          CDS.Post;

        inc(QtdeItems);
        ValorTotal := ValorTotal + CDS.FieldByName('SUBTOTAL').AsCurrency;
        IBProdutos.Next;
        Application.ProcessMessages;
      end;

      lbQtdeItems.Caption  := 'Itens: '+formatCurr(',00.', QtdeItems);
      lbValorTotal.Caption := 'Total: '+formatCurr('R$ ,0.00', ValorTotal);
      lbQtdeItems.Visible := true;
      lbValorTotal.Visible := true;
      fDB.FechaTT(IBProdutos);

      if (rgTipoFrete.ItemIndex = 0) and (edValorFrete.Value > 0) then
      begin
        IncProgressoAviso;
        AbreAviso('Calculando Frete', 0, 0, CDS.RecordCount);
        CDS.First;
        while not CDS.eof do
        begin
          P := (CDS.FieldByName('SUBTOTAL').AsCurrency * 100)/ValorTotal;
          P := (edValorFrete.Value * P)/100;
          CDS.Edit;
          CDS.FieldByName('VALOR_FRETE').AsCurrency := P;
          CDS.Post;
          CDS.Next;
          Application.ProcessMessages;
        end;
      end;
    except
      MensagemDeErro('N�o foi poss�vel calcular as informa��es');
    end;
  finally
    FechaAviso;
    Screen.Cursor := crDefault;
    btCalcular.Enabled := true;
  end;
end;

function TfProdFornec.TemErro: boolean;
begin
  result := false;

  if (not result) and (vazio(EditNmFornecedor.Text)) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio indicar um Fornecedor!');
    EditCDFornecedor.SetFocus;
  end;
end;

procedure TfProdFornec.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_F9     : if btCalcular.Enabled then btCalcular.Click;
    vk_F11    : if btGerarPedidoCompra.Enabled then btGerarPedidoCompra.Click;
    ord('O')  : if Shift = [ssCtrl] then if btAbrir.Enabled    then btAbrir.Click;
    ord('S')  : if Shift = [ssCtrl] then if btSalvar.Enabled   then btSalvar.Click;
    ord('Z')  : if Shift = [ssCtrl] then if btDesfazer.Enabled then btDesfazer.Click;
    VK_ESCAPE : btSair.Click;
  end;
end;

procedure TfProdFornec.EditCDFornecedorExit(Sender: TObject);
begin
  with DtM do
  begin
    if not vazio(EditNmFornecedor.Text) then
    begin
      CM.PegaDadosDoFornecedor(StrToIntZ(TiraEspacos(EditCDFornecedor.Text), 0), nil);
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Select OBS from FORNECEDORES where CD_FORNECEDOR = :CD_FORNECEDOR');
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.ParamByName('CD_FORNECEDOR').AsString := EditCDFornecedor.Text;
      IBTabela.Active := true;
      IBTabela.FieldByName('OBS').AssignTo(edOBS.Lines);
      fDB.FechaTT(IBTabela);
    end;
  end;
end;

procedure TfProdFornec.wwDBGrid1TitleButtonClick(Sender: TObject; AFieldName: String);
begin
  CDS.FieldByName(AFieldName).Visible := false;
end;

procedure TfProdFornec.edObsEnter(Sender: TObject);
begin
  edObs.Color := clWhite;
  edObs.ReadOnly := false;
end;

procedure TfProdFornec.edObsExit(Sender: TObject);
begin
  try
    with DtM do
    begin
      try
        if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
        IBTabela.Active := false;
        IBTabela.SQL.Clear;
        if PageControl1.ActivePage = TabFornecedor then
        begin
          IBTabela.SQL.Add('Update FORNECEDORES set OBS = :OBS');
          IBTabela.SQL.Add('where CD_FORNECEDOR = :COD');
          if not IBTabela.Prepared then IBTabela.Prepare;
          IBTabela.ParamByName('OBS').Assign(edOBS.Lines);
          IBTabela.ParamByName('COD').AsInteger := StrToIntZ(EditCDFornecedor.Text, 0);
        end
        else begin
          IBTabela.SQL.Add('Update REPRESENTANTES set OBS = :OBS');
          IBTabela.SQL.Add('where CD_REPRESENTANTE = :COD');
          if not IBTabela.Prepared then IBTabela.Prepare;
          IBTabela.ParamByName('OBS').Assign(edOBS.Lines);
          IBTabela.ParamByName('COD').AsInteger := StrToIntZ(EditCDRepresentante.Text, 0);
        end;
        IBTabela.ExecSQL;
        IBTabela.IB_Transaction.Commit;
      except;
        IBTabela.IB_Transaction.Rollback;
      end;
    end;
  finally
    edObs.Color := clYellow;
    edObs.ReadOnly := true;
  end;
end;

procedure TfProdFornec.wwDBGrid1DblClick(Sender: TObject);
begin
  btEditar.Click;
end;

procedure TfProdFornec.wwDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_F5     : btEditar.Click;
    VK_DELETE, VK_F4 : btApagar.Click;
  end;
end;

procedure TfProdFornec.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Field.FieldName = 'MES'+PoeZeros(MonthOf(CM.NowDoServidor), 2) then
  begin
    AFont.Style := [fsBold];
    AFont.Color := clRed;
  end;

  if not Highlight then
  begin
    if ExistePalavra(Field.FieldName, 'MES', false) then
    begin
      ABrush.Color := clInfoBk;
    end;
  end;
end;

procedure TfProdFornec.btGerarPedidoCompraClick(Sender: TObject);
var
  i, NumPedido, CDItem: Integer;
begin
  if not mUsers.TemAcessoPermissao(sgPedidoDeCompra, 'I') then Exit;
  if PageControl1.ActivePage = TabRepresentante then
  begin
    MensagemDeInformacao('Este recurso n�o est� dispon�vel para Representantes.'+PL+'Somente Fornecedores.');
    Exit;
  end;

  if MensagemDeConfirmacao('Deseja realmente Gerar um pedido de compra com os registros apresentados?') <> mrYes then exit;

  try
    btGerarPedidoCompra.Enabled := false;
    Screen.Cursor := crHourGlass;
    AbreAviso('Gerando Pedido de Compra', 0, 0, CDS.RecordCount);
    NumPedido := fDB.GetValorDoGenerator(DtM.IBDatabaseServer, 'GEN_PEDIDOSDECOMPRA');
    with DtM do
    begin
      fDB.CadastraValores(DtM.IBDatabaseServer,
             'PEDIDOSDECOMPRA',
            ['NUM_PEDIDO',     NumPedido,
             'CNPJ',           RegFornecedor.CNPJ,
             'CD_FORNECEDOR',  RegFornecedor.Cd_Fornecedor,
             'NM_FORNECEDOR',  RegFornecedor.Nm_Fornecedor,
             'CD_USUARIO',     RegUsuario.Cd_Usuario,
             'LOGIN',          RegUsuario.Login,
             'BAIXADA',        'F',
             'FECHADA',        'F',
             'NUM_TERMINAL',   RegTerm.IDNumTerminal]);

      try
        if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
        IBTabela.Active := false;
        IBTabela.SQL.Clear;
        IBTabela.SQL.Add('Update PEDIDOSDECOMPRA set OBS = :OBS where NUM_PEDIDO = :NUM_PEDIDO');
        if not IBTabela.Prepared then IBTabela.Prepare;
        IBTabela.ParamByName('OBS').Assign(edObs.Lines);
        IBTabela.ParamByName('NUM_PEDIDO').AsInteger := NumPedido;
        IBTabela.ExecSQL;
        IBTabela.IB_Transaction.Commit;
      except
        IBTabela.IB_Transaction.Rollback;
      end;

      i := 1;
      CDS.First;
      while not CDS.eof do
      begin
        IncProgressoAviso;
        CDItem := fDB.GetValorDoGenerator(DtM.IBDatabaseServer, 'GEN_PEDIDOSDECOMPRA_ITEMS');
        fDB.CadastraValores(DtM.IBDatabaseServer,
              'PEDIDOSDECOMPRA_ITEMS',
             ['NUM_PEDIDO',     NumPedido,
              'CD_ITEM',        CDItem,
              'CD_PRODUTO',     CDS.FieldByName('CD_PRODUTO').AsInteger,
              'NM_PRODUTO',     CDS.FieldByName('NM_PRODUTO').AsString,
              'COD_BARRAS',     CDS.FieldByName('COD_BARRAS').AsString,
              'QUANTIDADE',     CDS.FieldByName('QTDE_DESEJADA').AsCurrency,
              'VALOR',          CDS.FieldByName('CUSTOREAL').AsCurrency,
              'UNDCONVERSAO',   CDS.FieldByName('UND_CONVERSAO').AsCurrency,
              'VALOR_UNITARIO', CDS.FieldByName('PRECOCUSTO').AsCurrency,
              'SEQUENCIAL',     i,
              'CD_GRUPO',       CDS.FieldByName('CD_GRUPO').AsInteger,
              'BAIXADO',        'F']);

        inc(i);
        CDS.Next;
      end;
      FechaAviso;
      Screen.Cursor := crDefault;
      MensagemDeInformacao('Ok.');
    end;
  finally
    btGerarPedidoCompra.Enabled := true;
    FechaAviso;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfProdFornec.btEditarClick(Sender: TObject);
var
  Dif : Currency;
begin
  if CDS.IsEmpty then Exit;
  Application.CreateForm(TfEditaProdFornec, fEditaProdFornec);
  fEditaProdFornec.edPrecoCusto.Value := CDS.FieldByName('PRECOCUSTO').AsCurrency;
  fEditaProdFornec.edQuantidade.Value := CDS.FieldByName('QTDE_DESEJADA').AsCurrency;
  fEditaProdFornec.edSubtotal.Value := fEditaProdFornec.edPrecoCusto.Value * fEditaProdFornec.edQuantidade.Value;
  fEditaProdFornec.ShowModal;
  if fEditaProdFornec.BotaoPressionado = bpOk then
  begin
    AlterouInformacoes := true;
    Dif := (CDS.FieldByName('PRECOCUSTO').AsCurrency * CDS.FieldByName('QTDE_DESEJADA').AsCurrency) - (fEditaProdFornec.edPrecoCusto.Value * fEditaProdFornec.edQuantidade.Value);
    ValorTotal := ValorTotal - Dif;
    lbValorTotal.Caption := 'Total: '+formatCurr('R$ ,0.00', ValorTotal);
    SalvaDesfazer;
    CDS.Edit;
    CDS.FieldByName('PRECOCUSTO').AsCurrency    := fEditaProdFornec.edPrecoCusto.Value;
    CDS.FieldByName('QTDE_DESEJADA').AsCurrency := fEditaProdFornec.edQuantidade.Value;
    CDS.FieldByName('SUBTOTAL').AsCurrency      := fEditaProdFornec.edSubtotal.Value;
    CDS.Post;
  end;
  FreeAndNil(fEditaProdFornec);

//  CalculaTotais;
end;

procedure TfProdFornec.btApagarClick(Sender: TObject);
begin
  if CDS.IsEmpty then Exit;
  ValorTotal := ValorTotal - CDS.FieldByName('SUBTOTAL').AsCurrency;
  dec(QtdeItems);
  lbQtdeItems.Caption  := 'Itens: '+formatCurr(',00.', QtdeItems);
  lbValorTotal.Caption := 'Total: '+formatCurr('R$ ,0.00', ValorTotal);
  AlterouInformacoes := true;
  SalvaDesfazer;
  CDS.Delete;

  //  CalculaTotais;
end;

procedure TfProdFornec.ExibeTodasAsColunas;
var
  i : word;
begin
  for i := 0 to CDS.FieldCount-1 do
    if (CDS.Fields[i].FieldName <> 'CD_PRODUTO')  and
       (CDS.Fields[i].FieldName <> 'CD_GRUPO')    then
      CDS.Fields[i].Visible := true;
end;

procedure TfProdFornec.btExibirClick(Sender: TObject);
begin
  ExibeTodasAsColunas;
end;

procedure TfProdFornec.btSalvarClick(Sender: TObject);
var
  N : Integer;
  Arq : String;
begin
  N := fDB.GetValorDoGenerator(DtM.IBDatabaseServer, 'GEN_PRODFORNEC');
  Arq := PathComBarra(DiretorioDoExecutavel)+'PC'+PoeZeros(N, 6)+'.xml';
  CDS.SaveToFile(Arq, dfXMLUTF8);
  MensagemDeInformacao('Ok.'+PL+'Informa��es salvas em:'+PL+Arq);
end;

procedure TfProdFornec.btAbrirClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    AbreAviso('Abrindo Arquivo');
    Screen.Cursor := crHourGlass;
    try
      CDS.LoadFromFile(OpenDialog1.FileName);
    finally
      FechaAviso;
      CalculaTotais;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfProdFornec.CalculaTotais;
var
  Book : TBookMark;
begin
  QtdeItems  := 0;
  ValorTotal := 0;
  AbreAviso('Calculando Valores');
  Screen.Cursor := crHourGlass;
  CDS.DisableControls;
  try
    Book := CDS.GetBookmark;
    CDS.First;
    while not CDS.Eof do
    begin
      ValorTotal := ValorTotal + CDS.FieldByName('SUBTOTAL').AsCurrency;
      QtdeItems  := QtdeItems + 1;
      CDS.Next;
    end;
  finally
    CDS.GotoBookmark(Book);
    CDS.FreeBookmark(Book);
    FechaAviso;
    Screen.Cursor := crDefault;
    CDS.EnableControls;
  end;

  lbQtdeItems.Caption  := 'Itens: '+formatCurr(',00.', QtdeItems);
  lbValorTotal.Caption := 'Total: '+formatCurr('R$ ,0.00', ValorTotal);
  lbValorTotal.Visible := true;
  lbQtdeItems.Visible  := true;
end;

procedure TfProdFornec.SalvaDesfazer;
var
  Arq : String;
begin
  Arq := PathComBarra(DiretorioDoExecutavel)+'PCTEMP.ctz';
  CDS.SaveToFile(Arq, dfXMLUTF8);
end;

procedure TfProdFornec.ControlZ;
var
  Book : TBookMark;
  Arq, Arq2 : String;
begin
  Arq2 := PathComBarra(DiretorioDoExecutavel)+'PCTEMP2.ctz';
  CDS.SaveToFile(Arq2, dfXMLUTF8);

  Arq := PathComBarra(DiretorioDoExecutavel)+'PCTEMP.ctz';
  if not FileExists(Arq) then Exit;

  AbreAviso('Desfazendo opera��es');
  Book := CDS.GetBookmark;
  Screen.Cursor := crHourGlass;
  try
    CDS.LoadFromFile(Arq);
  finally
    CDS.GotoBookmark(Book);
    CDS.FreeBookmark(Book);
    FechaAviso;
    CalculaTotais;

    try
      deleteFile(Arq);
      RenameFile(Arq2, Arq);
    except end;

    Screen.Cursor := crDefault;
  end;
end;

procedure TfProdFornec.btDesfazerClick(Sender: TObject);
begin
  ControlZ;
end;

procedure TfProdFornec.EditCDRepresentanteChange(Sender: TObject);
begin
  Reseta;
  CM.BuscaRegistro(EditCDRepresentante, EditNmRepresentante, 'REPRESENTANTES', 'CD_REPRESENTANTE', 'NM_REPRESENTANTE', 'INATIVO <> ''V''');
  edObs.Clear;
end;

procedure TfProdFornec.EditCDRepresentanteExit(Sender: TObject);
begin
  with DtM do
  begin
    if not vazio(EditNmRepresentante.Text) then
    begin
      CM.PegaDadosDoRepresentante(StrToIntZ(TiraEspacos(EditCDRepresentante.Text), 0), nil);
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Select OBS from REPRESENTANTES where CD_REPRESENTANTE = :CD_REPRESENTANTE');
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.ParamByName('CD_REPRESENTANTE').AsString := EditCDRepresentante.Text;
      IBTabela.Active := true;
      IBTabela.FieldByName('OBS').AssignTo(edOBS.Lines);
      fDB.FechaTT(IBTabela);
    end;
  end;
end;

procedure TfProdFornec.EditCDRepresentanteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if CM.F3OuAltDown(key, shift) then btBuscaRepresentante.Click;
end;

procedure TfProdFornec.EditCDRepresentanteKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in SetNumeros) then
    ItemEsc := mPesq.PesquisaDireto(key, pqRepresentantes, [mdInclusao, mdAlteracao], EditCDRepresentante);
end;

procedure TfProdFornec.btBuscaRepresentanteClick(Sender: TObject);
begin
  mPesq.Pesquisa(pqRepresentantes, [], EditCdRepresentante, EditNmRepresentante.Text);
  EditCDRepresentanteExit(EditCDRepresentante);
end;

procedure TfProdFornec.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabFornecedor then
    EditCDFornecedorExit(self)
  else
    EditCDRepresentanteExit(self);
end;

procedure TfProdFornec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CM.SalvaValorDoComponente(self, PageControl1, PageControl1.ActivePageIndex);
end;

procedure TfProdFornec.FormShow(Sender: TObject);
begin
  FechaAviso;
  Screen.Cursor := crDefault;
end;

procedure TfProdFornec.edGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_Return) then
  begin
    btBuscaGrupo.Click;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfProdFornec.btBuscaGrupoClick(Sender: TObject);
begin
  if not mUsers.TemAcessoPermissao(sgCadGrupos, 'L') then Exit;
  Application.CreateForm(TfCadGruposProdutos, fCadGruposProdutos);
  fCadGruposProdutos.CD_GRUPO := edGrupo.Tag;
  fCadGruposProdutos.ShowModal;
  if fCadGruposProdutos.BotaoPressionado = bpOk then
  begin
    edGrupo.Tag := fCadGruposProdutos.CD_GRUPO;
    if edGrupo.Tag = 0 then edGrupo.Text := '*** TODOS OS GRUPOS ***'
                       else edGrupo.Text := CM.StringGrupo(edGrupo.Tag);
  end;
  FreeAndNil(fCadGruposProdutos);
end;

end.
