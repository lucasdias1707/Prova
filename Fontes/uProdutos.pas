unit uProdutos;

interface

uses FireDAC.Comp.Client, Vcl.Forms, FireDAC.Stan.Param;

type
  TProdutos = Class
  private
    FConexao: TFdConnection;
    FID: Integer;
    FDESCRICAO: String;
    FPRECO: Currency;
    FID_CATEGORIA: Integer;

  public
    Property Conexao: TFdConnection read FConexao write FConexao;
    Property ID: Integer read FID write FID;
    Property DESCRICAO: String read FDESCRICAO write FDESCRICAO;
    Property PRECO: Currency read FPRECO write FPRECO;
    Property ID_CATEGORIA: Integer read FID_CATEGORIA write FID_CATEGORIA;
    constructor Create(Conexao: TFdConnection);
    destructor Destroy; Override;
    function fncInserirProduto(TipoOperacao: String; out Erro: String): boolean;
    function fncEditarProduto(TipoOperacao: String; out Erro: String): boolean;
    function fncGetProdutosGrid(texto: String): TFDQuery;
    function fncFiltrarPorCategoria(texto: String): TFDQuery;
    procedure prcDeletar(id_chave: Integer);
  end;

var
  QryConsultaProduto: TFDQuery;

implementation

uses
  System.SysUtils, uFuncoes, Vcl.Dialogs;
{ TProdutos }

constructor TProdutos.Create(Conexao: TFdConnection);
begin
  FConexao := Conexao;
  QryConsultaProduto := TFDQuery.Create(nil);
  QryConsultaProduto.Connection := FConexao;
end;

destructor TProdutos.Destroy;
begin
  QryConsultaProduto.Destroy;
  inherited;
end;

function TProdutos.fncFiltrarPorCategoria(texto: String): TFDQuery;
begin
  with QryConsultaProduto do
    try
      FConexao.Connected := False;
      FConexao.Connected := True;
      Close;
      SQL.Clear;
      SQL.Add('SELECT P.ID, P.DESCRICAO, C.DESCRICAO AS CATEGORIA, P.PRECO FROM PRODUTOS P JOIN CATEGORIA C ON C.ID = P.ID_CATEGORIA WHERE C.DESCRICAO LIKE :pnome ORDER BY 1' );
      ParamByName('pnome').AsString := '%' + texto + '%';
      Open;
    finally
      Result := QryConsultaProduto;
    end;
end;

function TProdutos.fncGetProdutosGrid(texto: String): TFDQuery;
begin
  with QryConsultaProduto do
    try
      FConexao.Connected := False;
      FConexao.Connected := True;
      Close;
      SQL.Clear;
      SQL.Add('SELECT P.ID, P.DESCRICAO, C.DESCRICAO AS CATEGORIA, P.PRECO FROM PRODUTOS P JOIN CATEGORIA C ON C.ID = P.ID_CATEGORIA WHERE P.DESCRICAO LIKE :pnome ORDER BY 1' );
      ParamByName('pnome').AsString := '%' + texto + '%';
      Open;
    finally
      Result := QryConsultaProduto;
    end;
end;

function TProdutos.fncEditarProduto(TipoOperacao: String;
  out Erro: String): boolean;
var
  QryEditarProduto: TFDQuery;
begin
  try
    try
      FConexao.Connected := False;
      FConexao.Connected := True;

      QryEditarProduto := TFDQuery.Create(nil);
      QryEditarProduto.Connection := FConexao;

      QryEditarProduto.Close;
      QryEditarProduto.SQL.Clear;
      if TipoOperacao = 'EDITAR' then
      begin
        QryEditarProduto.SQL.Add
          ('UPDATE PRODUTOS SET DESCRICAO = :pdescricao, ID_CATEGORIA = :pid_categoria, PRECO = :ppreco  WHERE ID = :pid');
      end;
      QryEditarProduto.ParamByName('pid').AsInteger := FID;
      QryEditarProduto.ParamByName('pdescricao').AsString := FDESCRICAO;
      QryEditarProduto.ParamByName('ppreco').AsCurrency := FPRECO;
      QryEditarProduto.ParamByName('pid_categoria').AsInteger := FID_CATEGORIA;
      QryEditarProduto.ExecSql;

      Result := True;
      QryEditarProduto.Close;
      fncGetProdutosGrid('');
    except
      on E: Exception do
      begin
        Erro := E.Message;
        Result := False;
      end;
    end;
  finally
    QryEditarProduto.Destroy;
  end;
end;

function TProdutos.fncInserirProduto(TipoOperacao: String;
  out Erro: String): boolean;
var
  QryInserirProduto: TFDQuery;
begin
  try
    try
      FConexao.Connected := False;
      FConexao.Connected := True;
      QryInserirProduto := TFDQuery.Create(nil);
      QryInserirProduto.Connection := FConexao;

      QryInserirProduto.Close;
      QryInserirProduto.SQL.Clear;
      if TipoOperacao = 'INSERIR' then
      begin // INSERT
        QryInserirProduto.SQL.Add
          ('INSERT INTO PRODUTOS (ID,DESCRICAO,PRECO,ID_CATEGORIA) VALUES (:pid, :pdescricao, :ppreco, :pid_categoria)');
        QryInserirProduto.ParamByName('pid').AsInteger :=
          fncProximoCodigo('PRODUTOS', 'ID');
      end;
      QryInserirProduto.ParamByName('pdescricao').AsString := FDESCRICAO;
      QryInserirProduto.ParamByName('ppreco').AsCurrency := FPRECO;
      QryInserirProduto.ParamByName('pid_categoria').AsInteger := FID_CATEGORIA;
      QryInserirProduto.ExecSql;

      Result := True;
      QryInserirProduto.Close;
      fncGetProdutosGrid('');
    except
      on E: Exception do
      begin
        Erro := E.Message;
        Result := False;
      end;
    end;
  finally
    QryInserirProduto.Destroy;
  end;
end;

procedure TProdutos.prcDeletar(id_chave: Integer);
begin
  if fncCriarMensagem('Confirma??o', 'Excluir Dados',
    'Tem certeza que deseja EXCLUIR essa categoria?',
    ExtractFilePath(Application.ExeName) + '\Icones\alert.png', 'CONFIRMA') then
  begin
    FConexao.Connected := False;
    FConexao.Connected := True;
    FConexao.ExecSql('DELETE FROM PRODUTOS WHERE ID = :id_chave', [id_chave]);

    fncGetProdutosGrid('');
  end;
end;

// function TProdutos.fncPesquisarProduto(texto: String): TFDQuery;
// begin
// try
// FConexao.Connected := False;
// FConexao.Connected := True;
// QryConsultaProduto.Close;
// QryConsultaProduto.SQL.Clear;
// QryConsultaProduto.SQL.Add
// ('SELECT P.ID, P.DESCRICAO, C.DESCRICAO as CATEGORIA, P.PRECO FROM PRODUTOS P JOIN CATEGORIA C ON C.ID = P.ID_CATEGORIA WHERE P.DESCRICAO LIKE :pnome');
// QryConsultaProduto.ParamByName('pnome').AsString := '%' + texto + '%';
// QryConsultaProduto.Open;
// finally
// Result := QryConsultaProduto;
// end;
// end;
//
// function TProdutos.fncGetProdutosGrid(texto: String): TFDQuery;
// begin
// try
// FConexao.Connected := False;
// FConexao.Connected := True;
// QryConsultaProduto.Close;
// QryConsultaProduto.SQL.Clear;
// QryConsultaProduto.SQL.Add
// ('SELECT P.ID, P.DESCRICAO, C.DESCRICAO as CATEGORIA, P.PRECO FROM PRODUTOS P JOIN CATEGORIA C ON C.ID = P.ID_CATEGORIA');
// QryConsultaProduto.Open;
// finally
// Result := QryConsultaProduto;
// end;
// end;
//
// function TProdutos.fncFiltrarPorCategoria(texto: String): TFDQuery;
// begin
// try
// FConexao.Connected := False;
// FConexao.Connected := True;
// QryConsultaProduto.Close;
// QryConsultaProduto.SQL.Clear;
// QryConsultaProduto.SQL.Add
// ('SELECT P.ID, P.DESCRICAO, C.DESCRICAO, P.PRECO FROM PRODUTOS P JOIN CATEGORIA C ON C.ID = P.ID_CATEGORIA WHERE C.DESCRICAO LIKE :pnome');
// QryConsultaProduto.ParamByName('pnome').AsString := '%' + texto + '%';
// QryConsultaProduto.Open;
// finally
// Result := QryConsultaProduto;
// end;
// end;

end.
