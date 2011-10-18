//todo umodusuarios
unit UEstoquesGrades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, DB, IB_Components, Buttons,
  DUtilit, IBODataset, Grids, Wwdbigrd, Wwdbgrid, JvExMask, JvToolEdit,
  UConstVar, IB_Access, JvBaseEdits, MessageFunctions;

type
  TfEstoqueGrades = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    IBEstoque: TIBOQuery;
    DataSource1: TDataSource;
    IBOTransaction1: TIBOTransaction;
    lbNomeProduto: TLabel;
    lbCodProduto: TLabel;
    IBEstoqueESTOQUEATUAL: TBCDField;
    Panel4: TPanel;
    Label1: TLabel;
    lbEstoqueAtual: TLabel;
    btOk: TBitBtn;
    Edit1: TJvCalcEdit;
    lbDeposito: TLabel;
    IBEstoqueCOD_BARRAS: TStringField;
    IBEstoqueNM_GRADE: TStringField;
    IBEstoqueCD_GRADE: TIntegerField;
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormShow(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure wwDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure wwDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Alterou : Boolean;
    procedure EditaEstoque(Valor: String);
  public
    ModoConsulta : Boolean;
    CodProduto : Integer;
    CodDeposito: Integer;
  end;

var
  fEstoqueGrades: TfEstoqueGrades;

implementation

uses UComum, UEstoquesDepositos, UModUsuarios, DBFunctions, UDataMod;

{$R *.dfm}

procedure TfEstoqueGrades.FormShow(Sender: TObject);
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    EstaTabela := TIB_Query.Create(self);
    EstaTransacao := TIB_Transaction.Create(self);
    EstaTabela.IB_Connection := DtM.IBDatabaseServer;
    EstaTransacao.IB_Connection := DtM.IBDatabaseServer;
    EstaTabela.IB_Transaction := EstaTransacao;

    //Pega o nome do produto
    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('select P.COD_BARRAS, P.NM_PRODUTO');
    EstaTabela.SQL.Add('from PRODUTOS P');
    EstaTabela.SQL.Add('where P.CD_PRODUTO = :CD_PRODUTO');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.ParamByName('CD_PRODUTO').AsInteger := CodProduto;
    EstaTabela.Active := true;
    lbCodProduto.Caption  := EstaTabela.FieldByName('COD_BARRAS').AsString;
    lbNomeProduto.Caption := EstaTabela.FieldByName('NM_PRODUTO').AsString;

    //Pega o nome do Depósito
    if CodDeposito > 0 then
    begin
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('select D.NM_DEPOSITO');
      EstaTabela.SQL.Add('from DEPOSITOS D');
      EstaTabela.SQL.Add('where D.CD_DEPOSITO = :CD_DEPOSITO');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CD_DEPOSITO').AsInteger := CodDeposito;
      EstaTabela.Active := true;
      lbDeposito.Caption    := PoeZeros(CodDeposito, 2)+' - '+EstaTabela.FieldByName('NM_DEPOSITO').AsString;
      Panel1.Height := 80;
    end
    else begin
      lbDeposito.Visible := false;
      Panel1.Height := 55;
    end;
  finally
    fDB.FechaTT(EstaTabela);
    EstaTabela.Free;
    EstaTransacao.Free;
  end;

  IBEstoque.Active := false;
  IBEstoque.SQL.Clear;

  IBEstoque.SQL.Add('select G.CD_GRADE, G.COD_BARRAS, G.NM_GRADE, coalesce(E.ESTOQUEATUAL, 0) as ESTOQUEATUAL ');
  IBEstoque.SQL.Add('from GRADES G                                                                            ');
  IBEstoque.SQL.Add('left outer join SP_PEGAESTOQUE(:CD_PRODUTO, G.CD_GRADE, :CD_DEPOSITO) E on (1=1)         ');
  IBEstoque.SQL.Add('where G.CD_PRODUTO = :CD_PRODUTO                                                         ');
  IBEstoque.SQL.Add('order by NM_GRADE                                                                        ');
  if not IBEstoque.Prepared then IBEstoque.Prepare;
  IBEstoque.ParamByName('CD_PRODUTO').AsInteger := CodProduto;
  IBEstoque.ParamByName('CD_DEPOSITO').AsInteger := CodDeposito;
  IBEstoque.Active := true;
  lbEstoqueAtual.Caption := FormatCurr(',00', CM.PegaEstoque(CodProduto, 0, CodDeposito));
  btOk.SetFocus;
  wwDBGrid1.SetFocus;
  IBEstoque.Fields[0].DisplayLabel := ConfigCadastro.GradeCampoCodigo;
  IBEstoque.Fields[1].DisplayLabel := ConfigCadastro.GradeCampoDescricao;

  FechaAviso;
  Screen.Cursor := crDefault;
end;

procedure TfEstoqueGrades.btOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfEstoqueGrades.wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Field.FieldName = 'PRECO' then AFont.Style := [fsBold];
end;

procedure TfEstoqueGrades.FormCreate(Sender: TObject);
begin
  ModoConsulta := false;
  Alterou := false;
  CodProduto := 0;
  CodDeposito := 0;
  IBEstoque.IB_Connection := DtM.IBDatabaseServer;
end;

procedure TfEstoqueGrades.wwDBGrid1KeyPress(Sender: TObject;  var Key: Char);
begin
  case key of
    #13: EditaEstoque('');
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' : EditaEstoque(key);
    '.', ',' : EditaEstoque('.');
  end;
end;

procedure TfEstoqueGrades.wwDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if (gdSelected in State) and (Field.FieldName = 'ESTOQUEATUAL') then
  begin
    Edit1.Left   := Rect.Left + 2;
    Edit1.Top    := Rect.Top + 2;
    Edit1.Width  := Rect.Right - Rect.Left + 2;
    Edit1.Height := Rect.Bottom - Rect.Top + 2;
  end;
end;

procedure TfEstoqueGrades.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Alterou then
    begin
      CM.AlteraEstoque(CodProduto, IBEstoque.FieldByName('CD_GRADE').AsInteger, CodDeposito, Edit1.Value, 0, 'C', 'Correção no Cadastro de Produtos', RegUsuario.Login);
      Alterou := false;
      lbEstoqueAtual.Caption := FormatCurr(',00', CM.PegaEstoque(CodProduto, 0, CodDeposito));
    end;
    Edit1.Visible := false;
    IBEstoque.Refresh;
    wwDBGrid1.SetFocus;
  end;
end;

procedure TfEstoqueGrades.EditaEstoque(Valor:String);
begin
  if ModoConsulta then Exit;
  if (CodDeposito = 0) and (CM.TemDepositos) then
  begin
    if Vazio(Valor) then
    begin
      Application.CreateForm(TfEstoqueDepositos, fEstoqueDepositos);
      fEstoqueDepositos.CodProduto := CodProduto;
      fEstoqueDepositos.CodGrade   := IBEstoque.FieldByName('CD_GRADE').AsInteger;
      fEstoqueDepositos.ShowModal;
      FreeAndNil(fEstoqueDepositos);
      IBEstoque.Refresh;
    end;
  end
  else begin
    if Vazio(Valor) then Edit1.Value := IBEstoque.FieldByname('ESTOQUEATUAL').AsCurrency
                    else Edit1.Text  := Valor;
    Edit1.Visible := true;
    Edit1.SetFocus;
  end;
end;

procedure TfEstoqueGrades.Edit1Change(Sender: TObject);
begin
  Alterou := true;
end;

procedure TfEstoqueGrades.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_Escape : begin
                  if Edit1.Visible then
                  begin
                    Edit1.Visible := false;
                    Alterou := false;
                    wwDBGrid1.SetFocus;
                  end
                  else BtOk.Click;
                end;
  end;
end;

procedure TfEstoqueGrades.wwDBGrid1DblClick(Sender: TObject);
begin
  EditaEstoque('');
end;

procedure TfEstoqueGrades.Edit1Exit(Sender: TObject);
begin
  Edit1.Visible := false;
end;


procedure TfEstoqueGrades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fDB.FechaTT(IBEstoque);
end;

end.
