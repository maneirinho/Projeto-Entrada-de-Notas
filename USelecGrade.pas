//ok
unit USelecGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  UConstVar, UComum, IB_Components, IBODataset, DB, MessageFunctions;

type
  TfSelecionaGrade = class(TForm)
    DataSource2: TDataSource;
    IBGrades: TIBOQuery;
    IBGradesCOD_BARRAS: TStringField;
    IBGradesNM_GRADE: TStringField;
    IBGradesCD_PRODUTO: TIntegerField;
    IBGradesCD_GRADE: TIntegerField;
    TRGrades: TIBOTransaction;
    wwDBGridGrades: TwwDBGrid;
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancelar: TBitBtn;
    IBGradesESTOQUEATUAL: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure wwDBGridGradesDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    BotaoPressionado : TBotaoPressionado;
    CD_PRODUTO : Integer; 
    CD_GRADE   : Integer; 
    NM_GRADE   : String;
    COD_BARRAS : String;
  end;

var
  fSelecionaGrade: TfSelecionaGrade;

implementation

uses UDataMod, DBFunctions;

{$R *.dfm}

procedure TfSelecionaGrade.FormCreate(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
  IBGrades.IB_Connection := DtM.IBDatabaseServer;
end;

procedure TfSelecionaGrade.btCancelarClick(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
  Close;
end;

procedure TfSelecionaGrade.btOkClick(Sender: TObject);
begin
  BotaoPressionado := bpOk;
  CD_GRADE   := IBGrades.FieldByName('CD_GRADE').AsInteger;
  COD_BARRAS := IBGrades.FieldByName('COD_BARRAS').AsString;
  NM_GRADE   := IBGrades.FieldByName('NM_GRADE').AsString;
  Close;
end;

procedure TfSelecionaGrade.FormShow(Sender: TObject);
begin
  IBGrades.Active := false;
  IBGrades.SQL.Clear;
  IBGrades.SQL.Add('select G.CD_GRADE, G.CD_PRODUTO, G.COD_BARRAS, G.NM_GRADE, coalesce(E.ESTOQUEATUAL, 0) as ESTOQUEATUAL ');
  IBGrades.SQL.Add('from GRADES G                                                           ');
  IBGrades.SQL.Add('left outer join SP_PEGAESTOQUE(:CD_PRODUTO, G.CD_GRADE) E on (1=1)   ');
  IBGrades.SQL.Add('where G.CD_PRODUTO = :CD_PRODUTO                                        ');
  IBGrades.SQL.Add('order by NM_GRADE                                                       ');

  Width := 527;
  btOk.Left := 344;
  btCancelar.Left := 432;

  if not IBGrades.Prepared then IBGrades.Prepare;
  IBGrades.ParamByName('CD_PRODUTO').AsInteger := CD_PRODUTO;
  IBGrades.Active := true;
  IBGrades.Fields[0].DisplayLabel := ConfigCadastro.GradeCampoCodigo;
  IBGrades.Fields[1].DisplayLabel := ConfigCadastro.GradeCampoDescricao;

  FechaAviso;
  Screen.Cursor := crDefault;
end;

procedure TfSelecionaGrade.wwDBGridGradesDblClick(Sender: TObject);
begin
  btOk.Click;
end;

procedure TfSelecionaGrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fDB.FechaTT(IBGrades);
end;

end.
