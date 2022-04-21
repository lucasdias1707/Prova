unit uFrmEditarCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  uFrmConexaoBD, uConexao, uCategoria, uFrmCadastrarCategoria, uFuncoes;

type
  TfrmEditar = class(TForm)
    pnlFundo: TPanel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    btnConfirmar: TButton;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    dsCategoria: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditar: TfrmEditar;

implementation

uses
  uFrmCategoria;
{$R *.dfm}

procedure TfrmEditar.btnConfirmarClick(Sender: TObject);
var
  Numero: Integer; Erro: string;

begin
  Numero :=  frmCategoria.grdCategoria.DataSource.DataSet.
    Fields[0].Value;
  dmConexao.Categoria.DESCRICAO := edtDescricao.Text;
  dmConexao.Categoria.ID := Numero;

  if dmConexao.Categoria.fncEditarCategoria('EDITAR', Erro) then
  begin

    fncCriarMensagem('EDITANDO DADOS', 'EDITAR CATEGORIA',
      'Categoria editada com sucesso, ', ExtractFilePath(Application.ExeName) +
      '\Icones\sucess.png', 'OK');
    Close;
  end
  else
  begin
    fncCriarMensagem('EDITANDO DADOS', 'ERRO AO EDITAR CATEGORIA',
      'Não foi possível editar a categoria, possível causa: ' + Erro,
      ExtractFilePath(Application.ExeName) + '\Icones\alert.png', 'OK');
    edtDescricao.SetFocus;
  end;
end;

procedure TfrmEditar.FormShow(Sender: TObject);
begin
  frmEditar.edtCodigo.Text := frmCategoria.grdCategoria.DataSource.DataSet.
    Fields[0].Value;
  frmEditar.edtDescricao.Text := frmCategoria.grdCategoria.DataSource.DataSet.
    Fields[1].Value;
  edtDescricao.SetFocus;
end;

end.
