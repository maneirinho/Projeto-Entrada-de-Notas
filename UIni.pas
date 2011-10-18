unit UIni;

interface

// PARA NOVAS CHAVES/VALORES:
// Incluir na Estrutura Record e Incluir na procedure "PegaChavesINI";

uses IniFiles;

type
  // Tipo Básico de CAMPO
  TCampo = record
    Chave : String;
    Valor : String;
    Tipo  : char; // String; Integer; Boolean; Float, Date; Timestamp
  end;


  // ******** VALORES *********
  TValoresVariaveis = Record
    Chave                : String; // * Básico
    UltimoLoginPDV       : TCampo;
    UltimoLoginGer       : TCampo;
    TipoDescontoUnitario : TCampo;
    TipoDescontoTotal    : TCampo;
    StatusPDV            : TCampo;
    UltimoCFOP           : TCampo;
    DescontoOuAcrescimo  : TCampo;
    TipoDocumentoAberto  : TCampo;
    TipoPrecoAberto      : TCampo;
    UltimoDocumentoPDV   : TCampo;
    UltimoDocumentoGER   : TCampo;
    ModoX                : TCampo;
  end;

  TValoresConfigLocais = Record
    Chave                 : String; // * Básico
    BancoDeDados          : TCampo;
    NumTerminal           : TCampo;
    MultiplasInstancias   : TCampo;
  end;

  TValoresConfigForms = Record
    Chave                  : String; // * Básico
    FAT_DAV_PV_AutoImp     : TCampo;
    FAT_DAV_PV_UltimoDoc   : TCampo;
    FAT_DAV_PV_RefDias     : TCampo;
    FAT_DAV_PV_ExibirDAV   : TCampo;
    FAT_DAV_PV_ExibirPV    : TCampo;
    CAIXA_Atual_Fechado    : TCampo;
    CAIXA_FECH_TPConsulta  : TCampo;
    CAIXA_FECH_Terminal    : TCampo;
    CAIXA_FECH_Agrupado    : TCampo;
    CAIXA_FECH_Periodo     : TCampo;
    CAIXA_ATUAL_TPConsulta : TCampo;
    CAIXA_ATUAL_Terminal   : TCampo;
    CAIXA_ATUAL_Agrupado   : TCampo;
  end;

  TValoresPesquisa = Record
    Chave                 : String; // * Básico
    PROD_Vinculado        : TCampo;
    PROD_Incremental      : TCampo;
    PROD_Composta         : TCampo;
    PROD_AbrirUltAcesso   : TCampo;
    PROD_DetectarCampo    : TCampo;
    PROD_MultiplosCampos  : TCampo;
    PROD_UltimoPesquisado : TCampo;
    PROD_UltimoSelecionado: TCampo;
  end;

  TValoresSincFocus = Record
    Chave                : String; // * Básico
    Intervalo            : TCampo;
    Modo                 : TCampo;
    NaoImportar          : TCampo;
    NaoExportar          : TCampo;
    UltimaSinc           : TCampo;
  end;


  // ******** CHAVES *********

  TChaves = Record
    Variaveis    : TValoresVariaveis;
    ConfigLocais : TValoresConfigLocais;
    SincFocus    : TValoresSincFocus;
    Pesquisa     : TValoresPesquisa;
    ConfigForms  : TValoresConfigForms;
  end;

var
  eINI : TChaves;
  Ini  : TIniFile;
  INIFocus : String;

  function  LeIni(liCampo:TCampo; liDefault:Variant):variant;
  procedure GravaIni(liCampo:TCampo; liValor:Variant);
  procedure PegaChavesINI;


implementation

uses DUtilit;

procedure AssociaChavesINI(var acCampo:TCampo; acChave, acValor:String; acTipo:char);
begin
  acCampo.Chave := acChave;
  acCampo.Valor := acValor;
  acCampo.Tipo  := acTipo;
end;

procedure PegaChavesINI;
var
  ch : String;
begin
  INIFocus   := PathComBarra(DiretorioDoExecutavel)+'Focus.ini';
  if Ini = nil then Ini := TIniFile.Create(INIFocus);
  ch := 'VARIAVEIS';
  eINI.Variaveis.Chave := ch;
  AssociaChavesINI(eINI.Variaveis.UltimoLoginPDV,       ch, 'UltimoLoginPDV',        'S');
  AssociaChavesINI(eINI.Variaveis.UltimoLoginGER,       ch, 'UltimoLoginGER',        'S');
  AssociaChavesINI(eINI.Variaveis.TipoDescontoUnitario, ch, 'TipoDescontoUnitario',  'C');
  AssociaChavesINI(eINI.Variaveis.TipoDescontoTotal,    ch, 'TipoDescontoTotal',     'C');
  AssociaChavesINI(eINI.Variaveis.StatusPDV,            ch, 'StatusPDV',             'C');
  AssociaChavesINI(eINI.Variaveis.UltimoCFOP,           ch, 'UltimoCFOP',            'S');
  AssociaChavesINI(eINI.Variaveis.DescontoOuAcrescimo,  ch, 'DescontoOuAcrescimo',   'C');
  AssociaChavesINI(eINI.Variaveis.TipoDocumentoAberto,  ch, 'TipoDocumentoAberto',   'C');
  AssociaChavesINI(eINI.Variaveis.TipoPrecoAberto,      ch, 'TipoPrecoAberto',       'I');
  AssociaChavesINI(eINI.Variaveis.UltimoDocumentoPDV,   ch, 'UltimoDocumentoPDV',    'S');
  AssociaChavesINI(eINI.Variaveis.UltimoDocumentoGER,   ch, 'UltimoDocumentoGER',    'S');
  AssociaChavesINI(eINI.Variaveis.ModoX,                ch, 'X',                     'I');

  ch := 'CONFIGURACOES';
  eINI.ConfigLocais.Chave := ch;
  AssociaChavesINI(eINI.ConfigLocais.BancoDeDados,        ch, 'BancoDeDados',        'S');
  AssociaChavesINI(eINI.ConfigLocais.NumTerminal,         ch, 'NumTerminal',         'I');
  AssociaChavesINI(eINI.ConfigLocais.MultiplasInstancias, ch, 'MultiplasInstancias', 'B');

  ch := 'CONFIGFORMS';
  eINI.ConfigForms.Chave := ch;
  AssociaChavesINI(eINI.ConfigForms.FAT_DAV_PV_UltimoDoc,    ch, 'FAT_DAV_PV_UltimoDoc',   'I');
  AssociaChavesINI(eINI.ConfigForms.FAT_DAV_PV_RefDias,      ch, 'FAT_DAV_PV_RefDias',     'I');
  AssociaChavesINI(eINI.ConfigForms.FAT_DAV_PV_AutoImp,      ch, 'FAT_DAV_PV_AutoImp',     'B');
  AssociaChavesINI(eINI.ConfigForms.FAT_DAV_PV_ExibirDAV,    ch, 'FAT_DAV_PV_ExibirDAV',   'B');
  AssociaChavesINI(eINI.ConfigForms.FAT_DAV_PV_ExibirPV,     ch, 'FAT_DAV_PV_ExibirPV',    'B');
  AssociaChavesINI(eINI.ConfigForms.CAIXA_Atual_Fechado,     ch, 'CAIXA_Atual_Fechado',    'I');
  AssociaChavesINI(eINI.ConfigForms.CAIXA_FECH_TPConsulta,   ch, 'CAIXA_FECH_TPConsulta',  'I');
  AssociaChavesINI(eINI.ConfigForms.CAIXA_FECH_Terminal,     ch, 'CAIXA_FECH_Terminal',    'I');
  AssociaChavesINI(eINI.ConfigForms.CAIXA_FECH_Agrupado,     ch, 'CAIXA_FECH_Agrupado',    'B');
  AssociaChavesINI(eINI.ConfigForms.CAIXA_FECH_Periodo,      ch, 'CAIXA_FECH_Periodo',     'I');
  AssociaChavesINI(eINI.ConfigForms.CAIXA_ATUAL_TPConsulta,  ch, 'CAIXA_ATUAL_TPConsulta', 'I');
  AssociaChavesINI(eINI.ConfigForms.CAIXA_ATUAL_Terminal,    ch, 'CAIXA_ATUAL_Terminal',   'I');
  AssociaChavesINI(eINI.ConfigForms.CAIXA_ATUAL_Agrupado,    ch, 'CAIXA_ATUAL_Agrupado',   'B');

  ch := 'PESQUISA';
  eINI.Pesquisa.Chave := ch;
  AssociaChavesINI(eINI.Pesquisa.PROD_Vinculado,         ch, 'PROD_Vinculado',         'B');
  AssociaChavesINI(eINI.Pesquisa.PROD_Incremental,       ch, 'PROD_Incremental',       'B');
  AssociaChavesINI(eINI.Pesquisa.PROD_Composta,          ch, 'PROD_Composta',          'B');
  AssociaChavesINI(eINI.Pesquisa.PROD_AbrirUltAcesso,    ch, 'PROD_AbrirUltAcesso',    'B');
  AssociaChavesINI(eINI.Pesquisa.PROD_DetectarCampo,     ch, 'PROD_DetectarCampo',     'B');
  AssociaChavesINI(eINI.Pesquisa.PROD_MultiplosCampos,   ch, 'PROD_MultiplosCampos',   'B');
  AssociaChavesINI(eINI.Pesquisa.PROD_UltimoPesquisado,  ch, 'PROD_UltimoPesquisado',  'S');
  AssociaChavesINI(eINI.Pesquisa.PROD_UltimoSelecionado, ch, 'PROD_UltimoSelecionado', 'S');

  ch := 'SINCFOCUS';
  eINI.SincFocus.Chave := ch;
  AssociaChavesINI(eINI.SincFocus.Intervalo,    ch, 'Intervalo',             'I');
  AssociaChavesINI(eINI.SincFocus.Modo,         ch, 'SincModo',              'I');
  AssociaChavesINI(eINI.SincFocus.NaoImportar,  ch, 'NaoImportar',           'B');
  AssociaChavesINI(eINI.SincFocus.NaoExportar,  ch, 'NaoExportar',           'B');
  AssociaChavesINI(eINI.SincFocus.UltimaSinc,   ch, 'UltimaSinc',            'S');
end;

function LeIni(liCampo:TCampo; liDefault:Variant):variant;
var
  S : string;
begin
  case liCampo.Tipo of
    'S': result := ini.ReadString(liCampo.Chave, liCampo.Valor, liDefault);
    'I': result := ini.ReadInteger(liCampo.Chave, liCampo.Valor, liDefault);
    'B': result := ini.ReadBool(liCampo.Chave, liCampo.Valor, liDefault);
    'D': result := ini.ReadDate(liCampo.Chave, liCampo.Valor, liDefault);
    'T': result := ini.ReadDateTime(liCampo.Chave, liCampo.Valor, liDefault);
    'C': begin
           S := ini.ReadString(liCampo.Chave, liCampo.Valor, liDefault);
           if length(S) = 0 then Result := liDefault
                            else Result := S[1];
         end;
  end;
end;

procedure GravaIni(liCampo:TCampo; liValor:Variant);
begin
  case liCampo.Tipo of
    'S': ini.WriteString(liCampo.Chave, liCampo.Valor, liValor);
    'I': ini.WriteInteger(liCampo.Chave, liCampo.Valor, liValor);
    'B': ini.WriteBool(liCampo.Chave, liCampo.Valor, liValor);
    'D': ini.WriteDate(liCampo.Chave, liCampo.Valor, liValor);
    'T': ini.WriteDateTime(liCampo.Chave, liCampo.Valor, liValor);
    'C': ini.WriteString(liCampo.Chave, liCampo.Valor, liValor);
  end;
end;

end.
