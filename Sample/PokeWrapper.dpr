program PokeWrapper;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  PokeAPI.Interfaces in '..\Source\PokeAPI.Interfaces.pas',
  PokeAPI in '..\Source\PokeAPI.pas',
  PokeAPI.Resources in '..\Source\PokeAPI.Resources.pas',
  PokeAPI.Types in '..\Source\PokeAPI.Types.pas';

var
  FPokeAPI: IPokeAPI;

begin
  try
    IsConsole := True;
    FPokeAPI := TPokeAPIJson<TBerries>.Create('https://pokeapi.co/api/v2/');
    Writeln(FPokeAPI.Get(TBerries.berry_firmness, 1));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
