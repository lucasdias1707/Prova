unit uFrmGetCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmCategorias = class(TForm)
    pnlFundo: TPanel;
    grdCategoria: TDBGrid;
    dsCategoria: TDataSource;
    btnOk: TButton;
    btnCancelar: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCategorias: TfrmCategorias;

implementation

Uses
  uFrmCadastrarProduto, uFrmConexaoBD, uFrmEditarCategoria, uCategoria, uEditarProduto;
{$R *.dfm}

procedure TfrmCategorias.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCategorias.btnOkClick(Sender: TObject);
begin
  frmProduto.edtCodigoCate.Text := frmCategorias.grdCategoria.DataSource.
    DataSet.Fields[0].Value;
  frmProduto.edtCategorias.Text := frmCategorias.grdCategoria.DataSource.
    DataSet.Fields[1].Value;
  Close;
end;

procedure TfrmCategorias.FormCreate(Sender: TObject);
begin
  dmConexao.Categoria := TCategoria.Create(dmConexao.FDConnection);
  dsCategoria.DataSet := dmConexao.Categoria.fncGetCategoriasGrid('');
end;

procedure TfrmCategorias.FormShow(Sender: TObject);
begin
  dsCategoria.DataSet := dmConexao.Categoria.fncGetCategoriasGrid('');
end;

end.
