unit uConexao;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Intf, System.SysUtils, System.IniFiles,
  Vcl.Forms, uFuncoes;

type
  TConexao = Class
  private
    FServidor: String;
    FMsgErro: String;
    FBase: String;
    FConexao: TFDConnection;

  public
    constructor Create(NomeConexao: TFDConnection);
    destructor Destroy; override;

    function fncConectarBancoDados: boolean;
    procedure prcGravarArquivoINI;
    function fncLerArquivoINI: boolean;

    property Conexao: TFDConnection Read FConexao Write FConexao;
    property Servidor: String Read FServidor Write FServidor;
    property Base: String Read FBase Write FBase;
    property MsgErro: String Read FMsgErro Write FMsgErro;
  End;

implementation

{ TConexao }

constructor TConexao.Create(NomeConexao: TFDConnection);
begin
  FConexao := NomeConexao;
end;

destructor TConexao.Destroy;
begin
  FConexao.Connected := False;
  inherited;
end;

function TConexao.fncConectarBancoDados: boolean;
begin
  Result := True;

  FConexao.Params.Clear;

  if not fncLerArquivoINI then
  begin
    Result := False;
    FMsgErro := 'O arquivo de configura??o n?o foi encontrado!';
  end
  else
  begin
    FConexao.Params.Add('Server=' + FServidor);
    FConexao.Params.Add('Database=' + FBase);
    FConexao.Params.Add('DriverID=' + 'FB');
    FConexao.Params.Add('User_Name=' + 'SYSDBA');
    FConexao.Params.Add('Password=' + 'masterkey');
    try
      FConexao.Connected := True;
    Except
      on e: Exception do
      begin
        FMsgErro := e.Message;
        Result := False;
      end;
    end;
  end;

end;

procedure TConexao.prcGravarArquivoINI;
var
  IniFile: String;
  Ini: TiniFile;
begin

  IniFile := ChangeFileExt(Application.Exename, '.ini');
  Ini := TiniFile.Create(IniFile);

  try
    Ini.WriteString('Configuracao', 'Servidor', FServidor);
    Ini.WriteString('Configuracao', 'Base', FBase);
  finally
    Ini.Free;
  end;
end;

function TConexao.fncLerArquivoINI: boolean;
var
  IniFile: String;
  Ini: TiniFile;

begin

  IniFile := ChangeFileExt(Application.Exename, '.ini');
  Ini := TiniFile.Create(IniFile);

  if fileexists(IniFile) then
    Result := False
  else
  begin

  end;
  try
    FServidor := Ini.ReadString('Configuracao', 'Servidor', '');
    FBase := Ini.ReadString('Configuracao', 'Base', '');
  finally
    Result := True;
    Ini.Free;
  end;

end;

end.
