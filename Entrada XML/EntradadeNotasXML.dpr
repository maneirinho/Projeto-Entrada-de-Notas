program EntradadeNotasXML;

uses
  ExceptionLog,
  Forms,
  UConcluiNota in '..\UConcluiNota.pas' {fConcluiNota},
  UConcPrecoVenda in '..\UConcPrecoVenda.pas' {fConcPrecoVenda},
  UConsultaListaNotas in '..\UConsultaListaNotas.pas' {fEntradasDeNotas},
  UConsultaNotas in '..\UConsultaNotas.pas' {fEntradaNotaConsulta},
  UDadosProduto in '..\UDadosProduto.pas' {fDadosDoProduto},
  UEntradaNumSerie in '..\UEntradaNumSerie.pas' {fEntradaNumSerie},
  UItemsEntradaNotas in '..\UItemsEntradaNotas.pas' {fEntradaNotasItems},
  UNFGrades in '..\UNFGrades.pas' {fEntradaGrades},
  UNovaEntradaNotas in '..\UNovaEntradaNotas.pas' {fNovaEntradaNota},
  UPedidoCompra in '..\UPedidoCompra.pas' {fPedidoCompra},
  UPedidoCompraItems in '..\UPedidoCompraItems.pas' {fPedidoCompraItems},
  USelecPedidoCompra in '..\USelecPedidoCompra.pas' {fSelecPedidoCompra},
  UCadGruposProdutos in '..\UCadGruposProdutos.pas' {fCadGruposProdutos},
  UConstVar in '..\UConstVar.pas',
  UFormModoExclusivo in '..\UFormModoExclusivo.pas' {fFormModoExclusivo},
  UModPesquisa in '..\UModPesquisa.PAS' {mPesq: TDataModule},
  UNovaContaAPagar in '..\UNovaContaAPagar.pas' {fNovaContaAPagar},
  UNovoProduto in '..\UNovoProduto.pas' {fNovoProduto},
  UPesqProduto in '..\UPesqProduto.pas' {fPesqProduto},
  UPesquisa in '..\UPesquisa.pas' {fPesquisa},
  UTabela in '..\UTabela.pas' {fTabela},
  UIni in '..\UIni.pas',
  UEntraCreditos in '..\UEntraCreditos.pas' {fEntraCreditos},
  UDataMod in 'UDataMod.pas' {DtM: TDataModule},
  UFrmAguarde in '..\UFrmAguarde.pas' {FrmAguarde},
  UComum in '..\UComum.pas' {CM: TDataModule},
  UCadFornecedores in '..\UCadFornecedores.pas',
  UCadSimilares in '..\UCadSimilares.pas',
  UEditaGrupoProduto in '..\UEditaGrupoProduto.pas' {fEditaGrupoProduto},
  UEstoquesDepositos in '..\UEstoquesDepositos.pas' {fEstoqueDepositos},
  UEstoquesGrades in '..\UEstoquesGrades.pas' {fEstoqueGrades},
  UExcluirGrupo in '..\UExcluirGrupo.pas' {fExcluirGrupo},
  UMostraFoto in '..\UMostraFoto.pas',
  UPrecosDoProduto in '..\UPrecosDoProduto.pas' {fPrecosDoProduto},
  UProdFornec in '..\UProdFornec.pas' {fProdFornec},
  UProdutosDoFornecedor in '..\UProdutosDoFornecedor.pas' {fProdutosDoFornecedor},
  USelecGrade in '..\USelecGrade.pas' {fSelecionaGrade},
  UCadastroPadrao in '..\UCadastroPadrao.pas' {fCadastroPadrao},
  UCadProdutos in '..\UCadProdutos.pas' {fCadProdutos},
  UMostraItensDaConta in '..\UMostraItensDaConta.pas' {fMostraItensDaConta},
  UAltEstoque in '..\UAltEstoque.pas' {fEstoqueSimples},
  UEditaGrade in '..\UEditaGrade.pas' {fEditaGrade},
  UNFAlteracao in '..\UNFAlteracao.pas' {fNFAlteracao},
  UTransfProdGrade in '..\UTransfProdGrade.pas' {fTransfProdGrade},
  UCadGrades in '..\UCadGrades.pas' {fCadGrades},
  UDiverso in '..\UDiverso.pas',
  UCadPrecosPromocionais in '..\UCadPrecosPromocionais.pas' {fCadPrecosPromocionais},
  UNumerosDeSerie in '..\UNumerosDeSerie.pas' {fNumerosDeSerie},
  USitNumSerie in '..\USitNumSerie.pas' {fSitNumSerie},
  UNumSerie in '..\UNumSerie.pas' {fNumSerie},
  UProcCampo in '..\UProcCampo.pas' {fProcCampo},
  UEditaProdFornec in '..\UEditaProdFornec.pas' {fEditaProdFornec},
  UBuscaXML in '..\UBuscaXML.pas' {fBuscaXML},
  UCadLocalizaFornecedor in '..\UCadLocalizaFornecedor.pas' {fCadLocalizaFornecedor},
  ULotesProduto in '..\ULotesProduto.pas' {FLotesItems};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDtM, DtM);
  Application.CreateForm(TfEntradasDeNotas, fEntradasDeNotas);
  Application.Run;
end.
