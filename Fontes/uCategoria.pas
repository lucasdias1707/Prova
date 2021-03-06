unit uCategoria;

interface

uses FireDAC.Comp.Client, Vcl.Forms, FireDAC.Stan.Param;

type
  TCategoria = Class
  private
    FConexao: TFdConnection;
    FID: Integer;
    FDESCRICAO: String;

  public
    Property Conexao: TFdConnection read FConexao write FConexao;
    Property ID: Integer read FID write FID;
    Property DESCRICAO: String read FDESCRICAO write FDESCRICAO;
    constructor Create(Conexao: TFdConnection);
    destructor Destroy; Override;
    function fncInserirCategoria(TipoOperacao: String;
      out Erro: String): boolean;
    function fncEditarCategoria(TipoOperacao: String; out Erro: String)
      : boolean;
    function fncGetCategoriasGrid(texto: String): TFDQuery;
    function fncPesquisarCategoria(texto: String): TFDQuery;
    function fncGetIdCategoria(texto: String): Integer;
    procedure prcDeletar(id_chave: Integer);

  end;

var
  QryConsulta: TFDQuery;

implementation

uses
  System.SysUtils, uFuncoes;

{ TCategorias }
constructor TCategoria.Create(Conexao: TFdConnection);
begin
  FConexao := Conexao;
  QryConsulta := TFDQuery.Create(nil);
  QryConsulta.Connection := FConexao;
end;

destructor TCategoria.Destroy;
begin
  QryConsulta.Destroy;
  inherited;
end;

function TCategoria.fncGetIdCategoria(texto: String): Integer;
begin
  with QryConsulta do
  try
  FConexao.Connected := False;
  FConexao.Connected := True;
  Close;
  SQL.Clear;
  SQL.Add('SELECT ID AS ID FROM CATEGORIA WHERE DESCRICAO =:pnome');
  ParamByName('pnome').AsString := '' + texto + '';
  finally
  Result := FieldByName('ID').AsInteger;
  end;
end;

function TCategoria.fncGetCategoriasGrid(texto: String): TFDQuery;
begin
  with QryConsulta do
  try
    FConexao.Connected := False;
    FConexao.Connected := True;
    Close;
    SQL.Clear;
    SQL.Add('SELECT ID, DESCRICAO FROM CATEGORIA');
    Open;
  finally
    Result := QryConsulta;
  end;
end;

function TCategoria.fncPesquisarCategoria(texto: String): TFDQuery;
begin
  with QryConsulta do
  try
    FConexao.Connected := False;
    FConexao.Connected := True;
    Close;
    SQL.Clear;
    SQL.Add('SELECT ID, DESCRICAO FROM CATEGORIA WHERE DESCRICAO LIKE :pnome');
    ParamByName('pnome').AsString := '%' + texto + '%';
    Open;
  finally
    Result := QryConsulta;
  end;
end;

function TCategoria.fncEditarCategoria(TipoOperacao: String;
  out Erro: String): boolean;
var
  QryEditar: TFDQuery;
begin
  try
    try
      FConexao.Connected := False;
      FConexao.Connected := True;

      QryEditar := TFDQuery.Create(nil);
      QryEditar.Connection := FConexao;

      QryEditar.Close;
      QryEditar.SQL.Clear;
      if TipoOperacao = 'EDITAR' then
      begin
        QryEditar.SQL.Add
          ('UPDATE CATEGORIA SET DESCRICAO = :pdescricao WHERE ID = :pid');
      end;
      QryEditar.ParamByName('pid').AsInteger := FID;
      QryEditar.ParamByName('pdescricao').AsString := FDESCRICAO;
      QryEditar.ExecSql;

      Result := True;
      QryEditar.Close;
      fncGetCategoriasGrid('');
    except
      on E: Exception do
      begin
        Erro := E.Message;
        Result := False;
      end;
    end;
  finally
    QryEditar.Destroy;
  end;
end;

function TCategoria.fncInserirCategoria(TipoOperacao: String;
  out Erro: String): boolean;
var
  QryInserir: TFDQuery;
begin
  try
    try
      FConexao.Connected := False;
      FConexao.Connected := True;
      QryInserir := TFDQuery.Create(nil);
      QryInserir.Connection := FConexao;

      QryInserir.Close;
      QryInserir.SQL.Clear;
      if TipoOperacao = 'INSERIR' then
      begin // INSERT
        QryInserir.SQL.Add
          ('INSERT INTO CATEGORIA (ID,DESCRICAO) VALUES (:pid, :pdescricao)');
        QryInserir.ParamByName('pid').AsInteger :=
          fncProximoCodigo('CATEGORIA', 'ID');
      end;
      QryInserir.ParamByName('pdescricao').AsString := FDESCRICAO;
      QryInserir.ExecSql;

      Result := True;
      QryInserir.Close;
      fncGetCategoriasGrid('');
    except
      on E: Exception do
      begin
        Erro := E.Message;
        Result := False;
      end;
    end;
  finally
    QryInserir.Destroy;
  end;
end;

procedure TCategoria.prcDeletar(id_chave: Integer);
begin
  if fncCriarMensagem('Confirma??o', 'Excluir Dados',
    'Tem certeza que deseja EXCLUIR essa categoria?',
    ExtractFilePath(Application.ExeName) + '\Icones\alert.png', 'CONFIRMA') then
  begin
    FConexao.Connected := False;
    FConexao.Connected := True;
    FConexao.ExecSql('DELETE FROM CATEGORIA WHERE ID = :id_chave', [id_chave]);
    fncGetCategoriasGrid('');
  end;
end;

end.
