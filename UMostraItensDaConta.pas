//ok
unit UMostraItensDaConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, Wwdbigrd, Wwdbgrid,
  DUtilit, Buttons, IBODataset, Gradpan, IB_Components, UComum,
  UConstVar, JvComponentBase, JvDBGridExport, MessageFunctions;

type
  TChamada = (chContasAReceber, chVendasFechadas, chOrcamentos, chPedidos,
              chTransferencias, chAssociaNF, chTrocaDevolucao);

  TItemEscolhido = record
    Cd_Produto : Integer;
    Cod_Barras : String[13];
  end;


  TfMostraItensDaConta = class(TForm)
    DataSource1: TDataSource;
    IBVendasItems: TIBOQuery;
    IBVendasItemsCOD_BARRAS: TStringField;
    IBVendasItemsNM_PRODUTO: TStringField;
    IBVendasItemsQUANTIDADE: TIBOFloatField;
    IBVendasItemsPRECO: TBCDField;
    IBVendasItemsSUBTOTAL: TBCDField;
    GradPan1: TGradPan;
    PanelTotalLiquido: TGradPan;
    lbValorTotal: TLabel;
    PanelSubtotal: TGradPan;
    pnSubtotal: TGradPan;
    Label11: TLabel;
    LabelSubTotal: TLabel;
    PanelValorPago: TGradPan;
    pnValorPago: TGradPan;
    Label29: TLabel;
    LabelValorPago: TLabel;
    btOk: TBitBtn;
    pnTroco: TGradPan;
    Label13: TLabel;
    LabelTroco: TLabel;
    IBVendasItemsSEQUENCIAL: TIntegerField;
    IBVendasItemsCD_PRODUTO: TIntegerField;
    Panel1: TGradPan;
    pnNumDoc: TGradPan;
    Label6: TLabel;
    lbNDoc: TLabel;
    pnNumFiscal: TGradPan;
    Label2: TLabel;
    lbNFiscal: TLabel;
    pnCliente: TGradPan;
    lbCapCliente: TLabel;
    lbCliente: TLabel;
    pnVendedor: TGradPan;
    lbCapVendedor: TLabel;
    lbVendedor: TLabel;
    pnData: TGradPan;
    Label5: TLabel;
    lbData: TLabel;
    pnQtdeItems: TGradPan;
    Label1: TLabel;
    lbQtdeItems: TLabel;
    btCancela: TBitBtn;
    Transacao: TIBOTransaction;
    IBVendasItemsDIM_COMPRIMENTO: TBCDField;
    IBVendasItemsDIM_LARGURA: TBCDField;
    IBVendasItemsDIM_ESPESSURA: TBCDField;
    pnDescontoPorc: TGradPan;
    LabelCapDescontoPorc: TLabel;
    lbDescontoPorc: TLabel;
    pnECF: TGradPan;
    Label10: TLabel;
    lbCOOECF: TLabel;
    pnSeqDiario: TGradPan;
    Label14: TLabel;
    lbSeqDiario: TLabel;
    PanelFormasPgto: TGradPan;
    pnPagamentos: TGradPan;
    LabelTipoPagamento: TLabel;
    Panel2: TPanel;
    DBGrid1: TwwDBGrid;
    edObs: TMemo;
    btExcel: TBitBtn;
    DBGridNormal: TDBGrid;
    JvDBGridExcelExport1: TJvDBGridExcelExport;
    SaveDialog1: TSaveDialog;
    pnTotal: TGradPan;
    Label8: TLabel;
    LabelTotal: TLabel;
    pnDescontoValor: TGradPan;
    LabelCapDescontoValor: TLabel;
    lbDescontoValor: TLabel;
    IBVendasItemsACRES_DESC_VALOR: TBCDField;
    IBVendasItemsCFOP: TIntegerField;
    IBVendasItemsNUMSERIE: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleButtonClick(Sender: TObject; AFieldName: String);
  private
    CampoOrdenado : String;
    ChaveDoRegistro : String;
    miRegPed : TRegPedido;
    procedure PreencheDadosdeVendas;
  public
    Chamada : TChamada;
    Num_Documento : Integer;
    ItemEscolhido : TItemEscolhido;
    PosicaoDoOk   : Integer;
  end;

var
  fMostraItensDaConta: TfMostraItensDaConta;
  Campos : array[1..11] of String = ('SEQUENCIAL', 'CD_PRODUTO', 'COD_BARRAS', 'NM_PRODUTO', 'QUANTIDADE', 'PRECO', 'ACRES_DESC_VALOR', 'SUBTOTAL', 'DIM_COMPRIMENTO', 'DIM_LARGURA', 'DIM_ESPESSURA');

implementation

uses UDataMod, DBFunctions;

const
  EstaChave = '\MostraItems';

{$R *.dfm}

procedure TfMostraItensDaConta.PreencheDadosdeVendas;
var
  ParcCartoes : String;
  i : word;
begin
  if miRegPed.Cancelado then
  begin
    Caption := Caption + '  CANCELADO EM: '+FormatDateTime('dd/mm/yyyy  hh:mm', miRegPed.DataCancelamento);
    GradPan1.ColorStart          := clBlack;
    pnNumDoc.ColorStart          := clBlack;
    pnSeqDiario.ColorStart       := clBlack;
    pnECF.ColorStart             := clBlack;
    pnNumFiscal.ColorStart       := clBlack;
    pnCliente.ColorStart         := clBlack;
    pnVendedor.ColorStart        := clBlack;
    pnQtdeItems.ColorStart       := clBlack;
    pnData.ColorStart            := clBlack;
    pnSubtotal.ColorStart        := clBlack;
    pnDescontoPorc.ColorStart    := clBlack;
    pnDescontoValor.ColorStart   := clBlack;
    pnTotal.ColorStart           := clBlack;
    pnValorPago.ColorStart       := clBlack;
    pnTroco.ColorStart           := clBlack;
    pnPagamentos.ColorStart      := clBlack;
    PanelTotalLiquido.ColorStart := clBlack;
  end;

  with CM do
  begin
    try lbValorTotal.Caption    := FormatCurr('R$ ,0.00;R$ -,0.00', miRegPed.TotalLiquido);  except end;
    try LabelSubTotal.Caption   := FormatCurr(',0.00;-,0.00',  miRegPed.TotalBruto);      except end;
    try LabelTotal.Caption      := FormatCurr(',0.00;-,0.00',  miRegPed.TotalLiquido);    except end;
    try lbDescontoPorc.Caption  := FormatCurr(',0.00;-,0.00',  miRegPed.AcresDesc.Porc);  except end;
    try lbDescontoValor.Caption := FormatCurr(',0.00;-,0.00',  miRegPed.AcresDesc.Valor); except end;
    if miRegPed.AcresDesc.Valor > 0 then
    begin
      LabelCapDescontoPorc.Caption  := 'Acr�scimo (%)';
      LabelCapDescontoValor.Caption := 'Acr�scimo ($)';
    end
    else begin
      LabelCapDescontoPorc.Caption  := 'Desconto (%)';
      LabelCapDescontoValor.Caption := 'Desconto ($)';
    end;

    if miRegPed.Pagamento.TotalPago > 0 then
    begin
      LabelValorPago.Caption := FormatCurr(',0.00', miRegPed.Pagamento.TotalPago+miRegPed.Pagamento.Troco);
      LabelTroco.Caption     := FormatCurr(',0.00', miRegPed.Pagamento.Troco);
      LabelTipoPagamento.Caption := '';
      if miRegPed.Pagamento.Pag_Dinheiro  > 0 then LabelTipoPagamento.Caption := LabelTipoPagamento.Caption + PL+ 'Dinheiro : '+FormatCurr(',0.00;-,0.00', miRegPed.Pagamento.Pag_Dinheiro);
      if miRegPed.Pagamento.Pag_CredCli   > 0 then LabelTipoPagamento.Caption := LabelTipoPagamento.Caption + PL+ 'Cr�d. Cliente : '+FormatCurr(',0.00;-,0.00', miRegPed.Pagamento.Pag_CredCli);
      if miRegPed.Pagamento.Pag_Ticket    > 0 then LabelTipoPagamento.Caption := LabelTipoPagamento.Caption + PL+ 'Ticket : '+FormatCurr(',0.00;-,0.00', miRegPed.Pagamento.Pag_Ticket);
      if miRegPed.Pagamento.Pag_Crediario > 0 then LabelTipoPagamento.Caption := LabelTipoPagamento.Caption + PL+ 'Credi�rio em '+IntToStr(miRegPed.Pagamento.QtdeParcCred)+'x : '+FormatCurr(',0.00;-,0.00', miRegPed.Pagamento.Pag_Crediario);
      if miRegPed.Pagamento.Pag_Cheque    > 0 then if miRegPed.Pagamento.QtdeCheques > 1 then LabelTipoPagamento.Caption := LabelTipoPagamento.Caption + PL+ IntToStr(miRegPed.Pagamento.QtdeCheques)+ ' Cheques : '+FormatCurr(',0.00;-,0.00', miRegPed.Pagamento.Pag_Cheque)
                                                                                         else LabelTipoPagamento.Caption := LabelTipoPagamento.Caption + PL+ 'Cheque : '+FormatCurr(',0.00;-,0.00', miRegPed.Pagamento.Pag_Cheque);
      ParcCartoes := '';
      if miRegPed.Pagamento.Pag_Cartao           > 0 then
      begin
        if length(miRegPed.Pagamento.VetCartoes) > 0 then  // Precisei colocar essa merda a� pq tava entrando no for, mesmo com o vetor zerado
          for i := 0 to length(miRegPed.Pagamento.VetCartoes)-1 do
            if miRegPed.Pagamento.VetCartoes[i].Num_Parcelas > 1 then
              ParcCartoes := ParcCartoes +' ('+(IntToStr(miRegPed.Pagamento.VetCartoes[i].Num_Parcelas))+'x)';

        if miRegPed.Pagamento.QtdeCartoes > 1 then LabelTipoPagamento.Caption := LabelTipoPagamento.Caption + PL+ IntToStr(miRegPed.Pagamento.QtdeCartoes)+ ' Cart�es : '+FormatCurr(',0.00;-,0.00', miRegPed.Pagamento.Pag_Cartao)+ParcCartoes
                                              else LabelTipoPagamento.Caption := LabelTipoPagamento.Caption + PL+ 'Cart�o : '+FormatCurr(',0.00;-,0.00', miRegPed.Pagamento.Pag_Cartao)+ParcCartoes;
      end;
    end
    else begin
      PanelFormasPgto.Visible := false;
      PanelValorPago.Visible := false;
    end;
  end;
end;

procedure TfMostraItensDaConta.btOkClick(Sender: TObject);
begin
  ItemEscolhido.Cd_Produto := IBVendasItems.FieldByName('CD_PRODUTO').AsInteger;
  ItemEscolhido.Cod_Barras := IBVendasItems.FieldByName('COD_BARRAS').AsString;
  Close;
end;

procedure TfMostraItensDaConta.btCancelaClick(Sender: TObject);
begin
  ItemEscolhido.Cd_Produto := 0;
  ItemEscolhido.Cod_Barras := '';
  Close;
end;

procedure TfMostraItensDaConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  SalvaStringNoRegistro(ChaveDoRegistro, 'Ordenacao', CampoOrdenado);
  fDB.FechaTT(IBVendasItems);
end;

procedure TfMostraItensDaConta.FormCreate(Sender: TObject);
begin
  IBVendasItems.IB_Connection := DtM.IBDatabaseServer;
  Transacao.IB_Connection := DtM.IBDatabaseServer;
  PosicaoDoOk := 664;
  ChaveDoRegistro := RegChaveForms+EstaChave;
  CampoOrdenado := LeStringDoRegistro(ChaveDoRegistro, 'Ordenacao', 'NM_PRODUTO');
  ItemEscolhido.Cd_Produto := 0;
  ItemEscolhido.Cod_Barras := '';
  DBGrid1.Selected.Clear;
  DBGrid1.Selected.Add('COD_BARRAS'#9'14'#9'C�digo');
  DBGrid1.Selected.Add('NM_PRODUTO'#9'57'#9'Produto');
  DBGrid1.Selected.Add('QUANTIDADE'#9'6'#9'Qtde.');
  DBGrid1.Selected.Add('PRECO'#9'8'#9'Pre�o');
  DBGrid1.Selected.Add('ACRES_DESC_VALOR'#9'6'#9'Desc/Acr�s');
  DBGrid1.Selected.Add('SUBTOTAL'#9'9'#9'SubTotal');
end;

procedure TfMostraItensDaConta.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;

  FechaAviso;
  Screen.Cursor := crDefault;
end;

procedure TfMostraItensDaConta.DBGrid1TitleButtonClick(Sender: TObject; AFieldName: String);
begin
  CampoOrdenado := AFieldName;
end;

end.
