unit uFrmCadastrarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, uFuncoes, uConexao, uFrmConexaoBD, uProdutos, Data.DB,
  uCategoria,
  uFrmConfigurarServidor, Vcl.Buttons, uFrmGetCategoria;

type
  TfrmProduto = class(TForm)
    pnlFundo: TPanel;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblDescricao: TLabel;
    edtDescricao: TEdit;
    lblPreco: TLabel;
    lblCategoria: TLabel;
    btnConfirmar: TButton;
    dsProdutos: TDataSource;
    edtPreco: TEdit;
    edtCategorias: TEdit;
    sbtPesquisarCategoria: TSpeedButton;
    edtCodigoCate: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure sbtPesquisarCategoriaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.dfm}

procedure TfrmProduto.btnConfirmarClick(Sender: TObject);
var
  Erro: string;
begin
  dmConexao.Produtos.PRECO := StrToCurr(edtPreco.Text);
  dmConexao.Produtos.DESCRICAO := edtDescricao.Text;
  dmconexao.Produtos.ID_CATEGORIA := StrToInt(edtCodigoCate.Text);
  if dmConexao.Produtos.fncInserirProduto('INSERIR', Erro) then
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

procedure TfrmProduto.FormShow(Sender: TObject);
begin
  Var
    Numero: Integer;
  begin
    Numero := fncProximoCodigo('PRODUTOS', 'ID');
    edtCodigo.Text := IntToStr(Numero);
    edtDescricao.SetFocus;
  end;
end;

procedure TfrmProduto.sbtPesquisarCategoriaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCategorias, frmCategorias);
  frmCategorias.ShowModal;
end;

end.
