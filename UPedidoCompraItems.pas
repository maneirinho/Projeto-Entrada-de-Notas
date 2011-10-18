//ok
unit UPedidoCompraItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, UComum,
  UComp, DUtilit, DB, wwdblook, JvToolEdit, JvBaseEdits, JvExMask,
  JvSpin, UConstVar,  UDiverso, MessageFunctions;

Const
  EstaChave = '\PedidoComprasItems';

type
  TfPedidoCompraItems = class(TForm)
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Bt_Pesquisar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    EditDescProduto: TEdit;
    EditCodProduto: TEdit;
    GroupBox3: TGroupBox;
    Panel1: TPanel;
    Label22: TLabel;
    Bevel1: TBevel;
    Bt_Cancelar: TBitBtn;
    Bt_Ok: TBitBtn;
    Bt_Incluir: TBitBtn;
    Label5: TLabel;
    EditUnidade: TEdit;
    Bt_Proximo: TBitBtn;
    Bt_Anterior: TBitBtn;
    Label23: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    BitBtn1: TBitBtn;
    edGrupo: TEdit;
    Label33: TLabel;
    Label39: TLabel;
    DBEdit15: TDBEdit;
    Label40: TLabel;
    DBEdit16: TDBEdit;
    EditCodBalanca: TEdit;
    Label34: TLabel;
    Label13: TLabel;
    Label6: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    EditSequencial: TJvSpinEdit;
    EditQuantidade: TJvCalcEdit;
    EditValor: TJvCalcEdit;
    EditValorTotal: TJvCalcEdit;
    EditUndConversao: TJvCalcEdit;
    EditCustoUnitario: TJvCalcEdit;
    EditCustoAtual: TJvCalcEdit;
    EditPrecoVendaAtual: TJvCalcEdit;
    EditEstoqueAtual: TJvCalcEdit;
    EditUltimaCompra: TJvDateEdit;
    EditUltimaVenda: TJvDateEdit;
    procedure Bt_CancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_IncluirClick(Sender: TObject);
    procedure Bt_PesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCodProdutoExit(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure Bt_AnteriorClick(Sender: TObject);
    procedure Bt_ProximoClick(Sender: TObject);
    procedure EditCSTExit(Sender: TObject);
    procedure EditMargemLucroExit(Sender: TObject);
    procedure EditQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EditIPIExit(Sender: TObject);
    procedure EditIPIValorExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditCodProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditDescProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    ChaveDoRegistro : String;
    CodigoDoProduto : Integer;
    FechaForm       : boolean;
    function TemErro: boolean;
    procedure GravaDados(gdInclusao: boolean);
    procedure CalculaCampos;
    procedure VerificaTresCasasDecimais(TresCasas: Boolean);
  public
    Modo : TModos;
    CodItem : String;
    procedure MostraDados;
    procedure LocalizaProduto(lpCodigoDoProduto: Integer);
  end;

var
  fPedidoCompraItems: TfPedidoCompraItems;

implementation

uses UDataMod,  IB_Components, UModUsuarios, DBFunctions, UModPesquisa, UCadProdutos, UCadGruposProdutos;

{$R *.dfm}

procedure TfPedidoCompraItems.Bt_CancelarClick(Sender: TObject);
begin
  CLose;
end;

procedure TfPedidoCompraItems.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfPedidoCompraItems.Bt_IncluirClick(Sender: TObject);
begin
  if TemErro then Exit;
  GravaDados(true);
  if FechaForm then Close;
end;

procedure TfPedidoCompraItems.LocalizaProduto(lpCodigoDoProduto: Integer);
begin
  DtM.IBTabela.Active := false;
  DtM.IBTabela.SQL.Clear;
  DtM.IBTabela.SQL.Add('Select P.CD_PRODUTO, P.COD_BARRAS, P.NM_PRODUTO, P.PRECOCUSTO, P.UNIDADE, P.BAL_COD_BALANCA, P.TRESCASAS,');
  DtM.IBTabela.SQL.Add('R.DT_ULTIMACOMPRA, R.DT_ULTIMAVENDA, P.CD_GRUPO,');
  DtM.IBTabela.SQL.Add('P.PRECOVENDA, P.MARGEM, P.UNDCONVERSAOENTRADA');
  DtM.IBTabela.SQL.Add('FROM PRODUTOS P');
  DtM.IBTabela.SQL.Add('left outer join REFPRODUTOS R on P.CD_PRODUTO = R.CD_PRODUTO');
  DtM.IBTabela.SQL.Add('where P.CD_PRODUTO = '+IntToStr(lpCodigoDoProduto));
  if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
  DtM.IBTabela.Active := true;
  if not DtM.IBTabela.IsEmpty then
  begin
    EditCodProduto.Text    := DtM.IBTabela.FieldByName('COD_BARRAS').AsString;
    EditDescProduto.Text   := DtM.IBTabela.FieldByName('NM_PRODUTO').AsString;
    EditCustoAtual.Value   := DtM.IBTabela.FieldByName('PRECOCUSTO').AsCurrency;
    EditPrecoVendaAtual.Value := DtM.IBTabela.FieldByName('PRECOVENDA').AsCurrency;
    EditEstoqueAtual.Value := CM.PegaEstoque(lpCodigoDoProduto);
    EditUnidade.Text       := DtM.IBTabela.FieldByName('UNIDADE').AsString;
    EditCodBalanca.Text    := DtM.IBTabela.FieldByName('BAL_COD_BALANCA').AsString;
    EditUltimaCompra.Date  := DtM.IBTabela.FieldByName('DT_ULTIMACOMPRA').AsDateTime;
    EditUltimaVenda.Date   := DtM.IBTabela.FieldByName('DT_ULTIMAVENDA').AsDateTime;
    edGrupo.Tag            := DtM.IBTabela.FieldByName('CD_GRUPO').AsInteger;
    edGrupo.Text           := CM.StringGrupo(edGrupo.Tag);
    EditUndConversao.Value := DtM.IBTabela.FieldByName('UNDCONVERSAOENTRADA').AsCurrency;


    CodigoDoProduto        := DtM.IBTabela.FieldByName('CD_PRODUTO').AsInteger;
    VerificaTresCasasDecimais(DtM.IBTabela.FieldByName('TRESCASAS').AsString = 'V');
  end
  else begin
    CodigoDoProduto := 0;
  end;
  fDB.FechaTT(DtM.IBTabela);
end;

procedure TfPedidoCompraItems.VerificaTresCasasDecimais(TresCasas: Boolean);
begin
  if TresCasas then
  begin
    EditValor.DecimalPlaces            := 3;
    EditValor.DisplayFormat            := ',0.000';
    EditValorTotal.DecimalPlaces       := 3;
    EditValorTotal.DisplayFormat       := ',0.000';
    EditCustoUnitario.DecimalPlaces    := 3;
    EditCustoUnitario.DisplayFormat    := ',0.000';
    EditCustoAtual.DecimalPlaces       := 3;
    EditCustoAtual.DisplayFormat       := ',0.000';
    EditPrecoVendaAtual.DecimalPlaces  := 3;
    EditPrecoVendaAtual.DisplayFormat  := ',0.000';
  end
  else begin
    EditValor.DecimalPlaces         := 2;
    EditValor.DisplayFormat         := ',0.00';
    EditValorTotal.DecimalPlaces    := 2;
    EditValorTotal.DisplayFormat    := ',0.00';
    EditCustoUnitario.DecimalPlaces := 2;
    EditCustoUnitario.DisplayFormat := ',0.00';
    EditCustoAtual.DecimalPlaces    := 2;
    EditCustoAtual.DisplayFormat    := ',0.00';
    EditPrecoVendaAtual.DecimalPlaces := 2;
    EditPrecoVendaAtual.DisplayFormat := ',0.00';
  end;
end;

procedure TfPedidoCompraItems.Bt_PesquisarClick(Sender: TObject);
begin
  ItemEsc := mPesq.Pesquisa(pqProdutos, [mdInclusao, mdAlteracao], nil, EditDescProduto.Text, '', false, FornecedorVinculado);
  if ItemEsc.CodInt > 0 then
  begin
    LocalizaProduto(ItemEsc.CodInt);
    EditQuantidade.SetFocus;
  end;
end;

procedure TfPedidoCompraItems.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_Escape : Close;
    vk_F3     : if (Shift = []) then begin
                  Bt_Pesquisar.SetFocus;
                  Bt_Pesquisar.Click;
                end;
    vk_F5     : begin
                  if CodigoDoProduto > 0 then
                  begin
                    Application.CreateForm(TfCadProdutos, fCadProdutos);
                    AbreCad.EntraNaAlteracao := CodigoDoProduto;
                    fCadProdutos.ShowModal;
                    FreeAndNil(fCadProdutos);
                    LocalizaProduto(CodigoDoProduto);
                  end;
                end;
  end;
end;

procedure TfPedidoCompraItems.EditCodProdutoExit(Sender: TObject);
begin
  if (EditDescProduto.Focused)or(RadioButton2.Focused)or(Bt_Pesquisar.Focused)or(Bt_Cancelar.Focused)or(Bt_Ok.Focused)or(Bt_Incluir.Focused)or(Bt_Proximo.Focused)or(Bt_Anterior.Focused) then
    Exit;

  if not Vazio(EditCodProduto.Text) then
  begin
    DtM.IBTabela.Active := false;
    DtM.IBTabela.SQL.Clear;
    DtM.IBTabela.SQL.Add('Select CD_PRODUTO from PRODUTOS');
    DtM.IBTabela.SQL.Add('where COD_BARRAS = '+QuotedStr(EditCodProduto.Text));
    if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
    DtM.IBTabela.Active := true;
    if not DtM.IBTabela.IsEmpty then
      LocalizaProduto(DtM.IBTabela.FieldByName('CD_PRODUTO').AsInteger)
    else begin
      ItemEsc := mPesq.Pesquisa(pqProdutos, [mdInclusao, mdAlteracao], nil, EditDescProduto.Text, '', false, FornecedorVinculado);
      if ItemEsc.CodInt > 0 then
        LocalizaProduto(ItemEsc.CodInt);
    end;
    fDB.FechaTT(DtM.IBTabela);
  end
  else begin
    Bt_Pesquisar.Click
  end;
end;

function TfPedidoCompraItems.TemErro: boolean;
begin
  result := false;

  if (not result) and (Vazio(EditDescProduto.Text)) then
  begin
    MensagemDeAtencao('� necess�rio informar o Produto');
    result := true;
    EditCodProduto.SetFocus;
  end;

  if (not result) and (EditQuantidade.Value = 0) then
  begin
    MensagemDeAtencao('� necess�rio informar a Quantidade');
    result := true;
    EditQuantidade.SetFocus;
  end;

  if (not result) and (EditUndConversao.Value = 0) then
  begin
    MensagemDeAtencao('� necess�rio informar a Unidade de Convers�o');
    result := true;
    EditUndConversao.SetFocus;
  end;

  if (not result) and (Vazio(edGrupo.Text)) then
  begin
    MensagemDeAtencao('� necess�rio informar o Grupo');
    result := true;
    edGrupo.SetFocus;
  end;
end;

procedure TfPedidoCompraItems.GravaDados(gdInclusao: boolean);
var
  slCampos, slExcecoes, slSQL : TStrings;
  JaTem : Boolean;
  Result : integer;
begin
  if CodigoDoProduto > 0 then
  begin
    with DtM do
    begin
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Select I.NUM_PEDIDO from PEDIDOSDECOMPRA_ITEMS I');
      IBTabela.SQL.Add('left outer join PEDIDOSDECOMPRA P');
      IBTabela.SQL.Add('on I.NUM_PEDIDO = P.NUM_PEDIDO');
      IBTabela.SQL.Add('where P.BAIXADA = :BAIXADA');
      IBTabela.SQL.Add('and I.CD_PRODUTO = :CD_PRODUTO');
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.ParamByName('BAIXADA').AsString := 'F';
      IBTabela.ParamByName('CD_PRODUTO').AsInteger := CodigoDoProduto;
      IBTabela.Active := true;
      if not IBTabela.IsEmpty then
      begin
        Result := MessageBox(Handle, PChar('Este produto j� consta no pedido n� '+IBTabela.FieldByName('NUM_PEDIDO').AsString+'.' + #10#13 + 'Deseja continuar?'), PChar('Warning'), 308);
        if Result <> mrYes then
        begin
          IBTabela.Active := false;
          FechaForm := false;
          exit;
        end;
      end;
      fDB.FechaTT(IBTabela);
    end;
  end;

  with DtM do
  begin
    slSQL      := TStringList.Create;
    slCampos   := TStringList.Create;
    slExcecoes := TStringList.Create;
    DtM.IBDatabaseServer.SchemaCache.GetTableFields('PEDIDOSDECOMPRA_ITEMS', slCampos);
    slExcecoes.Add('VALORTOTAL');
    slExcecoes.Add('CD_ITEM');
    slExcecoes.Add('DT_CADASTRO');
    slExcecoes.Add('ULTIMAALTERACAO');

    if gdInclusao then
      GeraSQLInsertUpdate('PEDIDOSDECOMPRA_ITEMS', slCampos, slExcecoes, '', rmInclusao, slSQL)
    else
      GeraSQLInsertUpdate('PEDIDOSDECOMPRA_ITEMS', slCampos, slExcecoes, 'NUM_PEDIDO = '+IBPedidoCompra.FieldByName('NUM_PEDIDO').AsString+' and CD_ITEM = '+CodItem, rmAlteracao, slSQL);

    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL := slSQL;
    slSQL.Free;
    slCampos.Free;
    slExcecoes.Free;

    if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
    try
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.ParamByName('NUM_PEDIDO').AsInteger      := IBPedidoCompra.FieldByName('NUM_PEDIDO').AsInteger;
      IBTabela.ParamByName('CD_PRODUTO').AsInteger      := CodigoDoProduto;
      IBTabela.ParamByName('COD_BARRAS').AsString       := EditCodProduto.Text;
      IBTabela.ParamByName('NM_PRODUTO').AsString       := EditDescProduto.Text;
      IBTabela.ParamByName('QUANTIDADE').AsCurrency     := EditQuantidade.Value;
      IBTabela.ParamByName('VALOR').AsCurrency          := EditValor.Value;
      IBTabela.ParamByName('UNDCONVERSAO').AsCurrency   := EditUndConversao.Value;
      IBTabela.ParamByName('VALOR_UNITARIO').AsCurrency := EditCustoUnitario.Value;

      IBTabela.ParamByName('CD_GRUPO').AsInteger          := edGrupo.Tag;
      IBTabela.ParamByName('SEQUENCIAL').AsInteger        := trunc(EditSequencial.Value);
      IBTabela.ParamByName('BAIXADO').AsString            := 'F';
      IBTabela.ExecSQL;
      IBTabela.IB_Transaction.Commit;
      SalvaBooleanNoRegistro(ChaveDoRegistro, 'TemCodProduto', RadioButton1.Checked);
    except
      on E: exception do begin
        LogDeErros(E.Message);
        IBTabela.IB_Transaction.Rollback;
        MensagemDeErro('N�o foi poss�vel gravar este item.');
        exit;
      end;
    end;
  end;
  FechaForm := true;
end;

procedure TfPedidoCompraItems.Bt_OkClick(Sender: TObject);
begin
  if TemErro then Exit;
  GravaDados(false);
  if FechaForm then Close;
end;

procedure TfPedidoCompraItems.MostraDados;
begin
  with DtM do begin
    if (IBPCItems.FieldByName('CD_PRODUTO').AsInteger = 0)or(Vazio(IBPCItems.FieldByName('CD_PRODUTO').AsString))or(IBPCItems.FieldByName('CD_PRODUTO').IsNull) then
    begin
      EditDescProduto.Text := IBPCItems.FieldByName('NM_PRODUTO').AsString;
      EditCodProduto.Text  := IBPCItems.FieldByName('COD_BARRAS').AsString;
      edGrupo.Tag          := DtM.IBPCItems.FieldByName('CD_GRUPO').AsInteger;
      edGrupo.Text         := CM.StringGrupo(edGrupo.Tag);
    end
    else
      LocalizaProduto(IBPCItems.FieldByName('CD_PRODUTO').AsInteger);

    EditQuantidade.Value      := IBPCItems.FieldByName('QUANTIDADE').AsCurrency;
    EditValor.Value           := IBPCItems.FieldByName('VALOR').AsCurrency;
    EditUndConversao.Value    := IBPCItems.FieldByName('UNDCONVERSAO').AsCurrency;
    EditSequencial.Value      := IBPCItems.FieldByName('SEQUENCIAL').AsInteger;

    VerificaTresCasasDecimais(false);
    CalculaCampos;
  end;
end;

procedure TfPedidoCompraItems.Bt_AnteriorClick(Sender: TObject);
begin
  if TemErro then Exit;
  GravaDados(false);
  DtM.IBPCItems.Refresh;
  DtM.IBPCItems.Prior;
  CodItem := DtM.IBNFItems.FieldByname('CD_ITEM').AsString;
  MostraDados;
end;

procedure TfPedidoCompraItems.Bt_ProximoClick(Sender: TObject);
begin
  if TemErro then Exit;
  GravaDados(false);
  DtM.IBPCItems.Refresh;
  DtM.IBPCItems.Next;
  CodItem := DtM.IBNFItems.FieldByname('CD_ITEM').AsString;
  MostraDados;
end;

procedure TfPedidoCompraItems.CalculaCampos;
begin
  if (EditUndConversao.Value > 0) and (EditQuantidade.Value > 0) then
  begin
    EditCustoUnitario.Value := (EditValor.Value / EditUndConversao.Value);
    EditValorTotal.Value    := (EditQuantidade.Value * EditValor.Value);
  end;
end;

procedure TfPedidoCompraItems.EditCSTExit(Sender: TObject);
begin
  CalculaCampos;
end;

procedure TfPedidoCompraItems.EditMargemLucroExit(Sender: TObject);
begin
  CalculaCampos;
end;

procedure TfPedidoCompraItems.EditQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '.' then key := ',';
end;

procedure TfPedidoCompraItems.EditIPIExit(Sender: TObject);
begin
  CalculaCampos;
end;

procedure TfPedidoCompraItems.EditIPIValorExit(Sender: TObject);
begin
  CalculaCampos;
end;

procedure TfPedidoCompraItems.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TfCadGruposProdutos, fCadGruposProdutos);
  fCadGruposProdutos.CD_GRUPO := edGrupo.Tag;
  fCadGruposProdutos.ShowModal;
  if fCadGruposProdutos.BotaoPressionado = bpOk then
  begin
    edGrupo.Tag := fCadGruposProdutos.CD_GRUPO;
    edGrupo.Text := CM.StringGrupo(edGrupo.Tag);
  end;
  FreeAndNil(fCadGruposProdutos);
end;

procedure TfPedidoCompraItems.FormCreate(Sender: TObject);
begin
  ChaveDoRegistro := RegChaveForms+EstaChave;
  FechaForm := true;
end;

procedure TfPedidoCompraItems.RadioButton1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
//    EditDescProduto.Clear;
    EditDescProduto.ReadOnly := true;
    EditDescProduto.Color := clYellow;
    EditDescProduto.tabStop := false;

    LigaComponente(self, EditCodProduto);
    Bt_Pesquisar.Enabled := true;
    EditCodProduto.SetFocus;
  end
  else begin
    EditCodProduto.Clear;
    EditDescProduto.ReadOnly := false;
    EditDescProduto.Color := clWindow;
    EditDescProduto.tabStop := true;

    DesligaComponente(self, EditCodProduto);
    Bt_Pesquisar.Enabled := false;
    EditDescProduto.SetFocus;

    CodigoDoProduto := 0;
    EditCustoAtual.Value := 0;
    EditPrecoVendaAtual.Value := 0;
    EditEstoqueAtual.Value := 0;
    EditUltimaCompra.Text := '  /  /    ';
    EditUltimaVenda.Text := '  /  /    ';
    EditUnidade.Text := '';
    EditCodBalanca.Text := '';
    VerificaTresCasasDecimais(false);
  end;
end;

procedure TfPedidoCompraItems.FormShow(Sender: TObject);
var
  TemCodigo : boolean;
begin
  FornecedorVinculado := DtM.IBPedidoCompra.FieldByName('CD_FORNECEDOR').AsInteger;
  Bt_Anterior.Visible := Modo = mdAlteracao;
  Bt_Proximo.Visible  := Modo = mdAlteracao;

  if Modo = mdAlteracao then
    TemCodigo := ((Modo = mdAlteracao) and (DtM.IBPCItems.FieldByName('CD_PRODUTO').AsInteger <> 0)) or
                 ((Modo = mdInclusao)  and (LeBooleanDoRegistro(ChaveDoRegistro, 'TemCodProduto', true))); 

  if TemCodigo then RadioButton1.Checked := true
               else RadioButton2.Checked := true;

  RadioButton1Click(RadioButton1);

  FechaAviso;
  Screen.Cursor := crDefault;
end;

procedure TfPedidoCompraItems.EditCodProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (key = vk_Down) then
  begin
    RadioButton2.SetFocus;
    RadioButton2.Checked := true;
    RadioButton1Click(RadioButton2);
  end;
end;

procedure TfPedidoCompraItems.EditDescProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (key = vk_Up) then
  begin
    RadioButton1.SetFocus;
    RadioButton1.Checked := true;
    RadioButton1Click(RadioButton1);
  end;
end;

procedure TfPedidoCompraItems.edGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_Return) then
  begin
    BitBtn1.Click;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
