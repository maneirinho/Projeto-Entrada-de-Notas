//ok
unit UConcPrecoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

Const
  EstaChave = '\ConciliaPrecos';

type
  TfConcPrecoVenda = class(TForm)
    bt_ConcPreco: TBitBtn;
    RadioGroup1: TRadioGroup;
    btLocNota: TBitBtn;
    GroupBoxNota: TGroupBox;
    Label3: TLabel;
    LabelFornecedor: TLabel;
    Label4: TLabel;
    LabelNumNota: TLabel;
    LabelDataEntrada: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    LabelValorNota: TLabel;
    btFechar: TBitBtn;
    Image: TImage;
    Bevel1: TBevel;
    Label6: TLabel;
    Label1: TLabel;
    edGrupo: TEdit;
    btBuscaGrupo: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bt_ConcPrecoClick(Sender: TObject);
    procedure btLocNotaClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btBuscaGrupoClick(Sender: TObject);
  private
    ChaveDoRegistro : String;
    procedure SelecionaNota;
  public
    { Public declarations }
  end;

var
  fConcPrecoVenda: TfConcPrecoVenda;

implementation

uses DUtilit, UComum,UConstVar, UCadGruposProdutos, UDataMod, UConsultaListaNotas,
     IB_Components, UModUsuarios, DBFunctions, MessageFunctions;

{$R *.dfm}

procedure TfConcPrecoVenda.FormCreate(Sender: TObject);
begin
  ItemEsc.CodInt := 0;
  ItemEsc.CodExt := '';
  ChaveDoRegistro := RegChaveForms+EstaChave;
  RadioGroup1.OnClick(self);
end;

procedure TfConcPrecoVenda.bt_ConcPrecoClick(Sender: TObject);
var
  EWhere : Boolean;
  QuantidadeAlterada : Integer;
begin
  if MensagemDeConfirmacao('Deseja atualizar pre�os de Venda agora?') = mrYes then
  begin
    AbreAviso('Conciliando pre�os de Venda...', 0, 0, 0, 0);
    with DtM do
    begin
      if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
      IBTabela.Active := False;

      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('UPDATE PRODUTOS SET PDV_PRECOVENDA = PRECOVENDA');
      IBTabela.SQL.Add('where (coalesce(PDV_PRECOVENDA, 0) <> coalesce(PRECOVENDA, 0)) ');

      if GroupBoxNota.Visible then
        IBTabela.SQL.Add('and CD_PRODUTO in (Select CD_PRODUTO from ENTRADA_ITEM where CD_NOTA = '+ItemEsc.CodExt+')');

      if edGrupo.tag <> 0 then
        IBTabela.SQL.Add('and (select PERTENCE from SP_PERTENCE_AO_GRUPO(PRODUTOS.CD_GRUPO, '+intToStr(edGrupo.tag)+')) = ''V'' ');
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.ExecSQL;
      QuantidadeAlterada := IBTabela.RowsAffected;

      try
        IBTabela.IB_Transaction.Commit;
      except
        on E: exception do begin
          LogDeErros(E.Message);
          IBTabela.IB_Transaction.RollBack;
        end;
      end;
    end;
    FechaAviso;
    Screen.Cursor := crDefault;
    MensagemDeInformacao('Ok.'+PL+'Concilia��o conclu�da.'+PL+IntToStr(QuantidadeAlterada)+' produtos foram afetados.');
    btFechar.SetFocus;
  end;
end;

procedure TfConcPrecoVenda.btLocNotaClick(Sender: TObject);
begin
  Application.CreateForm(TfEntradasDeNotas, fEntradasDeNotas);
  fEntradasDeNotas.bt_Ok.Left := fEntradasDeNotas.PosicaoDoOk;
  fEntradasDeNotas.PageControl1.TabIndex := 1;
  fEntradasDeNotas.ShowModal;
  fEntradasDeNotas.Release;
  FreeAndNil(fEntradasDeNotas);
  SelecionaNota;
end;

procedure TfConcPrecoVenda.SelecionaNota;
begin
  GroupBoxNota.Visible := ItemEsc.CodInt > 0;
  if ItemEsc.CodInt > 0 then
  begin
    with DtM.IBTabela do
    begin
      Active := false;
      SQL.Clear;
      SQL.Add('Select * from ENTRADA');
      SQL.Add('left outer join FORNECEDORES F on F.CD_FORNECEDOR = ENTRADA.CD_FORNECEDOR');
      SQL.Add('Where CD_NOTA = :CD_NOTA');
      if not Prepared then Prepare;
      ParamByName('CD_NOTA').AsInteger := ItemEsc.CodInt;
      Active := true;
      LabelFornecedor.Caption := FieldByname('NM_FORNECEDOR').AsString;
      LabelNumNota.Caption := FieldByname('NUM_DOCUMENTO').AsString;
      LabelDataEntrada.Caption := FormatDateTime('dd/mm/yyyy', FieldByname('DT_ENTRADA').AsDateTime);
      LabelValorNota.Caption := FormatCurr(',0.00;-,0.00', FieldByname('VALOR_TOTAL_NOTA').AsCurrency);
      fDB.FechaTT(DtM.IBTabela);
    end;
  end
  else begin
    LabelFornecedor.Caption := '';
    LabelNumNota.Caption := '';
    LabelDataEntrada.Caption := '';
    LabelValorNota.Caption := '';
  end;
end;

procedure TfConcPrecoVenda.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : btLocNota.Visible := false;
    1 : btLocNota.Visible := true;
  end;
  GroupBoxNota.Visible := (btLocNota.Visible) and (ItemEsc.CodInt > 0);
  Image.Visible := btLocNota.Visible;
end;

procedure TfConcPrecoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaIntegerNoRegistro(ChaveDoRegistro, 'Grupo',  edGrupo.tag);
end;

procedure TfConcPrecoVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfConcPrecoVenda.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfConcPrecoVenda.FormShow(Sender: TObject);
begin
  edGrupo.Tag       := LeValorDoRegistro(ChaveDoRegistro, 'Grupo', 'I', 0);
  if edGrupo.Tag = 0 then edGrupo.Text := '*** TODOS OS GRUPOS ***'
                     else edGrupo.Text := CM.StringGrupo(edGrupo.Tag);

  if ItemEsc.CodInt > 0 then
  begin
    RadioGroup1.ItemIndex := 1;
    RadioGroup1.OnClick(Self);
    SelecionaNota;
  end;
  Screen.Cursor := crDefault;
  FechaAviso;
end;

procedure TfConcPrecoVenda.edGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_Return) then
  begin
    btBuscaGrupo.Click;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfConcPrecoVenda.btBuscaGrupoClick(Sender: TObject);
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
