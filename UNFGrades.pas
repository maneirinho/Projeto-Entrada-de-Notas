//ok
unit UNFGrades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, UDataMod, DB, IB_Components, Buttons,
  DUtilit, IBODataset, Grids, Wwdbigrd, Wwdbgrid, JvExMask, JvToolEdit,
  IB_Access, JvBaseEdits, UConstVar, MessageFunctions;

type
  TfEntradaGrades = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    IBGrade: TIBOQuery;
    DataSource1: TDataSource;
    IBOTransaction1: TIBOTransaction;
    lbNomeProduto: TLabel;
    lbCodProduto: TLabel;
    Panel4: TPanel;
    btOk: TBitBtn;
    Edit1: TJvCalcEdit;
    IBGradeCOD_BARRAS: TStringField;
    IBGradeNM_GRADE: TStringField;
    IBGradeCD_GRADE: TIntegerField;
    Panel3: TPanel;
    Label2: TLabel;
    lbTotal: TLabel;
    Bt_NovaGrade: TBitBtn;
    IBGradeQUANTIDADE: TBCDField;
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
    procedure Bt_NovaGradeClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    Alterou : Boolean;
    procedure EditaQuantidade(Valor:String);
    function CalculaTotal: Currency;
  public
    SomenteLeitura : boolean;
    CodGrupo   : Integer;
    CodProduto : Integer;
    CdNota     : Integer;
  end;

var
  fEntradaGrades: TfEntradaGrades;

implementation

uses UComum, DBFunctions, UEditaGrade;

{$R *.dfm}

procedure TfEntradaGrades.FormShow(Sender: TObject);
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    EstaTabela := TIB_Query.Create(self);
    EstaTransacao := TIB_Transaction.Create(self);
    EstaTabela.IB_Connection := CM.IBTabela.IB_Connection;
    EstaTransacao.IB_Connection := CM.IBTabela.IB_Connection;
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
    IBGrade.Fields[0].DisplayLabel := ConfigCadastro.GradeCampoCodigo;
    IBGrade.Fields[1].DisplayLabel := ConfigCadastro.GradeCampoDescricao;
  finally
    fDB.FechaTT(EstaTabela);
    EstaTabela.Free;
    EstaTransacao.Free;
  end;

  IBGrade.Active := false;
  IBGrade.SQL.Clear;

  IBGrade.SQL.Add('select G.CD_GRADE, G.COD_BARRAS, G.NM_GRADE, coalesce(NG.QUANTIDADE, 0) as QUANTIDADE     ');
  IBGrade.SQL.Add('from GRADES G                                                                             ');
  IBGrade.SQL.Add('left outer join ENTRADA_GRADE NG on ((NG.CD_GRADE = G.CD_GRADE) and (NG.CD_NOTA = :CD_NOTA))  ');
  IBGrade.SQL.Add('where G.CD_PRODUTO = :CD_PRODUTO                                                          ');
  IBGrade.SQL.Add('order by G.NM_GRADE                                                                       ');
  if not IBGrade.Prepared then IBGrade.Prepare;
  IBGrade.ParamByName('CD_PRODUTO').AsInteger := CodProduto;
  IBGrade.ParamByName('CD_NOTA').AsInteger    := CdNota;
  IBGrade.Active := true;
  CalculaTotal;
  btOk.SetFocus;
  wwDBGrid1.SetFocus;

  FechaAviso;
  Screen.Cursor := crDefault;
end;

function TfEntradaGrades.CalculaTotal:Currency;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    EstaTabela := TIB_Query.Create(self);
    EstaTransacao := TIB_Transaction.Create(self);
    EstaTabela.IB_Connection := CM.IBTabela.IB_Connection;
    EstaTransacao.IB_Connection := CM.IBTabela.IB_Connection;
    EstaTabela.IB_Transaction := EstaTransacao;

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('select sum(coalesce(G.QUANTIDADE, 0)) as TOTAL     ');
    EstaTabela.SQL.Add('from ENTRADA_GRADE G                                   ');
    EstaTabela.SQL.Add('  where G.CD_PRODUTO = :CD_PRODUTO                 ');
    EstaTabela.SQL.Add('  and  G.CD_NOTA = :CD_NOTA                        ');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.ParamByName('CD_PRODUTO').AsInteger := CodProduto;
    EstaTabela.ParamByName('CD_NOTA').AsInteger    := CdNota;
    EstaTabela.Active := true;
    result := EstaTabela.FieldByName('TOTAL').AsCurrency;
    lbTotal.Caption := FormatCurr(',00', result);
  finally
    fDB.FechaTT(EstaTabela);
    EstaTabela.Free;
    EstaTransacao.Free;
  end;
end;

procedure TfEntradaGrades.btOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfEntradaGrades.wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if IBGrade.FieldByName('QUANTIDADE').AsCurrency > 0 then
  begin
    AFont.Name  := 'Arial'; 
    AFont.Style := [fsBold];
    AFont.Size  := 12;
  end
  else begin
    AFont.Name  := 'MS Sans Serif'; 
    AFont.Style := [];
    AFont.Size  := 8;
  end;
end;

procedure TfEntradaGrades.FormCreate(Sender: TObject);
begin
  SomenteLeitura := false;
  Alterou := false;
  CodProduto := 0;
  CdNota := 0;
  IBGrade.IB_Connection := CM.IBTabela.IB_Connection;
end;

procedure TfEntradaGrades.wwDBGrid1KeyPress(Sender: TObject;  var Key: Char);
begin
  case key of
    #13: EditaQuantidade('');
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' : EditaQuantidade(key);
    '.', ',' : EditaQuantidade('.');
  end;
end;

procedure TfEntradaGrades.wwDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if (gdSelected in State) and (Field.FieldName = 'QUANTIDADE') then
  begin
    Edit1.Left   := Rect.Left + 2;
    Edit1.Top    := Rect.Top + 2;
    Edit1.Width  := Rect.Right - Rect.Left + 2;
    Edit1.Height := Rect.Bottom - Rect.Top + 2;
  end;
end;

procedure TfEntradaGrades.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Alterou then
    begin
      with CM do
      begin
        try
          if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
          IBTabela.Active := false;
          IBTabela.SQL.Clear;
          IBTabela.SQL.Add('update or insert into ENTRADA_GRADE');
          IBTabela.SQL.Add('( CD_NOTA,  CD_GRADE,  CD_PRODUTO,  QUANTIDADE)');
          IBTabela.SQL.Add('values');
          IBTabela.SQL.Add('(:CD_NOTA, :CD_GRADE, :CD_PRODUTO, :QUANTIDADE)');
          if not IBTabela.Prepared then IBTabela.Prepare;
          IBTabela.ParamByName('CD_NOTA').AsInteger     := CdNota;
          IBTabela.ParamByName('CD_GRADE').AsInteger    := IBGrade.FieldByName('CD_GRADE').AsInteger;
          IBTabela.ParamByName('CD_PRODUTO').AsInteger  := CodProduto;
          IBTabela.ParamByName('QUANTIDADE').AsCurrency := Edit1.Value;
          IBTabela.ExecSQL;
          IBTabela.IB_Transaction.Commit;
        except
          IBTabela.IB_Transaction.Rollback;
          MensagemDeErro('Não foi possível definir a quantidade!');
        end;
      end;
      Alterou := false;
      CalculaTotal;
    end;
    Edit1.Visible := false;
    IBGrade.Refresh;
    wwDBGrid1.SetFocus;
  end;
end;

procedure TfEntradaGrades.EditaQuantidade(Valor:String);
begin
  if Vazio(Valor) then Edit1.Value := IBGrade.FieldByname('QUANTIDADE').AsCurrency
                  else Edit1.Text  := Valor;

  Edit1.Visible := true;
  Edit1.SetFocus;
end;

procedure TfEntradaGrades.Edit1Change(Sender: TObject);
begin
  Alterou := true;
end;

procedure TfEntradaGrades.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_F2 : if Bt_NovaGrade.Enabled then Bt_NovaGrade.Click;
    vk_F10: if btOk.Enabled         then btOk.Click;
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

procedure TfEntradaGrades.wwDBGrid1DblClick(Sender: TObject);
begin
  if SomenteLeitura then Exit;
  EditaQuantidade('');
end;

procedure TfEntradaGrades.Bt_NovaGradeClick(Sender: TObject);
var
  codGrade : integer;
begin
  if SomenteLeitura then Exit;
  Application.CreateForm(TfEditaGrade, fEditaGrade);
  fEditaGrade.Modo := mdInclusao;
  fEditaGrade.Origem := orCadastro;
  fEditaGrade.CD_PRODUTO := CodProduto;
  fEditaGrade.CD_GRUPO   := CodGrupo;
  fEditaGrade.lbEstoque.Caption := 'Quantidade';
  fEditaGrade.ShowModal;

  if fEditaGrade.BotaoPressionado = bpOk then
  begin
    with CM do
    begin
      if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
      try
        IBTabela.Active := false;
        IBTabela.SQL.Clear;
        IBTabela.SQL.Add('Insert into GRADES ');
        IBTabela.SQL.Add('( CD_PRODUTO,  NM_GRADE,  COD_BARRAS)');
        IBTabela.SQL.Add(' values ');
        IBTabela.SQL.Add('(:CD_PRODUTO, :NM_GRADE, :COD_BARRAS)');
        IBTabela.SQL.Add('returning CD_GRADE');
        if not IBTabela.Prepared then IBTabela.Prepare;
        IBTabela.ParamByName('CD_PRODUTO').AsInteger  := CodProduto;
        IBTabela.ParamByName('NM_GRADE').AsString     := fEditaGrade.edDescricao.Text;
        IBTabela.ParamByName('COD_BARRAS').AsString   := fEditaGrade.edCodigo.Text;
        IBTabela.ExecSQL;
        codGrade := IBTabela.FieldByName('CD_GRADE').AsInteger;
        IBTabela.IB_Transaction.Commit;

        IBTabela.Active := false;
        IBTabela.SQL.Clear;
        IBTabela.SQL.Add('update or insert into ENTRADA_GRADE ');
        IBTabela.SQL.Add('( CD_NOTA,  CD_GRADE,  CD_PRODUTO,  QUANTIDADE)');
        IBTabela.SQL.Add(' values ');
        IBTabela.SQL.Add('(:CD_NOTA, :CD_GRADE, :CD_PRODUTO, :QUANTIDADE)');
        if not IBTabela.Prepared then IBTabela.Prepare;
        IBTabela.ParamByName('CD_NOTA').AsInteger     := CdNota;
        IBTabela.ParamByName('CD_GRADE').AsInteger    := CodGrade;
        IBTabela.ParamByName('CD_PRODUTO').AsInteger  := CodProduto;
        IBTabela.ParamByName('QUANTIDADE').AsCurrency := fEditaGrade.edEstoque.Value;
        IBTabela.ExecSQL;
        IBTabela.IB_Transaction.Commit;
      except
        IBTabela.IB_Transaction.Rollback;
        MensagemDeErro('Não foi possível incluir esta grade');
      end;
    end;
  end;
  fEditaGrade.Free;
  try
    IBGrade.Refresh;
    IBGrade.Locate('CD_GRADE', codGrade, []);
  except
  end;
end;

procedure TfEntradaGrades.Edit1Exit(Sender: TObject);
begin
  Edit1.Visible := false;
end;

end.
