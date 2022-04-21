unit uFormatar;

interface

uses System.SysUtils, FMX.Edit, Classes, System.MaskUtils;

type
    TFormato = (Valor);

procedure Formatar(Obj: TObject; Formato : TFormato; Extra : string = '');

implementation

function SomenteNumero(str : string) : string;
var
    x : integer;
begin
    Result := '';
    for x := 0 to Length(str) - 1 do
        if (str.Chars[x] In ['0'..'9']) then
            Result := Result + str.Chars[x];
end;

function FormataValor(str : string) : string;
begin
    if Str = '' then
        Str := '0';

    try
        Result := FormatFloat('#,##0.00', strtofloat(str) / 100);
    except
        Result := FormatFloat('#,##0.00', 0);
    end;
end;

procedure Formatar(Obj: TObject; Formato : TFormato; Extra : string = '');
var
    texto : string;
begin
    begin
        if Formato = Valor then
            texto := FormataValor(SomenteNumero(texto));
    end;
end;

end.
