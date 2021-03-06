unit uFrmGetCategoriasEditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, uCategoria, uConexao, uFrmEditarCategoria,
  uEditarProduto;

type
  TfrmCategoriasEditar = class(TForm)
    pnlFundo: TPanel;
    grdCategoria: TDBGrid;
    btnOk: TButton;
    btnCancelar: TButton;
    dsCategoria: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCategoriasEditar: TfrmCategoriasEditar;

implementation

{$R *.dfm}

uses uFrmCadastrarProduto, uFrmConexaoBD;

procedure TfrmCategoriasEditar.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCategoriasEditar.btnOkClick(Sender: TObject);
begin
  frmEditarProduto.edtCodigoCate.Text := frmCategoriasEditar.grdCategoria.DataSource.
    DataSet.Fields[0].Value;
  frmEditarProduto.edtCategorias.Text := frmCategoriasEditar.grdCategoria.DataSource.
    DataSet.Fields[1].Value;
  Close;
end;

procedure TfrmCategoriasEditar.FormCreate(Sender: TObject);
begin
  dmConexao.Categoria := TCategoria.Create(dmConexao.FDConnection);
  dsCategoria.DataSet := dmConexao.Categoria.fncGetCategoriasGrid('');
end;

end.
