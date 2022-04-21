unit uFrmPesquisarProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uConexao,
  uProdutos, uFuncoes, uFrmConfigurarServidor, uFrmConexaoBD;

type
  TfrmPesquisarProduto = class(TForm)
    pnlFundo: TPanel;
    edtDescricao: TEdit;
    btnCancelar: TButton;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtDescricaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisarProduto: TfrmPesquisarProduto;

implementation
uses
uFrmProdutos;

{$R *.dfm}

procedure TfrmPesquisarProduto.btnCancelarClick(Sender: TObject);
begin
  frmProdutos.dsProdutos.DataSet := dmConexao.Produtos.fncGetProdutosGrid('');
  Close;
end;

procedure TfrmPesquisarProduto.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisarProduto.edtDescricaoChange(Sender: TObject);
begin
  frmProdutos.dsProdutos.DataSet := dmConexao.Produtos.fncGetProdutosGrid(edtDescricao.Text);
end;

end.
