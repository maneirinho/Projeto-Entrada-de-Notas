//ok
unit UEntradaNumSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IB_Components, IBODataset, DB, Buttons,
  Grids, Wwdbigrd, Wwdbgrid, MessageFunctions;

type
  TfEntradaNumSerie = class(TForm)
    Panel1: TPanel;
    lbNomeProduto: TLabel;
    lbCodProduto: TLabel;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel4: TPanel;
    btFechar: TBitBtn;
    BtExcluir: TBitBtn;
    Panel3: TPanel;
    Label2: TLabel;
    lbQuantidade: TLabel;
    IBNumSerie: TIBOQuery;
    DataSource1: TDataSource;
    IBOTransaction1: TIBOTransaction;
    IBNumSerieCD_NOTA: TIntegerField;
    IBNumSerieCD_PRODUTO: TIntegerField;
    IBNumSerieNUMSERIE: TStringField;
    Panel5: TPanel;
    edNumSerie: TEdit;
    btIncluir: TSpeedButton;
    btImportar: TBitBtn;
    OpenDialog: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure edNumSerieKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btImportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Calcula;
    function InserirNS(NS: String): boolean;
  public
    CD_Produto : Integer;
    CD_Nota    : Integer;
    QuantidadeTotal    : Integer;
    QuantidadeEsperada : Integer;
    Alterou : boolean;
  end;

var
  fEntradaNumSerie: TfEntradaNumSerie;

implementation

uses UComum, UDataMod, DUtilit;

{$R *.dfm}

procedure TfEntradaNumSerie.FormShow(Sender: TObject);
begin
  FechaAviso;
  IBNumSerie.Active := false;
  IBNumSerie.SQL.Clear;
  IBNumSerie.SQL.Add('select * from ENTRADA_NUMSERIE      ');
  IBNumSerie.SQL.Add('where CD_PRODUTO = :CD_PRODUTO ');
  IBNumSerie.SQL.Add('and CD_NOTA = :CD_NOTA         ');
  if not IBNumSerie.Prepared then IBNumSerie.Prepare;
  IBNumSerie.ParamByName('CD_NOTA').AsInteger := CD_Nota;
  IBNumSerie.ParamByName('CD_PRODUTO').AsInteger := CD_Produto;
  IBNumSerie.Active := true;

  Calcula;
  Screen.Cursor := crDefault;
  edNumSerie.SetFocus;
end;

procedure TfEntradaNumSerie.BtExcluirClick(Sender: TObject);
begin
  if not IBNumSerie.IsEmpty then
  begin
    if MensagemDeConfirmacao('Deseja realmente apagar este Número de Série?') = mrYes then
    begin
      Alterou := true;
      try
        if not DtM.IBTabela.IB_Transaction.InTransaction then DtM.IBTabela.IB_Transaction.StartTransaction;
        DtM.IBTabela.Active := false;
        DtM.IBTabela.SQL.Clear;
        DtM.IBTabela.SQL.Add('Delete from ENTRADA_NUMSERIE      ');
        DtM.IBTabela.SQL.Add('where CD_NOTA = :CD_NOTA     ');
        DtM.IBTabela.SQL.Add('and CD_PRODUTO = :CD_PRODUTO ');
        DtM.IBTabela.SQL.Add('and NUMSERIE = :NUMSERIE     ');
        if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
        DtM.IBTabela.ParamByName('CD_NOTA').AsInteger    := IBNumSerie.FieldByName('CD_NOTA').AsInteger;
        DtM.IBTabela.ParamByName('CD_PRODUTO').AsInteger := IBNumSerie.FieldByName('CD_PRODUTO').AsInteger;
        DtM.IBTabela.ParamByName('NUMSERIE').AsString    := IBNumSerie.FieldByName('NUMSERIE').AsString;
        if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
        DtM.IBTabela.ExecSQL;
        DtM.IBTabela.IB_Transaction.Commit;
        IBNumSerie.Refresh;
        Calcula;
        edNumSerie.SetFocus;
      except
        DtM.IBTabela.IB_Transaction.Rollback;
        MensagemDeErro('Não foi possível excluir este Número de Série');
      end;
    end;
  end;
end;

function TfEntradaNumSerie.InserirNS(NS:String):boolean;
begin
  if Vazio(NS) then Exit;
  result := false;
  try
    if not DtM.IBTabela.IB_Transaction.InTransaction then DtM.IBTabela.IB_Transaction.StartTransaction;
    DtM.IBTabela.Active := false;
    DtM.IBTabela.SQL.Clear;
    DtM.IBTabela.SQL.Add('insert into ENTRADA_NUMSERIE      ');
    DtM.IBTabela.SQL.Add('( CD_NOTA,  CD_PRODUTO,  NUMSERIE)');
    DtM.IBTabela.SQL.Add('values');
    DtM.IBTabela.SQL.Add('(:CD_NOTA, :CD_PRODUTO, :NUMSERIE)');
    if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
    DtM.IBTabela.ParamByName('CD_NOTA').AsInteger    := CD_Nota;
    DtM.IBTabela.ParamByName('CD_PRODUTO').AsInteger := CD_Produto;
    DtM.IBTabela.ParamByName('NUMSERIE').AsString    := NS;
    if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
    DtM.IBTabela.ExecSQL;
    DtM.IBTabela.IB_Transaction.Commit;
    result := true;
  except
    result := false;
    DtM.IBTabela.IB_Transaction.Rollback;
    MessageBeep(16);
    //CM.MensagemDeErro('Não foi possível incluir este Número de Série');
    edNumSerie.SetFocus;
    edNumSerie.SelectAll;
  end;
end;

procedure TfEntradaNumSerie.btIncluirClick(Sender: TObject);
begin
  Alterou := true;
  try
    if not InserirNS(edNumSerie.Text) then raise exception.Create('NS não inserido');
    IBNumSerie.Refresh;
    Calcula;
    edNumSerie.Clear;
    edNumSerie.SetFocus;
  except
    DtM.IBTabela.IB_Transaction.Rollback;
    MessageBeep(16);
    MensagemDeErro('Não foi possível incluir este Número de Série');
    edNumSerie.SetFocus;
    edNumSerie.SelectAll;
  end;
end;

procedure TfEntradaNumSerie.Calcula;
begin
  QuantidadeTotal      := IBNumSerie.RecordCount;
  lbQuantidade.Caption := PoeZeros(QuantidadeTotal, 2);
end;

procedure TfEntradaNumSerie.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfEntradaNumSerie.edNumSerieKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then btIncluir.Click;
end;

procedure TfEntradaNumSerie.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_F10 : btFechar.Click;
    vk_F4  : BtExcluir.Click;
    else if ((shift = []) and (not edNumSerie.Focused) and (not(key in [vk_up, vk_down, vk_Left, vk_Right, vk_Tab, vk_Escape, vk_Return, vk_Home, vk_End, vk_Next, vk_Prior, vk_Delete, vk_Insert]))) then
         begin
           edNumSerie.SetFocus;
           edNumSerie.Text := chr(key);
           edNumSerie.SelStart := length(edNumSerie.Text);
         end;  
  end;
end;

procedure TfEntradaNumSerie.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Dif : Integer;
begin
  Dif := QuantidadeEsperada - QuantidadeTotal;
  if (QuantidadeEsperada > 0) and (QuantidadeEsperada <> QuantidadeTotal) then
  begin
    MessageBeep(48);
    MessageBeep(48);
    MessageBeep(48);
    if Dif > 0 then
      MensagemDeAtencao('Ainda falta a entrada de '+IntToStr(dif)+' Número(s) de série(s).')
    else
      MensagemDeAtencao('Foi lançado '+IntToStr(dif*(-1))+' Número(s) de série(s) a mais para este item.');
  end;
end;

procedure TfEntradaNumSerie.btImportarClick(Sender: TObject);
var
  S, NomeArq : string;
  F : TextFile;
begin
  OpenDialog.InitialDir := CM.BuscaValorDoComponente(self, OpenDialog, '');
  if not OpenDialog.Execute then exit;

  CM.SalvaValorDoComponente(self, OpenDialog, OpenDialog.InitialDir);
  NomeArq := OpenDialog.FileName;
  Alterou := true;

  try
    AssignFile(F, NomeArq);
    Reset(F);
  except
    MensagemDeErro('Não foi possível abrir o arquivo'+PL+NomeArq);
    Exit;
  end;
  while not eof(F) do
  begin
    Readln(F, S);
    InserirNS(S);
  end;
  IBNumSerie.Refresh;
  Calcula;
  edNumSerie.Clear;
  edNumSerie.SetFocus;

  CloseFile(F);
end;

procedure TfEntradaNumSerie.FormCreate(Sender: TObject);
begin
  Alterou := false;
  CD_Produto := 0;
  CD_Nota    := 0;
end;

end.
