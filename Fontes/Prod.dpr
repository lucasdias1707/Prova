program Prod;

uses
  Vcl.Forms,
  uFrmProdutos in 'uFrmProdutos.pas' {frmProdutos},
  uCategoria in 'uCategoria.pas',
  uFrmConexaoBD in 'uFrmConexaoBD.pas' {dmConexao: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  uConexao in 'uConexao.pas',
  uFrmMensagens in 'uFrmMensagens.pas' {frmMensagens},
  uFrmConfigurarServidor in 'uFrmConfigurarServidor.pas' {frmConfigurarServidor},
  System.SysUtils,
  uFrmCategoria in 'uFrmCategoria.pas' {frmCategoria},
  uFrmCadastrarProduto in 'uFrmCadastrarProduto.pas' {frmProduto},
  uFrmCadastrarCategoria in 'uFrmCadastrarCategoria.pas' {frmCadastrarCategoria},
  uFrmEditarCategoria in 'uFrmEditarCategoria.pas' {frmEditar},
  uFrmPesquisarCategoria in 'uFrmPesquisarCategoria.pas' {frmPesquisarCategoria},
  uProdutos in 'uProdutos.pas',
  uFrmPesquisarProdutos in 'uFrmPesquisarProdutos.pas' {frmPesquisarProduto},
  uFrmGetCategoria in 'uFrmGetCategoria.pas' {frmCategorias},
  uEditarProduto in 'uEditarProduto.pas' {frmEditarProduto},
  uFrmGetCategoriasEditar in 'uFrmGetCategoriasEditar.pas' {frmCategoriasEditar},
  uFrmCategoriaGrd in 'uFrmCategoriaGrd.pas' {frmCategoriasGrd},
  uFrmPesquisa in 'uFrmPesquisa.pas' {frmPesquisa},
  uFrmPesquisarCategoriaProduto in 'uFrmPesquisarCategoriaProduto.pas' {frmPesquisarCategoriaProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  //Application.CreateForm(TForm1, Form1);
  if dmConexao.Conexao.fncConectarBancoDados then
  begin
    Application.CreateForm(TfrmProdutos, frmProdutos);
    Application.Run;
  end
  else
  begin
    fncCriarMensagem('CONEXÃO AO BANCO DE DADOS',
                       'ERRO AO CONECTAR AO BANCO DE DADOS',
                       'Não foi possível se conectar ao banco de dados, possível causa: ' +
                       dmConexao.Conexao.MsgErro,
                       ExtractFilePath (Application.ExeName) + '\Icones\alert.png',
                       'OK');
    Application.CreateForm(TFrmConfigurarServidor, frmConfigurarServidor);
    frmConfigurarServidor.ShowModal;
  end;
end.
