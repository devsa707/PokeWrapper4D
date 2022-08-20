program PokeWrapperConsole;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  PokeWrapper.Interfaces in '..\Source\Wrapper\PokeWrapper.Interfaces.pas',
  PokeWrapper in '..\Source\Wrapper\PokeWrapper.pas',
  PokeWrapper.Resources in '..\Source\Wrapper\PokeWrapper.Resources.pas',
  PokeWrapper.Types in '..\Source\Wrapper\PokeWrapper.Types.pas',
  Berry.Entity in '..\Source\Entities\Berries\Berry.Entity.pas',
  Pokemon.Entity in '..\Source\Entities\Pokemon\Pokemon.Entity.pas',
  Commons.Entities in '..\Source\Entities\Commons\Commons.Entities.pas',
  Pokemon.Generation.Node.Entity in '..\Source\Entities\Pokemon\Pokemon.Generation.Node.Entity.pas',
  PokeList.Entity in '..\Source\Entities\List\PokeList.Entity.pas',
  PokeFactory in '..\Source\Wrapper\PokeFactory.pas';

var
  LPokemonEntity: TPokemonEntity;

begin
  LPokemonEntity := nil;
  try
    LPokemonEntity := TPokemonEntity.Create;
    ReportMemoryLeaksOnShutdown := True;
    Writeln('***********************************');
    Writeln('*****     PokeWrapper         *****');
    Writeln('*github.com/devsa707/PokeWrapper4D*');
    Writeln('***********************************');
    Writeln('');

    // <T> is the header value for search
    TPokeFactory.New(TPokemon.Pokemon).GetAsEntity(LPokemonEntity,'bulbasaur');
    Writeln('');
    Writeln('');
    // Get a list based on its enumerate

    Writeln(LPokemonEntity.abilities.Items[0].ability.name);
    Writeln(LPokemonEntity.abilities.Items[0].ability.url);
    Writeln(BoolToStr(LPokemonEntity.abilities.Items[0].is_hidden));
    Writeln(LPokemonEntity.abilities.Items[0].slot.ToString);
    Writeln(LPokemonEntity.base_experience.ToString);
    Writeln(LPokemonEntity.name);
    Writeln(LPokemonEntity.forms.Items[0].url);
    Writeln(LPokemonEntity.game_indices.Items[0].game_index.ToString);
    Writeln(LPokemonEntity.game_indices.Items[0].version.name);
    Writeln(LPokemonEntity.game_indices.Items[0].version.url);
    Writeln(LPokemonEntity.moves.Items[0].move.name);
    Writeln(LPokemonEntity.moves.Items[0].move.url);
    Writeln(LPokemonEntity.moves.Items[0].version_group_details.Items[0].move_learn_method.name);
    Writeln(LPokemonEntity.moves.Items[0].version_group_details.Items[0].move_learn_method.url);
    Writeln(LPokemonEntity.moves.Items[0].version_group_details.Items[0].version_group.name);
    Writeln(LPokemonEntity.moves.Items[0].version_group_details.Items[0].version_group.url);
    Writeln('');
    Writeln('');
    Writeln('***********************************');
    Writeln('***** PRESS ENTER TO CONTINUE *****');
    Writeln('***********************************');
    ReadLn;
  finally
    LPokemonEntity.Free;
  end;

end.
