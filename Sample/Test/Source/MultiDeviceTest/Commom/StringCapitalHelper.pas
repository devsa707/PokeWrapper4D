unit StringCapitalHelper;

interface

uses
  system.SysUtils,
  system.strutils;

function FirstLetterUpperCase(AValue: string): string;

implementation

function FirstLetterUpperCase(AValue: string): string;
begin
  Result := Uppercase(Copy(AValue, 1, 1)) + Lowercase(Copy(AValue, 2, Length(AValue)));
end;

end.
