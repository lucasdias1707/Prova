unit uFrmCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, uConexao, uCategoria,
  uFrmConfigurarServidor, uFrmEditarCategoria,
  uFrmCadastrarCategoria, uFrmConexaoBD;

type
  TfrmCategoria = class(TForm)
    pnlFundo: TPanel;
    grdCategoria: TDBGrid;
    btnExcluir: TButton;
    btnIncluir: TButton;
    dsCategoria: TDataSource;
    btnEditar: TButton;
    btnPesquisar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure grdCategoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCategoria: TfrmCategoria;

implementation

{$R *.dfm}

uses uFrmPesquisarCategoria, uFrmProdutos;

procedure TfrmCategoria.btnEditarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmEditar, frmEditar);
  frmEditar.ShowModal;
end;

procedure TfrmCategoria.btnExcluirClick(Sender: TObject);
begin
  try
    if (NOT(grdCategoria.DataSource.DataSet.IsEmpty)) then
      dmConexao.Categoria.prcDeletar(grdCategoria.DataSource.DataSet.FieldByName
        ('ID').AsInteger);
  finally
    dsCategoria.DataSet := dmConexao.Categoria.fncGetCategoriasGrid('');
  end;
end;

procedure TfrmCategoria.btnIncluirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastrarCategoria, frmCadastrarCategoria);
  frmCadastrarCategoria.ShowModal;
end;

procedure TfrmCategoria.btnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesquisarCategoria, frmPesquisarCategoria);
  frmPesquisarCategoria.ShowModal;
end;

procedure TfrmCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmProdutos.dsProdutos.DataSet := dmConexao.Produtos.fncGetProdutosGrid('');
  action := caFree;
end;

procedure TfrmCategoria.FormCreate(Sender: TObject);
begin
  dmConexao.Categoria := TCategoria.Create(dmConexao.FDConnection);
  dsCategoria.DataSet := dmConexao.Categoria.fncGetCategoriasGrid('');
end;

procedure TfrmCategoria.grdCategoriaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (NOT(grdCategoria.DataSource.DataSet.IsEmpty)) AND (Key = VK_DELETE) then
    dmConexao.Categoria.prcDeletar(grdCategoria.DataSource.DataSet.FieldByName
      ('ID').AsInteger);
end;

end.
