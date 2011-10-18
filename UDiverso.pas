unit UDiverso;

interface

uses
  Dialogs, Controls, Forms, Graphics, Classes, SysUtils;

Const
// Valores Principais
  NomeDaEmpresa      = 'Focus';

type
  TGrid = (tpGrid1, tpGrid2, tpGrid3, tpEscolher);
  TQualSistema = (qsGER, qsPAF, qsPDV, qsSinc);

  RegEtiquetas = record
    Cod       : String[4];
    Descricao : String[100];
    Categoria : char;
  end;

  TEsteSistema = Record
    QualSistema : TQualSistema;
    NomeDoSistema : String;
    DescricaoAbreviada : string;
  end;

procedure CarregaModelosDeEtiquetas;
procedure PegaDadosDoSistema;

var
// Variáveis de Configuração
  cfgLogotipo             : String[100];
  cfgLogotipoPB           : String[100];

// Variáveis Gerais
  Sist : TEsteSistema;

  ChaveDoModulo: String;
  CategoriaRelatEscolhido : Word;

  TaConcluindoVenda : boolean;
  CodigoDoFornecedor : String;
  CodigoDaMercadoria : String;
  FornecedorVinculado: Integer;
  VetEtiquetas : Array of RegEtiquetas;
  ECFAtivado : Boolean;


implementation


procedure IncluiModeloEtiqueta(ieCod:String; ieDescricao:String; ieCategoria:char);
begin
  SetLength(VetEtiquetas, length(VetEtiquetas)+1);
  VetEtiquetas[length(VetEtiquetas)-1].Cod := ieCod;
  VetEtiquetas[length(VetEtiquetas)-1].Descricao := ieDescricao;
  VetEtiquetas[length(VetEtiquetas)-1].categoria := ieCategoria;
end;

procedure CarregaModelosDeEtiquetas;
begin
  SetLength(VetEtiquetas, 0);
  IncluiModeloEtiqueta('PG01', 'PG01 - Etiquetas de Gôndola 1 (Com rodapé)', 'P');
  IncluiModeloEtiqueta('PG02', 'PG02 - Etiquetas de Gôndola 2 (Sem rodapé)', 'P');
  IncluiModeloEtiqueta('PE01', 'PE01 - Etiquetas Pimaco A4249 / A4349 1,5 x 2,6', 'P');
  IncluiModeloEtiqueta('PE02', 'PE02 - Etiquetas Pimaco A4251 / A4351 2,12 x 3,82', 'P');
  IncluiModeloEtiqueta('PE91', 'PE91 - Etiquetas de Código de Barras 1,5 x 2,7 (Contínuo)', 'P');
  IncluiModeloEtiqueta('PE92', 'PE92 - Etiquetas de Código de Barras 1,5 x 5,1 (Contínuo)', 'P');
end;

procedure PegaDadosDoSistema;
begin
  with Sist do
  begin
    case QualSistema of
      qsGER :
      begin
        NomeDoSistema := 'Focus - Sistema de Automação Comercial';
        DescricaoAbreviada := 'Gerenciador';
      end;
      qsPAF :
      begin
        NomeDoSistema := 'Focus PAF-ECF';
        DescricaoAbreviada := 'PAF-ECF';
      end;
      qsPDV :
      begin
        NomeDoSistema := 'Focus - PDV';
        DescricaoAbreviada := 'PDV';
      end;
      qsSinc :
      begin
        NomeDoSistema := 'Focus - Sincronizador';
        DescricaoAbreviada := 'Sincronizador';
      end;
    end;
  end;  
end;

end.
