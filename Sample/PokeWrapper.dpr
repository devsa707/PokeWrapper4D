program PokeWrapper;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  PokeAPI.Interfaces in '..\Source\PokeAPI.Interfaces.pas';

var
  FPokeAPI: IPokeAPI;

begin
  try
    IsConsole := True;
    FPokeAPI := TPokeAPIJson.Create('https://pokeapi.co/api/v2/');

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
