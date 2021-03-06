unit uFrmMensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TfrmMensagens = class(TForm)
    pnlFundo: TPanel;
    imgIcone: TImage;
    pnlLinha: TPanel;
    lblTituloJanela: TLabel;
    lblTituloMensagem: TLabel;
    memMensagem: TMemo;
    btnSim: TButton;
    btnNao: TButton;
    procedure btnNaoClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sTituloJanela, sTitutloMSG, sMSG, sCaminhoIcone, sTipo: String;
    bRespostaMSG: Boolean;
  end;

var
  frmMensagens: TfrmMensagens;

implementation

{$R *.dfm}

procedure TfrmMensagens.btnNaoClick(Sender: TObject);
begin
  bRespostaMSG := False;

  Close;
end;

procedure TfrmMensagens.btnSimClick(Sender: TObject);
begin
  bRespostaMSG := True;

  Close;
end;

procedure TfrmMensagens.FormActivate(Sender: TObject);
begin
  pnlFundo.left := Round((frmMensagens.Width - pnlFundo.Width) / 2);
  pnlFundo.top := Round((frmMensagens.Height - pnlFundo.Height) / 2);
end;

procedure TfrmMensagens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMensagens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSimClick(Self)
  else if Key = VK_ESCAPE then
    btnNaoClick(Self);
end;

procedure TfrmMensagens.FormShow(Sender: TObject);
begin
  bRespostaMSG := False;

  lblTituloJanela.Caption := sTituloJanela;
  lblTituloMensagem.Caption := sTitutloMSG;
  memMensagem.Lines.Strings[0] := sMSG;
  imgIcone.Picture.LoadFromFile(sCaminhoIcone);

  if sTipo = 'OK' then
  begin
    btnNao.Visible := False;
    btnSim.Caption := 'OK (ENTER)';
  end;
end;

end.
