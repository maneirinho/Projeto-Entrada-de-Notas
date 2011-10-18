//ok
unit USitNumSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, JvToolEdit;

type
  TfSitNumSerie = class(TForm)
    Panel1: TPanel;
    btFechar: TBitBtn;
    pnProduto: TPanel;
    edCodProduto: TEdit;
    edNomeProduto: TEdit;
    pnCompra: TPanel;
    edCodFornecedor: TEdit;
    edNomeFornecedor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label16: TLabel;
    edNFCompra: TEdit;
    edDataCompra: TJvDateEdit;
    Label4: TLabel;
    pnVenda: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edCodCliente: TEdit;
    edNomeCliente: TEdit;
    edNFVenda: TEdit;
    edDataVenda: TJvDateEdit;
    Label9: TLabel;
    edCupomECF: TEdit;
    Label10: TLabel;
    edNumDocVenda: TEdit;
    pnDevolucao: TPanel;
    Label12: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    edDataDevolucao: TJvDateEdit;
    edNumDocDevolucao: TEdit;
    edMotivoDevolucao: TEdit;
    Label11: TLabel;
    btBuscaVenda: TSpeedButton;
    btBuscaNotaEntrada: TSpeedButton;
    btBuscaDevolucao: TSpeedButton;
    pnNumSerie: TPanel;
    Label13: TLabel;
    edNumSerie: TEdit;
    Label15: TLabel;
    edRefNotaEntrada: TEdit;
    edPedOrcVenda: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btBuscaVendaClick(Sender: TObject);
    procedure btBuscaNotaEntradaClick(Sender: TObject);
  private
    { Private declarations }
  public
    NumSerie : String;
    CDProduto : Integer;
  end;

var
  fSitNumSerie: TfSitNumSerie;

implementation

uses DUtilit, UComum, IB_Components, UConsultaNotas, UConstVar, DBFunctions;

{$R *.dfm}

procedure TfSitNumSerie.FormCreate(Sender: TObject);
begin
  NumSerie := '!@#$%¨&**';
  CDProduto := 0;
end;

procedure TfSitNumSerie.FormShow(Sender: TObject);
begin
  with CM do
  begin
    try
      Screen.Cursor := crHourGlass;
      edNumSerie.Text := NumSerie;

      // Pega Dados do Produto
      CM.PegaDadosDoProduto(CDProduto);
      edCodProduto.Text := RegProduto.Cod_Barras;
      edNomeProduto.Text := RegProduto.Nm_Produto;

      // Pega Informações de Compra
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Select ENTRADA.CD_NOTA, ENTRADA.CD_FORNECEDOR, ENTRADA.NUM_DOCUMENTO, ENTRADA.DT_ENTRADA, F.NM_FORNECEDOR from ENTRADA_NUMSERIE');
      IBTabela.SQL.Add('left outer join ENTRADA on ENTRADA.CD_NOTA = ENTRADA_NUMSERIE.CD_NOTA');
      IBTabela.SQL.Add('left outer join FORNECEDORES F on F.CD_FORNECEDOR = ENTRADA.CD_FORNECEDOR');
      IBTabela.SQL.Add('where NUMSERIE = :NUMSERIE and CD_PRODUTO = :CD_PRODUTO');
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.ParamByName('NUMSERIE').AsString := NumSerie;
      IBTabela.ParamByName('CD_PRODUTO').AsInteger := CDProduto;
      IBTabela.Active := true;
      if not IBTabela.IsEmpty then
      begin
        edCodFornecedor.Text  := IBTabela.FieldByName('CD_FORNECEDOR').AsString;
        edNomeFornecedor.Text := IBTabela.FieldByName('NM_FORNECEDOR').AsString;
        edRefNotaEntrada.Text := IBTabela.FieldByName('CD_NOTA').AsString;
        edNFCompra.Text       := IBTabela.FieldByName('NUM_DOCUMENTO').AsString;
        edDataCompra.Date     := IBTabela.FieldByName('DT_ENTRADA').AsDate;
      end;


      // Busca Informações de Venda
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Select V.NUM_DOCUMENTO, V.NF_NUMERO, V.CD_CLIENTE, V.NM_CLIENTE, V.DATA_HORA, V.ECF_COO, V.PED_ORC_VENDA from PEDIDO_ITEM');
      IBTabela.SQL.Add('left outer join PEDIDO V on V.NUM_DOCUMENTO = PEDIDO_ITEM.NUM_DOCUMENTO');
      IBTabela.SQL.Add('left outer join CLIENTES C on C.CD_CLIENTE = V.CD_CLIENTE');
      IBTabela.SQL.Add('where NUMSERIE = :NUMSERIE');
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.ParamByName('NUMSERIE').AsString := NumSerie;
      IBTabela.Active := true;
      if not IBTabela.IsEmpty then
      begin
        edNumDocVenda.Text   := IBTabela.FieldByName('NUM_DOCUMENTO').AsString;
        edNFVenda.Text       := IBTabela.FieldByName('NF_NUMERO').AsString;
        edCupomECF.Text      := IBTabela.FieldByName('ECF_COO').AsString;
        edCodCliente.Text    := IBTabela.FieldByName('CD_CLIENTE').AsString;
        edNomeCliente.Text   := IBTabela.FieldByName('NM_CLIENTE').AsString;
        edDataVenda.Date     := IBTabela.FieldByName('DATA_HORA').AsDate;
        edPedOrcVenda.Text   := IBTabela.FieldByName('PED_ORC_VENDA').AsString;
      end;

      // Pega Informações de Devolução
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('select D.MOTIVO, D.NUM_DOCUMENTO, D.DATA from NUMSERIE NS ');
      IBTabela.SQL.Add('left outer join DEVOLUCOES D on D.NUM_DOCUMENTO = NS.NUM_DOC_DEVOLUCAO ');
      IBTabela.SQL.Add('where NUMSERIE = :NUMSERIE and CD_PRODUTO = :CD_PRODUTO ');
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.ParamByName('NUMSERIE').AsString := NumSerie;
      IBTabela.ParamByName('CD_PRODUTO').AsInteger := CDProduto;
      IBTabela.Active := true;
      if not IBTabela.IsEmpty then
      begin
        edNumDocDevolucao.Text := IBTabela.FieldByName('NUM_DOCUMENTO').AsString;
        edMotivoDevolucao.Text := IBTabela.FieldByName('MOTIVO').AsString;
        edDataDevolucao.Date   := IBTabela.FieldByName('DATA').AsDate;
      end;

    finally
      Screen.Cursor := crDefault;
      FechaAviso;
      fDB.FechaTT(IBTabela);
    end;
  end;
end;

procedure TfSitNumSerie.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfSitNumSerie.btBuscaVendaClick(Sender: TObject);
begin
  CM.MostraItems(StrToIntZ(edNumDocVenda.Text, 0), StrToChar(edPedOrcVenda.Text, 'X'));
end;

procedure TfSitNumSerie.btBuscaNotaEntradaClick(Sender: TObject);
begin
  if StrToIntZ(edRefNotaEntrada.Text, 0) = 0 then Exit;
  Application.CreateForm(TfEntradaNotaConsulta, fEntradaNotaConsulta);
  fEntradaNotaConsulta.MostraEstaNota := StrToIntZ(edRefNotaEntrada.Text, 0);
  fEntradaNotaConsulta.ShowModal;
  FreeAndNil(fEntradaNotaConsulta);
end;

end.
