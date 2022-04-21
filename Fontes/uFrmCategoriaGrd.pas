unit uFrmCategoriaGrd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, uConexao, uCategoria, uFrmConexaoBD;

type
  TfrmCategoriasGrd = class(TForm)
    pnlFundo: TPanel;
    btnCancelar: TButton;
    btnOk: TButton;
    grdCategoria: TDBGrid;
    dsCategoria: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCategoriasGrd: TfrmCategoriasGrd;

implementation

{$R *.dfm}

uses uFrmProdutos;

procedure TfrmCategoriasGrd.btnOkClick(Sender: TObject);
Var
Descricao : String;
begin
  Descricao := frmCategoriasGrd.grdCategoria.DataSource.DataSet.Fields[0].Value;
  frmProdutos.dsProdutos.DataSet := dmConexao.Produtos.fncFiltrarPorCategoria(Descricao);
  Close;
end;

procedure TfrmCategoriasGrd.FormCreate(Sender: TObject);
begin
  dmConexao.Categoria := TCategoria.Create(dmConexao.FDConnection);
  dsCategoria.DataSet := dmConexao.Categoria.fncGetCategoriasGrid('');
end;

end.
