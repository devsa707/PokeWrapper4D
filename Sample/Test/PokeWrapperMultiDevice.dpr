program PokeWrapperMultiDevice;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main.Form in 'Source\MultiDeviceTest\Main.Form.pas' {MainForm},
  PokemonList.Frame in 'Source\MultiDeviceTest\Frames\Main\PokemonList.Frame.pas' {PokemonListFrame: TFrame},
  Ability.Entity in '..\..\Source\Entities\Pokemon\Ability.Entity.pas',
  Characteristic.Entity in '..\..\Source\Entities\Pokemon\Characteristic.Entity.pas',
  EggGroup.Entity in '..\..\Source\Entities\Pokemon\EggGroup.Entity.pas',
  Gender.Entity in '..\..\Source\Entities\Pokemon\Gender.Entity.pas',
  GrowthRate.Entity in '..\..\Source\Entities\Pokemon\GrowthRate.Entity.pas',
  Nature.Entity in '..\..\Source\Entities\Pokemon\Nature.Entity.pas',
  PokeathlonStat.Entity in '..\..\Source\Entities\Pokemon\PokeathlonStat.Entity.pas',
  Pokemon.Entity in '..\..\Source\Entities\Pokemon\Pokemon.Entity.pas',
  Pokemon.Generation.Node.Entity in '..\..\Source\Entities\Pokemon\Pokemon.Generation.Node.Entity.pas',
  PokemonColor.Entity in '..\..\Source\Entities\Pokemon\PokemonColor.Entity.pas',
  PokemonForm.Entity in '..\..\Source\Entities\Pokemon\PokemonForm.Entity.pas',
  PokemonHabitat.Entity in '..\..\Source\Entities\Pokemon\PokemonHabitat.Entity.pas',
  PokemonShape.Entity in '..\..\Source\Entities\Pokemon\PokemonShape.Entity.pas',
  PokemonSpecies.Entity in '..\..\Source\Entities\Pokemon\PokemonSpecies.Entity.pas',
  PokemonStat.Entity in '..\..\Source\Entities\Pokemon\PokemonStat.Entity.pas',
  PokemonType.Entity in '..\..\Source\Entities\Pokemon\PokemonType.Entity.pas',
  PokeFactory in '..\..\Source\Wrapper\PokeFactory.pas',
  PokeWrapper.Interfaces in '..\..\Source\Wrapper\PokeWrapper.Interfaces.pas',
  PokeWrapper in '..\..\Source\Wrapper\PokeWrapper.pas',
  PokeWrapper.Resources in '..\..\Source\Wrapper\PokeWrapper.Resources.pas',
  PokeWrapper.Types in '..\..\Source\Wrapper\PokeWrapper.Types.pas',
  Commons.Entities in '..\..\Source\Entities\Commons\Commons.Entities.pas',
  Move.Entity in '..\..\Source\Entities\Moves\Move.Entity.pas',
  MoveAilment.Entity in '..\..\Source\Entities\Moves\MoveAilment.Entity.pas',
  MoveBattleStyle.Entity in '..\..\Source\Entities\Moves\MoveBattleStyle.Entity.pas',
  MoveCategory.Entity in '..\..\Source\Entities\Moves\MoveCategory.Entity.pas',
  MoveDamageClass.Entity in '..\..\Source\Entities\Moves\MoveDamageClass.Entity.pas',
  MoveLearnMethod.Entity in '..\..\Source\Entities\Moves\MoveLearnMethod.Entity.pas',
  MoveTarget.Entity in '..\..\Source\Entities\Moves\MoveTarget.Entity.pas',
  PokeList.Entity in '..\..\Source\Entities\List\PokeList.Entity.pas',
  SVG.TypeIcons in 'Source\MultiDeviceTest\Icons\SVG.TypeIcons.pas',
  Pokemon.Types.Constants in 'Source\MultiDeviceTest\Icons\Pokemon.Types.Constants.pas',
  Json.Icons in 'Source\MultiDeviceTest\Icons\Json.Icons.pas',
  DataFinder.DB in 'Source\MultiDeviceTest\DataFinder.DB.pas' {DataFinder: TDataModule},
  PokemonList.Detail in 'Source\MultiDeviceTest\Frames\Detail\PokemonList.Detail.pas' {PokemonListDetail},
  PokemonFinder in 'Source\MultiDeviceTest\PokemonFinder.pas',
  StringCapitalHelper in 'Source\MultiDeviceTest\Commom\StringCapitalHelper.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;

end.
