unit UCadSimilares;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroPadrao, DB, IBODataset, IB_Components, 
  Gradpan, Mask, DBCtrls, StdCtrls, JvExStdCtrls, JvEdit, JvExControls,
  JvSpeedButton, Grids, DBGrids, Buttons, ExtCtrls, JvLabel, MessageFunctions;

type
  TfCadSimilares = class(TfCadastroPadrao)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    chInativo: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_IncluirClick(Sender: TObject);
    procedure Bt_GravarClick(Sender: TObject);
  private
    function TemErroNaGravacao: boolean; override;
    procedure IniciaValores; override;
  public
    { Public declarations }
  end;

var
  fCadSimilares: TfCadSimilares;

implementation

uses UConstVar, UComum, UDataMod, DUtilit, DBFunctions;

{$R *.dfm}

procedure TfCadSimilares.FormCreate(Sender: TObject);
begin
  EstaChave    := '\CadSimilares';
  NomeDaTabela := 'SIMILARES';
  EstaTabela   := IBCadastro;
  Select       := 'Select * from SIMILARES ';
  Campo.CodigoInt := 'CD_SIMILAR';
  Campo.CodigoStr := 'CD_SIMILAR';
  Campo.Descricao := 'NM_SIMILAR';
  Filtro          := NomeDaTabela+'.'+Campo.CodigoInt+' > 0';
  CadObjeto       := 'Similar';
  EsteCadastro    := cadSimilares; 

  LimpaCamposOrdenados;
  IncluiCampoOrdenado('CD_SIMILAR', 'C�digo');
  IncluiCampoOrdenado('NM_SIMILAR', 'Descri��o');

  inherited;
end;

function TfCadSimilares.TemErroNaGravacao: boolean;
var
  JaTem : boolean;
begin
  result := false;
  if (not result) and (Vazio(DBEdit2.Text)) then
  begin
    MensagemDeAtencao('� necess�rio que o campo DESCRI��O esteja preenchido');
    result := true;
    DBEdit2.SetFocus;
  end;

  if (not result) then
  begin
    with CM do
    begin
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Select NM_SIMILAR from SIMILARES');
      IBTabela.SQL.Add('where NM_SIMILAR = '+QuotedStr(DBEdit2.Text));
      if Modo = mdAlteracao then
        IBTabela.SQL.Add('and CD_SIMILAR <> '+EstaTabela.FieldByName('CD_SIMILAR').AsString);

      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.Active := true;
      JaTem := IBTabela.RecordCount > 0;
      fDB.FechaTT(IBTabela);
    end;
    if JaTem then
    begin
      MensagemDeErro('A descri��o para este Similar j� foi cadastrado');
      result := true;
      DBEdit2.SetFocus;
    end;
  end;
  DeuErro := result;
  Inherited TemErroNaGravacao;
end;

procedure TfCadSimilares.FormShow(Sender: TObject);
begin
  DBEdit2.SetFocus;
  inherited;
end;

procedure TfCadSimilares.Bt_IncluirClick(Sender: TObject);
begin
  inherited;
  try
    DBEdit2.SetFocus;
  except
  end;
end;

procedure TfCadSimilares.IniciaValores;
begin
  if EstaTabela.FieldByName('INATIVO').Value = null then EstaTabela.FieldByName('INATIVO').AsString := 'F';
end;

procedure TfCadSimilares.Bt_GravarClick(Sender: TObject);
var
  Codigo : Integer;
begin
  if Modo = mdInclusao then
  begin
    Codigo := fDB.GetValorDoGenerator(DtM.IBDatabaseServer, 'GEN_CD_SIMILAR');
    IBCadastro.FieldByName('CD_SIMILAR').AsInteger := Codigo;
  end;

  inherited;
end;

end.
