unit uFuncoes;

interface

uses
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.SysUtils,
  Vcl.Mask, FireDAC.Stan.Param;

function fncProximoCodigo(Tabela, Campo: String): integer;
function fncCriarMensagem(TituloJanela, TituloMSG, MSG, Icone,
  Tipo: String): boolean;

implementation

uses
  FireDAC.Comp.Client, uFrmConexaoBD, uCategoria, uFrmMensagens;

function fncProximoCodigo(Tabela, Campo: String): integer;

var
  QryConsulta: TFDQuery;
begin
  Result := 1;
  try
    dmConexao.FdConnection.Connected := False;
    dmConexao.FdConnection.Connected := True;

    QryConsulta := TFDQuery.Create(nil);
    QryConsulta.Connection := dmConexao.FdConnection;

    QryConsulta.Close;

    QryConsulta.SQL.Clear;
    QryConsulta.SQL.Add('SELECT MAX ( ' + Campo + ' ) AS CODIGO FROM '
      + Tabela);
    QryConsulta.Open;

    if QryConsulta.FieldByName('CODIGO').AsString <> '' then
      Result := QryConsulta.FieldByName('CODIGO').AsInteger + 1;
//      CLOSE;
  finally
    QryConsulta.Destroy;
  end;
end;

function fncCriarMensagem(TituloJanela, TituloMSG, MSG, Icone,
  Tipo: String): boolean;
begin
  frmMensagens := TfrmMensagens.Create(Nil);
  frmMensagens.sTituloJanela := TituloJanela;
  frmMensagens.sTitutloMSG := TituloMSG;
  frmMensagens.sMSG := MSG;
  frmMensagens.sCaminhoIcone := Icone;
  frmMensagens.sTipo := Tipo;
  frmMensagens.ShowModal;
  Result := frmMensagens.bRespostaMSG;
end;

end.
