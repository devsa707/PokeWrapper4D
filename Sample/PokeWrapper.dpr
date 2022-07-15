program PokeWrapper;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  PokeAPI.Interfaces in '..\Source\API\PokeAPI.Interfaces.pas',
  PokeAPI in '..\Source\API\PokeAPI.pas',
  PokeAPI.Resources in '..\Source\API\PokeAPI.Resources.pas',
  PokeAPI.Types in '..\Source\API\PokeAPI.Types.pas',
  PokeList.Entity in '..\Source\List\PokeList.Entity.pas';

var
  FPokeAPI: IPokeAPI;
  FPokeListEntity: TPokeListEntity;

begin
  FPokeListEntity := nil;
  try
    ReportMemoryLeaksOnShutdown := True;
    Writeln('***********************************');
    Writeln('*****     PokeWrapper         *****');
    Writeln('*github.com/devsa707/PokeWrapper4D*');
    Writeln('***********************************');
    Writeln('');

    FPokeAPI := TPokeAPIJson<TPokemon>.Create;
    Writeln(FPokeAPI.Get(integer(pokemon), 1));
    Writeln('');
    Writeln('');

    FPokeListEntity := FPokeAPI.GetAsListEntity(integer(pokemon));
    for var I := 0 to FPokeListEntity.results.Count - 1 do
    begin
      Writeln(FPokeListEntity.results.Items[I].name);
      Writeln(FPokeListEntity.results.Items[I].url);
    end;
    Writeln('***********************************');
    Writeln('***** PRESS ENTER TO CONTINUE *****');
    Writeln('***********************************');
    ReadLn;
  finally
    FPokeListEntity.Free;
  end;

end.
