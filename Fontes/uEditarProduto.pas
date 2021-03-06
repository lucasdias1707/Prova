unit uEditarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, uFrmProdutos, uConexao, uFrmConexaoBD, uFuncoes, uFrmGetCategoria;

type
  TfrmEditarProduto = class(TForm)
    dsProdutos: TDataSource;
    pnlFundo: TPanel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblPreco: TLabel;
    lblCategoria: TLabel;
    sbtPesquisarCategoria: TSpeedButton;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    btnConfirmar: TButton;
    edtPreco: TEdit;
    edtCategorias: TEdit;
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
  frmEditarProduto: TfrmEditarProduto;

implementation

{$R *.dfm}

uses uFrmGetCategoriasEditar;

procedure TfrmEditarProduto.btnConfirmarClick(Sender: TObject);
var
  Erro: string;
begin
  dmConexao.Produtos.DESCRICAO := edtDescricao.Text;
  dmConexao.Produtos.ID := StrToInt(edtCodigo.Text);
  dmConexao.Produtos.ID_CATEGORIA := StrToInt(edtCodigoCate.Text);
  dmConexao.Produtos.PRECO := StrToCurr(edtPreco.Text);

  if dmConexao.Produtos.fncEditarProduto('EDITAR', Erro) then
  begin

    fncCriarMensagem('EDITANDO DADOS', 'EDITAR PRODUTO',
      'Produto editado com sucesso, ', ExtractFilePath(Application.ExeName) +
      '\Icones\sucess.png', 'OK');
    Close;
  end
  else
  begin
    fncCriarMensagem('EDITANDO DADOS', 'ERRO AO EDITAR PRODUTO',
      'N?o foi poss?vel editar o produto, poss?vel causa: ' + Erro,
      ExtractFilePath(Application.ExeName) + '\Icones\alert.png', 'OK');
    edtDescricao.SetFocus;
  end;
end;

procedure TfrmEditarProduto.FormShow(Sender: TObject);
begin
  frmEditarProduto.edtCodigo.Text := frmProdutos.grdProdutos.DataSource.DataSet.Fields[0].Value;
  frmEditarProduto.edtDescricao.Text := frmProdutos.grdProdutos.DataSource.DataSet.Fields[1].Value;
  frmEditarProduto.edtCategorias.Text := frmProdutos.grdProdutos.DataSource.DataSet.Fields[2].Value;
  frmEditarProduto.edtPreco.Text := frmProdutos.grdProdutos.DataSource.DataSet.Fields[3].Value;
  edtDescricao.SetFocus;
end;

procedure TfrmEditarProduto.sbtPesquisarCategoriaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCategoriasEditar, frmCategoriasEditar);
  frmCategoriasEditar.ShowModal;
end;

end.
