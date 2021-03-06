unit uFrmProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, uConexao, uCategoria,
  uFrmConfigurarServidor, uFrmEditarCategoria,
  uFrmCadastrarCategoria, uFrmConexaoBD, uFrmCategoria, uProdutos,
  uFrmCadastrarProduto, uFrmCategoriaGrd;

type
  TfrmProdutos = class(TForm)
    pnlFundo: TPanel;
    pnlLinha: TPanel;
    lblTitulo: TLabel;
    btnFechar: TSpeedButton;
    grdProdutos: TDBGrid;
    edtExcluir: TButton;
    edtEditar: TButton;
    edtIncluir: TButton;
    edtPesquisar: TButton;
    btnCategorias: TButton;
    dsProdutos: TDataSource;
    pnlBotoes: TPanel;
    btnAtualizar: TButton;
    procedure btnFecharClick(Sender: TObject);
    procedure edtIncluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCategoriasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtExcluirClick(Sender: TObject);
    procedure edtPesquisarClick(Sender: TObject);
    procedure edtEditarClick(Sender: TObject);
    procedure edtFiltrarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation
uses
uFrmPesquisarProdutos, uEditarProduto, uFrmPesquisa;
{$R *.dfm}

procedure TfrmProdutos.btnAtualizarClick(Sender: TObject);
begin
  dsProdutos.DataSet := dmConexao.Produtos.fncGetProdutosGrid('');
end;

procedure TfrmProdutos.btnCategoriasClick(Sender: TObject);
begin
  frmCategoria := TfrmCategoria.Create(Self);
  frmCategoria.ShowModal;
end;

procedure TfrmProdutos.edtEditarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmEditarProduto, frmEditarProduto);
  frmEditarProduto.ShowModal;
end;

procedure TfrmProdutos.edtExcluirClick(Sender: TObject);
begin
  try
    if (NOT(grdProdutos.DataSource.DataSet.IsEmpty)) then
      dmConexao.Produtos.prcDeletar(grdProdutos.DataSource.DataSet.FieldByName
        ('ID').AsInteger);
  finally
    dsProdutos.DataSet := dmConexao.Produtos.fncGetProdutosGrid('');
  end;
end;

procedure TfrmProdutos.edtFiltrarClick(Sender: TObject);
begin
  frmCategoriasGrd := TfrmCategoriasGrd.Create(Self);
  frmCategoriasGrd.ShowModal;
end;

procedure TfrmProdutos.edtIncluirClick(Sender: TObject);
begin
  frmProduto := TfrmProduto.Create(Self);
  frmProduto.ShowModal;
end;

procedure TfrmProdutos.edtPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  frmPesquisa.ShowModal;
end;

procedure TfrmProdutos.FormActivate(Sender: TObject);
begin
  pnlFundo.left := Round ((frmProdutos.Width - pnlFundo.Width) / 2);
  pnlFundo.top  := Round ((frmProdutos.Height - pnlFundo.Height) / 2);
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  dmConexao.Produtos := TProdutos.Create(dmConexao.FDConnection);
  dsProdutos.DataSet := dmConexao.Produtos.fncGetProdutosGrid('');
end;

procedure TfrmProdutos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
