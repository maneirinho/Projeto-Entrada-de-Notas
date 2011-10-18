unit UBuscaXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvExMask, JvToolEdit, ExtCtrls, Buttons;

type
  TfBuscaXML = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    EditDirXML: TJvDirectoryEdit;
    Label1: TLabel;
    EditChaveNFE: TEdit;
    Panel2: TPanel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure EditChaveNFEChange(Sender: TObject);
  private
    procedure MudaCaption;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBuscaXML: TfBuscaXML;

implementation

Uses DUtilit, MessageFunctions, UConsultaListaNotas;

{$R *.dfm}

procedure TfBuscaXML.btnCancelarClick(Sender: TObject);
begin
  fEntradasDeNotas.ArquivoXML := '';
  close;
end;

procedure TfBuscaXML.btnOkClick(Sender: TObject);
var
  Lista: TStringList;
begin
  OpenDialog1.FileName := '';
  OpenDialog1.Title := 'Selecione a xml a importar';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Arquivos TXT (*.TXT)|*.TXT|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := LeStringINI(DiretorioDoExecutavel+'Focus.ini','Entrada de Notas','UltimoXMLImportado','C:\');

  if (not Vazio(EditChaveNFE.Text)) and (Length(EditChaveNFE.Text) = 44) then
  begin
    if Length(EditChaveNFE.Text) < 44 then
    begin
      MensagemDeErro('Chave deve ter 44 caracteres!');
      Exit;
    end;
    try
      lista := TStringList.Create;
      ProcuraArquivos(EditDirXML.Text + '\' + EditChaveNFE.Text + '*.xml',lista);
      if lista.Count > 0 then
        OpenDialog1.FileName := lista[0]
      else
      begin
        MensagemDeErro('XML não localizada, verifique a chave digitada ou tente manualmente.');
        lista.Free;
        Exit;
      end;
    finally
      lista.Free;
    end;
  end
  else
  begin
    if OpenDialog1.Execute then
    begin
      SalvaStringINI(DiretorioDoExecutavel+'Focus.ini','Entrada de Notas','UltimoXMLImportado',ExtractFilePath(OpenDialog1.FileName));
      EditChaveNFE.Text := Copy(ExtractFileName(OpenDialog1.FileName),1,44);
    end;
  end;
  if OpenDialog1.FileName = '' then
  begin
    Exit;
  end;
  SalvaStringINI(DiretorioDoExecutavel+'Focus.ini','Entrada de Notas','DirXML',EditDirXML.Text);
  fEntradasDeNotas.ArquivoXML := OpenDialog1.FileName;
  close;
end;

procedure TfBuscaXML.EditChaveNFEChange(Sender: TObject);
begin
  MudaCaption;
end;

procedure TfBuscaXML.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_F10   : if btnOk.Enabled then btnOk.Click;
    vk_Escape: if btnCancelar.Enabled then btnCancelar.Click;
  end;
end;

procedure TfBuscaXML.FormShow(Sender: TObject);
begin
  EditDirXML.Text := LeStringINI(DiretorioDoExecutavel+'Focus.ini','Entrada de Notas','DirXML','C:\');
  MudaCaption;
end;

procedure TfBuscaXML.MudaCaption;
begin
  if (not Vazio(EditChaveNFE.Text)) and (Length(EditChaveNFE.Text) = 44) then
    btnOk.Caption := 'OK - F10'
  else
    btnOk.Caption := 'Procurar - F10';
end;


end.
