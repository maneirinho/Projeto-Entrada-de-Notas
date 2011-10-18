//ok
unit UProdutosDoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, MessageFunctions;

type
  TfProdutosDoFornecedor = class(TForm)
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Bt_Sair: TBitBtn;
    DataSource1: TDataSource;
    procedure Bt_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    CodFornecedor : Integer;
    CodRepresentante : Integer;
  end;

var
  fProdutosDoFornecedor: TfProdutosDoFornecedor;

implementation

uses UDataMod, UComum, DBFunctions;

{$R *.dfm}

procedure TfProdutosDoFornecedor.Bt_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TfProdutosDoFornecedor.FormCreate(Sender: TObject);
begin
  CodFornecedor := -1;
  CodRepresentante := -1;

  DataSource1.DataSet := DtM.IBTabelaExibicao;
end;

procedure TfProdutosDoFornecedor.FormShow(Sender: TObject);
begin
  with DtM.IBTabelaExibicao do
  begin
    Active := false;
    SQL.Clear;
    if CodFornecedor > 0 then
    begin
      SQL.Add('Select P.COD_BARRAS "C�digo",');
      SQL.Add('       P.NM_PRODUTO "Produto"');
      SQL.Add('from PRODFORNEC PF');
      SQL.Add('join PRODUTOS P on (P.CD_PRODUTO = PF.CD_PRODUTO)');
      SQL.Add('where PF.CD_FORNECEDOR = :CD_FORNECEDOR');
      SQL.Add('order by 2');
      if not Prepared then Prepare;
      ParamByName('CD_FORNECEDOR').AsInteger := CodFornecedor;
    end;
    if CodRepresentante > 0 then
    begin
      SQL.Add('Select P.COD_BARRAS "C�digo",');
      SQL.Add('       P.NM_PRODUTO "Produto"');
      SQL.Add('from PRODFORNEC PF');
      SQL.Add('join REPRESENT_FORNEC RF on (RF.CD_FORNECEDOR = PF.CD_FORNECEDOR)');
      SQL.Add('join PRODUTOS P on (P.CD_PRODUTO = PF.CD_PRODUTO)');
      SQL.Add('where RF.CD_REPRESENTANTE = :CD_REPRESENTANTE');
      SQL.Add('order by 2');
      if not Prepared then Prepare;
      ParamByName('CD_REPRESENTANTE').AsInteger := CodRepresentante;
    end;

    if not Prepared then Prepare;
    Active := true;
  end;

  FechaAviso;
  Screen.Cursor := crDefault;
end;

procedure TfProdutosDoFornecedor.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  fDB.FechaTT(DtM.IBTabelaExibicao);
end;

end.
