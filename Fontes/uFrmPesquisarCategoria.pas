unit uFrmPesquisarCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uConexao,
  uCategoria, uFrmConfigurarServidor, uFrmConexaoBD, uFrmCategoria;

type
  TfrmPesquisarCategoria = class(TForm)
    pnlFundo: TPanel;
    edtDescricao: TEdit;
    btnCancelar: TButton;
    btnOk: TButton;
    procedure edtDescricaoChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CategoriaConsulta: TCategoria;
  end;

var
  frmPesquisarCategoria: TfrmPesquisarCategoria;

implementation
 uses
uFrmProdutos;
{$R *.dfm}



procedure TfrmPesquisarCategoria.btnCancelarClick(Sender: TObject);
begin
  frmCategoria.dsCategoria.DataSet := dmConexao.Categoria.fncGetCategoriasGrid('');
  Close;
end;

procedure TfrmPesquisarCategoria.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisarCategoria.edtDescricaoChange(Sender: TObject);
begin
  frmCategoria.dsCategoria.DataSet := dmConexao.Categoria.fncPesquisarCategoria(edtDescricao.Text);
end;

end.
