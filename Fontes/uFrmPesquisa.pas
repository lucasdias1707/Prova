unit uFrmPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPesquisa = class(TForm)
    pnlFundo: TPanel;
    btnProduto: TButton;
    btnCategoria: TButton;
    procedure btnProdutoClick(Sender: TObject);
    procedure btnCategoriaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

uses uFrmPesquisarProdutos, uFrmPesquisarCategoriaProduto;

procedure TfrmPesquisa.btnCategoriaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesquisarCategoriaProduto, frmPesquisarCategoriaProduto);
  frmPesquisarCategoriaProduto.ShowModal;
  Close;
end;

procedure TfrmPesquisa.btnProdutoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesquisarProduto, frmPesquisarProduto);
  frmPesquisarProduto.ShowModal;
  Close;
end;

end.
