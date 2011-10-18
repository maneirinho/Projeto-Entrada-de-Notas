unit ULotesProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls;

type
  TFLotesItems = class(TForm)
    PanelLotesItems: TPanel;
    lbNMProduto: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    lbQtdProduto: TLabel;
    Panel1: TPanel;
    GroupBox4: TGroupBox;
    Panel3: TPanel;
    Bt_IncluirItem: TBitBtn;
    Bt_ExcluirItem: TBitBtn;
    Bt_Ok: TBitBtn;
    DataSource1: TDataSource;
    wwDBGrid1: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_ExcluirItemClick(Sender: TObject);
  private
    procedure PegaDadosLotes(CodNota, CodItem: integer);
    { Private declarations }
  public
    Qtd_Lotes, ValorMax: Currency;
    CD_NOTA, CD_ITEM: Integer;
    { Public declarations }
  end;

var
  FLotesItems: TFLotesItems;

implementation

uses UDataMod, UDadosProduto, UComum, DUtilit, IB_Access, IB_Components, DBFunctions,
     MessageFunctions;

{$R *.dfm}

procedure TFLotesItems.Bt_ExcluirItemClick(Sender: TObject);
var
  CodItem, NumLote : String;
  Book : TBookMark;
  IBQ: TIB_Query;
  IBT: TIB_Transaction;
begin
  if not DtM.IBNFLotesItems.IsEmpty then
  begin
    if MensagemDeConfirmacao('Deseja realmente apagar este Lote do Item?') = mrYes then
    begin
      DtM.IBNFLotesItems.DisableControls;
      CodItem := DtM.IBNFLotesItems.FieldByName('CD_ITEM').AsString;
      NumLote := DtM.IBNFLotesItems.FieldByName('NLOTE').AsString;
      DtM.IBNFLotesItems.Next;
      Book := DtM.IBNFLotesItems.GetBookmark;
      DtM.IBNFLotesItems.Active := false;

      try
        fDB.CreateQueryTransacao(DtM.IBDatabaseServer,IBQ,IBT);
        with IBQ do
        begin
          if not IB_Transaction.InTransaction then IB_Transaction.StartTransaction;
          Active := False;
          SQL.Clear;
          SQL.Add('DELETE FROM ENTRADA_ITEM_MEDICAMENTO ENTRADA_ITEM_MEDICAMENTO');
          SQL.Add('WHERE');
          SQL.Add('       CD_NOTA = :'+ DtM.IBNF.FieldByName('CD_NOTA').AsString);
          SQL.Add('   AND CD_ITEM = :'+ CodItem);
          SQL.Add('   AND NLOTE   = :'+ NumLote);
          if not Prepared then Prepare;
          ExecSQL;
          IB_Transaction.Commit;
        end;
      finally
        fDB.FechaTT(IBQ);
        fDB.FreeQueryTransacao(IBQ,IBT);
      end;
      DtM.IBNFLotesItems.Active := True;
      try
        DtM.IBNFLotesItems.GotoBookmark(Book);
      except
        on E: exception do begin
          LogDeErros(E.Message);
        end;
      end;
      DtM.IBNFLotesItems.EnableControls;
//      DtM.IBNFLotesItems.RefreshRows;
    end;
  end;
end;

procedure TFLotesItems.Bt_OkClick(Sender: TObject);
begin
  PegaDadosLotes(CD_NOTA,CD_ITEM);
  if (Qtd_Lotes <> StrToCurrZ(lbQtdProduto.Caption)) and (DtM.IBNFLotesItems.RecordCount > 0) then
    if (MessageBox(0, 'A quantidade descrita na entrada de lotes difere da quantidade de entrada! '+#13+#10+'Deseja prosseguir mesmo assim?', 'ATENÇÃO', MB_ICONEXCLAMATION or MB_YESNO) = IDNO) then
      Exit;
  close;
end;

procedure TFLotesItems.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  wwDBGrid1.SaveToIniFile;
end;

procedure TFLotesItems.FormCreate(Sender: TObject);
begin
  lbNMProduto.Caption   := fDadosDoProduto.lbNMProduto.Caption;
  lbQtdProduto.Caption  := PoeZeros(CurrToStr(fDadosDoProduto.edQuantidade.Value),5);
  DataSource1.DataSet   := DtM.IBNFLotesItems;
  CM.InicializaGrid(TeclaTaPressionada(vk_Shift), self, wwDBGrid1);
  CD_NOTA     := DtM.IBNF.FieldByName('CD_NOTA').AsInteger;
  CD_ITEM     := DtM.IBNFItems.FieldByName('CD_ITEM').AsInteger;
end;

procedure TFLotesItems.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_F2    : if (Shift = []) and (Bt_IncluirItem.Enabled)    then Bt_IncluirItem.Click;
    vk_F4    : if (Shift = []) and (Bt_ExcluirItem.Enabled)    then Bt_ExcluirItem.Click;
    vk_F10   : if (Shift = []) and (Bt_Ok.Enabled)             then Bt_Ok.Click;
  end;
end;

procedure TFLotesItems.FormShow(Sender: TObject);
begin
  with DtM.IBNFLotesItems do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT *');
    SQL.Add('from ENTRADA_ITEM_MEDICAMENTO');
    SQL.Add('WHERE CD_NOTA = :CD_NOTA');
    SQL.Add('  AND CD_ITEM = :CD_ITEM');
    if not Prepared then Prepare;
    ParamByName('CD_NOTA').AsInteger    := CD_NOTA;
    ParamByName('CD_ITEM').AsInteger    := CD_ITEM;
    Active := True;
  end;
end;

procedure TFLotesItems.PegaDadosLotes(CodNota,CodItem: integer);
var
  IBQ: TIB_Query;
  IBT: TIB_Transaction;
begin
  try
    AbreAviso('Aguarde, conferindo');
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer,IBQ,IBT);
    with IBQ do
    begin
      Active := false;
      SQL.Clear;
      SQL.Add('SELECT MAX(VPMC), SUM(QLOTE)');
      SQL.Add('from ENTRADA_ITEM_MEDICAMENTO');
      SQL.Add('WHERE CD_NOTA = :CD_NOTA');
      SQL.Add('  AND CD_ITEM = :CD_ITEM');
      if not Prepared then Prepare;
      ParamByName('CD_NOTA').AsInteger    := CodNota;
      ParamByName('CD_ITEM').AsInteger    := CodItem;
      Active := True;
      Qtd_Lotes := FieldByName('SUM').AsCurrency;
      ValorMax  := FieldByName('MAX').AsCurrency;
    end;
  finally
    FechaAviso;
    fDB.FechaTT(IBQ);
    fDB.FreeQueryTransacao(IBQ,IBT);
  end;
end;

end.
