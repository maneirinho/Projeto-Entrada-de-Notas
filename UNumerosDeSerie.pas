//ok
unit UNumerosDeSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, UDataMod, DB, IBODataset, Grids,
  Wwdbigrd, Wwdbgrid, IB_Components, MessageFunctions;

type
  TfNumerosDeSerie = class(TForm)
    PanelProduto: TPanel;
    GroupBox9: TGroupBox;
    SpeedButtonProduto: TSpeedButton;
    EditCodProduto: TEdit;
    EditNomeProduto: TEdit;
    DBGrid: TwwDBGrid;
    IBNumSeries: TIBOQuery;
    DataSource1: TDataSource;
    IBOTransaction: TIBOTransaction;
    IBNumSeriesCD_PRODUTO: TIntegerField;
    IBNumSeriesNUMSERIE: TStringField;
    IBNumSeriesCD_NOTAENTRADA: TIntegerField;
    IBNumSeriesNUM_DOC_VENDA: TIntegerField;
    IBNumSeriesDISPONIVEL: TStringField;
    IBNumSeriesNUM_DOC_DEVOLUCAO: TIntegerField;
    IBNumSeriesDT_DEVOLUCAO: TDateTimeField;
    chMostrarDisponiveis: TCheckBox;
    Panel1: TPanel;
    btConsultar: TBitBtn;
    btIncluir: TBitBtn;
    btFechar: TBitBtn;
    btExcluir: TBitBtn;
    procedure btFecharClick(Sender: TObject);
    procedure EditCodProdutoChange(Sender: TObject);
    procedure EditCodProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButtonProdutoClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure DBGridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure EditNomeProdutoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure chMostrarDisponiveisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
  private
    procedure BuscaNumerosDeSerie;
  public
    { Public declarations }
  end;

var
  fNumerosDeSerie: TfNumerosDeSerie;

implementation

uses DUtilit, UComum, USelecProdNumSerie,
     UConstVar, UComp, UModPesquisa, UEntradaNumSerie, DBFunctions, USitNumSerie, UNumSerie;

{$R *.dfm}

procedure TfNumerosDeSerie.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfNumerosDeSerie.EditCodProdutoChange(Sender: TObject);
begin
  if vazio(EditCodProduto.Text) then
  begin
    EditNomeProduto.Clear;
    Exit;
  end;

  with DtM do
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

procedure TfNumerosDeSerie.EditCodProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if CM.F3OuAltDown(key, Shift) then SpeedButtonProduto.Click;
end;

procedure TfNumerosDeSerie.EditCodProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if Vazio(EditCodProduto.Text) or (EditCodProduto.SelLength = Length(EditCodProduto.Text)) then
    ItemEsc := mPesq.PesquisaDireto(key, pqProdutos, [], EditCodProduto);

end;

procedure TfNumerosDeSerie.SpeedButtonProdutoClick(Sender: TObject);
begin
  ItemEsc := mPesq.Pesquisa(pqProdutos, [mdAlteracao], EditCodProduto, EditNomeProduto.Text);
end;

procedure TfNumerosDeSerie.BuscaNumerosDeSerie;
begin
  if vazio(EditNomeProduto.Text) then
  begin
    IBNumSeries.Active := false;
  end
  else begin
    IBNumSeries.Active := false;
    IBNumSeries.SQL.Clear;
    IBNumSeries.SQL.Add('Select * from NUMSERIE');
    IBNumSeries.SQL.Add('where CD_PRODUTO = :CD_PRODUTO');
    if chMostrarDisponiveis.Checked then IBNumSeries.SQL.Add('and DISPONIVEL = ''V'' ');
    IBNumSeries.SQL.Add('Order By NUMSERIE');
    if not IBNumSeries.Prepared then IBNumSeries.Prepare;
    IBNumSeries.ParamByName('CD_PRODUTO').AsInteger := EditNomeProduto.Tag;
    IBNumSeries.Active := true;
  end;
  DBGrid.Visible := IBNumSeries.Active;
end;

procedure TfNumerosDeSerie.DBGridDblClick(Sender: TObject);
begin
  if Vazio(IBNumSeries.FieldByName('NUMSERIE').AsString) then Exit;
  AbreAviso('Buscando Registros');
  screen.Cursor := crHourGlass;
  Application.CreateForm(TfSitNumSerie, fSitNumSerie);
  fSitNumSerie.NumSerie  := IBNumSeries.FieldByName('NUMSERIE').AsString;
  fSitNumSerie.CDProduto := EditNomeProduto.Tag;
  fSitNumSerie.ShowModal;
  FreeAndNil(fSitNumSerie);
end;

procedure TfNumerosDeSerie.btConsultarClick(Sender: TObject);
var
  CODProduto : Integer;
  NumSerie : String;
begin


  try
    NumSerie := '';
    CODProduto := 0;

    try
      Application.CreateForm(TfNumSerie, fNumSerie);
      fNumSerie.ShowModal;
      if fNumSerie.BotaoPressionado <> bpOk then Exit;
      NumSerie := fNumSerie.Edit1.Text;
    finally
      FreeAndNil(fNumSerie);
    end;

    if Vazio(NumSerie) then Exit;

    with DtM do
    begin
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('select P.CD_PRODUTO                                        ');
      IBTabela.SQL.Add('from NUMSERIE NS                                           ');
      IBTabela.SQL.Add('left outer join PRODUTOS P on P.CD_PRODUTO = NS.CD_PRODUTO ');
      IBTabela.SQL.Add('where NS.NUMSERIE = :NUMSERIE                              ');
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.ParamByName('NUMSERIE').AsString  := NumSerie;
      IBTabela.Active := true;

      if IBTabela.RecordCount = 0 then
      begin
        MensagemDeInformacao('N�mero de S�rie n�o Encontrado');
        Exit;
      end;

      if IBTabela.RecordCount = 1 then
      begin
        CODProduto := IBTabela.FieldByName('CD_PRODUTO').AsInteger;
      end;

      if IBTabela.RecordCount > 1 then
      begin
        try
          Application.CreateForm(TfSelecProdNumSerie, fSelecProdNumSerie);
          fSelecProdNumSerie.NumSerie := NumSerie;
          IBTabela.First;
          fSelecProdNumSerie.FiltroCodProdutos := IBTabela.FieldByName('CD_PRODUTO').AsString;
          IBTabela.Next;
          while not IBTabela.eof do
          begin
            fSelecProdNumSerie.FiltroCodProdutos := fSelecProdNumSerie.FiltroCodProdutos + ', '+IBTabela.FieldByName('CD_PRODUTO').AsString;
            IBTabela.Next;
          end;
          fSelecProdNumSerie.ShowModal;
          if fSelecProdNumSerie.BotaoPressionado = bpOk then
            CODProduto := fSelecProdNumSerie.CD_PRODUTO;
        finally
          FreeAndNil(fSelecProdNumSerie);
        end;
      end;

      if CODProduto = 0 then Exit;
    end;

    try
//      CM.AbreAviso('Buscando Registros');
      screen.Cursor := crHourGlass;
      Application.CreateForm(TfSitNumSerie, fSitNumSerie);
      fSitNumSerie.NumSerie  := NumSerie;
      fSitNumSerie.CDProduto := CODProduto;
      fSitNumSerie.ShowModal;
    finally
      FreeAndNil(fSitNumSerie);
    end;
  finally
  end;
end;

procedure TfNumerosDeSerie.DBGridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if IBNumSeries.FieldByName('DISPONIVEL').AsString = 'V' then
  begin
    AFont.Color := clBlue;
    AFont.Style := [fsBold];
  end
  else begin
    AFont.Color := clGray;
    AFont.Style := [];
  end;

  if Highlight then AFont.Color := clWhite;
end;

procedure TfNumerosDeSerie.EditNomeProdutoChange(Sender: TObject);
begin
  BuscaNumerosDeSerie;
  if vazio(EditNomeProduto.Text) then DesligaComponente(self, btIncluir)
                                 else LigaComponente(self, btIncluir);
end;

procedure TfNumerosDeSerie.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_F2 : btIncluir.Click;
    vk_F4 : btExcluir.Click;
  end;
end;

procedure TfNumerosDeSerie.btIncluirClick(Sender: TObject);
var
  CDNOTA,
  CodigoDoProduto : Integer;
begin
  if Vazio(EditNomeProduto.Text) then Exit;
  CodigoDoProduto := EditNomeProduto.Tag;
  CDNOTA := 0;

  if (CodigoDoProduto <= 0) then Exit;
  Application.CreateForm(TfEntradaNumSerie, fEntradaNumSerie);
  fEntradaNumSerie.Cd_Produto := CodigoDoProduto;
  fEntradaNumSerie.Cd_Nota    := CDNOTA;
  fEntradaNumSerie.lbCodProduto.Caption  := EditCodProduto.Text;
  fEntradaNumSerie.lbNomeProduto.Caption := EditNomeProduto.Text;
  fEntradaNumSerie.QuantidadeEsperada    := 0;
  fEntradaNumSerie.ShowModal;
  if fEntradaNumSerie.Alterou then
  begin
    with DtM do
    begin
      IBTabela2.Active := false;
      IBTabela2.SQL.Clear;
      IBTabela2.SQL.Add('select * from ENTRADA_NUMSERIE where CD_NOTA = :CD_NOTA and CD_PRODUTO = :CD_PRODUTO ');
      if not IBTabela2.Prepared then IBTabela2.Prepare;
      IBTabela2.ParamByName('CD_NOTA').AsInteger := CDNota;
      IBTabela2.ParamByName('CD_PRODUTO').AsInteger := CodigoDoProduto;
      IBTabela2.Active := true;
      while not IBTabela2.eof do
      begin
        try
          if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
          IBTabela.Active := false;
          IBTabela.SQL.Clear;
          IBTabela.SQL.Add('insert into NUMSERIE');
          IBTabela.SQL.Add('( CD_PRODUTO,  NUMSERIE,  CD_NOTAENTRADA,  NUM_DOC_VENDA,  DISPONIVEL)');
          IBTabela.SQL.Add('values');
          IBTabela.SQL.Add('(:CD_PRODUTO, :NUMSERIE, :CD_NOTAENTRADA, :NUM_DOC_VENDA, :DISPONIVEL)');
          if not IBTabela.Prepared then IBTabela.Prepare;
          IBTabela.ParamByName('CD_PRODUTO').AsInteger     := CodigoDoProduto;
          IBTabela.ParamByName('NUMSERIE').AsString        := IBTabela2.FieldByName('NUMSERIE').AsString;
          IBTabela.ParamByName('CD_NOTAENTRADA').AsInteger := CDNota;
          IBTabela.ParamByName('NUM_DOC_VENDA').AsInteger  := 0;
          IBTabela.ParamByName('DISPONIVEL').AsString      := 'V';
          IBTabela.ExecSQL;
          IBTabela.IB_Transaction.Commit;
        except
          IBTabela.IB_Transaction.Rollback;
        end;

        IBTabela2.Next;
      end;

      try
        if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
        IBTabela.Active := false;
        IBTabela.SQL.Clear;
        IBTabela.SQL.Add('delete from ENTRADA_NUMSERIE where CD_NOTA = 0');
        IBTabela.ExecSQL;
        IBTabela.IB_Transaction.Commit;
      except
        IBTabela.IB_Transaction.Rollback;
      end;
    end;
  end;
  FreeAndNil(fEntradaNumSerie);
  IBNumSeries.Refresh;
end;

procedure TfNumerosDeSerie.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CM.SalvaValorDoComponente(self, chMostrarDisponiveis, chMostrarDisponiveis.Checked);
end;

procedure TfNumerosDeSerie.FormCreate(Sender: TObject);
begin
  chMostrarDisponiveis.Checked := CM.BuscaValorDoComponente(self, chMostrarDisponiveis, false);
end;

procedure TfNumerosDeSerie.chMostrarDisponiveisClick(Sender: TObject);
begin
  BuscaNumerosDeSerie;
end;

procedure TfNumerosDeSerie.FormShow(Sender: TObject);
begin
  EditNomeProdutoChange(self);
end;

procedure TfNumerosDeSerie.btExcluirClick(Sender: TObject);
begin
  if not IBNumSeries.IsEmpty then
  begin
    if MensagemDeConfirmacao('Deseja realmente apagar este N�mero de S�rie?') = mrYes then
    begin
      try
        if not DtM.IBTabela.IB_Transaction.InTransaction then DtM.IBTabela.IB_Transaction.StartTransaction;
        DtM.IBTabela.Active := false;
        DtM.IBTabela.SQL.Clear;
        DtM.IBTabela.SQL.Add('Delete from NUMSERIE           ');
        DtM.IBTabela.SQL.Add('where CD_PRODUTO = :CD_PRODUTO ');
        DtM.IBTabela.SQL.Add('and NUMSERIE = :NUMSERIE       ');
        if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
        DtM.IBTabela.ParamByName('CD_PRODUTO').AsInteger := IBNumSeries.FieldByName('CD_PRODUTO').AsInteger;
        DtM.IBTabela.ParamByName('NUMSERIE').AsString    := IBNumSeries.FieldByName('NUMSERIE').AsString;
        if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
        DtM.IBTabela.ExecSQL;
        DtM.IBTabela.IB_Transaction.Commit;
        IBNumSeries.Refresh;
      except
        DtM.IBTabela.IB_Transaction.Rollback;
        MensagemDeErro('N�o foi poss�vel excluir este N�mero de S�rie');
      end;
    end;
  end;
end;

end.
