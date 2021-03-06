unit uFrmConfigurarServidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, uFrmMensagens, uConexao;

type
  TfrmConfigurarServidor = class(TForm)
    pnlFundo: TPanel;
    pnlTopo: TPanel;
    imgIconeDB: TImage;
    lblTitulo: TLabel;
    lblInformacao: TLabel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    pnlConfiguracaoNova: TPanel;
    lblConfiguracaoNova: TLabel;
    pnlLinhaNova: TPanel;
    lblCaminhoBDNovo: TLabel;
    edtCaminhoNovo: TEdit;
    lblIPHOSTNovo: TLabel;
    edtIPHOSTNAMENovo: TEdit;
    pnlConfiguraoAtual: TPanel;
    lblConfiguracaoAtual: TLabel;
    pnlLinhaAtual: TPanel;
    lblCaminhoBDAtual: TLabel;
    lblIPHOSTAtual: TLabel;
    edtIPHOSTNAMEAtual: TEdit;
    edtCaminhoAtual: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigurarServidor: TfrmConfigurarServidor;

implementation

{$R *.dfm}

uses uFuncoes, uFrmConexaoBD;

procedure TfrmConfigurarServidor.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfigurarServidor.btnConfirmarClick(Sender: TObject);
begin

  dmConexao.Conexao.Servidor := edtIPHOSTNAMENovo.Text;
  dmConexao.Conexao.Base := edtCaminhoNovo.Text;
  dmConexao.Conexao.prcGravarArquivoINI;

  if dmConexao.Conexao.fncConectarBancoDados then
  begin

    fncCriarMensagem('CONEX?O AO BANCO DE DADOS', 'CONECTADO AO BANCO DE DADOS',
      'Conex?o com o banco de dados realizada com sucesso, ' +
      'o sistema deve ser reiniciado!', ExtractFilePath(Application.ExeName) +
      '\Icones\sucess.png', 'OK');
    Application.Terminate;
  end
  else
  begin
    fncCriarMensagem('CONEX?O AO BANCO DE DADOS',
      'ERRO AO CONECTAR AO BANCO DE DADOS',
      'N?o foi poss?vel se conectar ao banco de dados, poss?vel causa: ' +
      dmConexao.Conexao.MsgErro, ExtractFilePath(Application.ExeName) +
      '\Icones\alert.png', 'OK');
    edtCaminhoNovo.SetFocus;
  end;
end;


procedure TfrmConfigurarServidor.FormShow(Sender: TObject);
begin
  if dmConexao.Conexao.fncLerArquivoINI then
  begin
    edtIPHOSTNAMEAtual.Text := dmConexao.Conexao.Servidor;
    edtCaminhoAtual.Text := dmConexao.Conexao.Base;
  end;
end;

end.
