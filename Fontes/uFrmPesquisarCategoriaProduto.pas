unit uFrmPesquisarCategoriaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPesquisarCategoriaProduto = class(TForm)
    pnlFundo: TPanel;
    edtCategoria: TEdit;
    btnCancelar: TButton;
    btnOk: TButton;
    procedure edtCategoriaChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisarCategoriaProduto: TfrmPesquisarCategoriaProduto;

implementation

{$R *.dfm}

uses uFrmProdutos, uFrmConexaoBD;

procedure TfrmPesquisarCategoriaProduto.btnCancelarClick(Sender: TObject);
begin
  frmProdutos.dsProdutos.DataSet := dmConexao.Produtos.fncGetProdutosGrid('');
  Close;
end;

procedure TfrmPesquisarCategoriaProduto.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisarCategoriaProduto.edtCategoriaChange(Sender: TObject);
begin
  frmProdutos.dsProdutos.DataSet := dmConexao.Produtos.fncFiltrarPorCategoria(edtCategoria.Text);
end;

end.
