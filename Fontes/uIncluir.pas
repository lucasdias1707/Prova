unit uIncluir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  uFrmCategoria, uFrmCadastrarProduto, uCategoria, uConexao, uFrmConexaoBD;

type
  TfrmIncluir = class(TForm)
    pnlFundo: TPanel;
    btnCategoria: TButton;
    btnProduto: TButton;
    procedure sbtFecharClick(Sender: TObject);
    procedure btnCategoriaClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncluir: TfrmIncluir;

implementation

{$R *.dfm}

procedure TfrmIncluir.btnCategoriaClick(Sender: TObject);
begin
  Close;
  frmCategoria := TfrmCategoria.Create(Self);
  frmCategoria.ShowModal;
end;

procedure TfrmIncluir.btnProdutoClick(Sender: TObject);
begin
  frmProduto := TfrmProduto.Create(Self);
  frmProduto.ShowModal;
  Close;
end;

procedure TfrmIncluir.sbtFecharClick(Sender: TObject);
begin
  Close;
end;

end.
