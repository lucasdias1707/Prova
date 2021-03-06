unit uFrmCadastrarCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uConexao, uCategoria, uFuncoes, Data.DB,
  uFrmConexaoBD, uFrmConfigurarServidor, uFrmPesquisarProdutos;

type
  TfrmCadastrarCategoria = class(TForm)
    pnlFundo: TPanel;
    btnConfirmar: TButton;
    dsCategoria: TDataSource;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    lblDescricao: TLabel;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrarCategoria: TfrmCadastrarCategoria;

implementation

{$R *.dfm}

procedure TfrmCadastrarCategoria.btnConfirmarClick(Sender: TObject);
var
  Erro: string;

begin
  dmConexao.Categoria.DESCRICAO := edtDescricao.Text;

  if dmConexao.Categoria.fncInserirCategoria('INSERIR', Erro) then
  begin

    fncCriarMensagem('INSERINDO DADOS', 'CADASTRAR NOVA CATEGORIA',
      'Cadastro realizado com sucesso, ', ExtractFilePath(Application.ExeName) +
      '\Icones\sucess.png', 'OK');
    Close;
  end
  else
  begin
    fncCriarMensagem('INSERINDO DADOS', 'ERRO AO CADASTRAR NOVA CATEGORIA',
      'N?o foi poss?vel cadastrar a categoria, poss?vel causa: ' + Erro,
      ExtractFilePath(Application.ExeName) + '\Icones\alert.png', 'OK');
    edtDescricao.SetFocus;
  end;
end;

procedure TfrmCadastrarCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsCategoria.DataSet := dmConexao.Categoria.fncGetCategoriasGrid('');
end;

procedure TfrmCadastrarCategoria.FormShow(Sender: TObject);
Var
  Numero: Integer;
begin

  Numero := fncProximoCodigo('CATEGORIA', 'ID');
  edtCodigo.Text := IntToStr(Numero);
  edtDescricao.SetFocus;
end;

end.
