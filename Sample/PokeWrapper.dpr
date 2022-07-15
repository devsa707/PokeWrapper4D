program PokeWrapper;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  PokeAPI.Interfaces in '..\Source\API\PokeAPI.Interfaces.pas',
  PokeAPI in '..\Source\API\PokeAPI.pas',
  PokeAPI.Resources in '..\Source\API\PokeAPI.Resources.pas',
  PokeAPI.Types in '..\Source\API\PokeAPI.Types.pas';

var
  FPokeAPI: IPokeAPI;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    Writeln('***********************************');
    Writeln('*****     PokeWrapper         *****');
    Writeln('*github.com/devsa707/PokeWrapper4D*');
    Writeln('***********************************');
    Writeln('');

    FPokeAPI := TPokeAPIJson<TPokemon>.Create;
    Writeln(FPokeAPI.Get(integer(pokeathlon_stat), 1));
    Writeln('');
    Writeln('');
    Writeln(FPokeAPI.List(integer(pokeathlon_stat)));

    Writeln('***********************************');
    Writeln('***** PRESS ENTER TO CONTINUE *****');
    Writeln('***********************************');
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
