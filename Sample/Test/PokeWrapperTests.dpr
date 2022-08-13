program PokeWrapperTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}

uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  Berry.Entity in '..\..\Source\Entities\Berries\Berry.Entity.pas',
  BerryFirmness.Entity in '..\..\Source\Entities\Berries\BerryFirmness.Entity.pas',
  BerryFlavor.Entity in '..\..\Source\Entities\Berries\BerryFlavor.Entity.pas',
  ContestType.Entity in '..\..\Source\Entities\Contests\ContestType.Entity.pas',
  ContestTypeTest in 'Source\ContestTest\ContestTypeTest.pas',
  BerryFirmnessTest in 'Source\BerryTest\BerryFirmnessTest.pas',
  BerryFlavorTest in 'Source\BerryTest\BerryFlavorTest.pas',
  BerryTest in 'Source\BerryTest\BerryTest.pas',
  ContestEffect.Entity in '..\..\Source\Entities\Contests\ContestEffect.Entity.pas',
  ContestEffectTest in 'Source\ContestTest\ContestEffectTest.pas',
  SuperContestEffect.Entity in '..\..\Source\Entities\Contests\SuperContestEffect.Entity.pas',
  SuperContestEffectTest in 'Source\ContestTest\SuperContestEffectTest.pas',
  EncounterMethod.Entity in '..\..\Source\Entities\Encounters\EncounterMethod.Entity.pas',
  EncounterMethodTest in 'Source\EncounterTest\EncounterMethodTest.pas',
  EncounterCondition.Entity in '..\..\Source\Entities\Encounters\EncounterCondition.Entity.pas',
  EncounterConditionTest in 'Source\EncounterTest\EncounterConditionTest.pas',
  EncounterConditionValue.Entity in '..\..\Source\Entities\Encounters\EncounterConditionValue.Entity.pas',
  EncounterConditionValueTest in 'Source\EncounterTest\EncounterConditionValueTest.pas',
  EvolutionChain.Entity in '..\..\Source\Entities\Evolution\EvolutionChain.Entity.pas',
  EvolutionChainTest in 'Source\EvolutionTest\EvolutionChainTest.pas',
  EvolutionTrigger.Entity in '..\..\Source\Entities\Evolution\EvolutionTrigger.Entity.pas',
  PokeWrapper.Interfaces in '..\..\Source\Wrapper\PokeWrapper.Interfaces.pas',
  PokeWrapper in '..\..\Source\Wrapper\PokeWrapper.pas',
  PokeWrapper.Resources in '..\..\Source\Wrapper\PokeWrapper.Resources.pas',
  PokeWrapper.Types in '..\..\Source\Wrapper\PokeWrapper.Types.pas',
  EvolutionTriggerTest in 'Source\EvolutionTest\EvolutionTriggerTest.pas',
  Generation.Entity in '..\..\Source\Entities\Games\Generation.Entity.pas',
  GenerationTest in 'Source\GamesTest\GenerationTest.pas',
  Pokedex.Entity in '..\..\Source\Entities\Games\Pokedex.Entity.pas',
  PokedexTest in 'Source\GamesTest\PokedexTest.pas',
  Version.Entity in '..\..\Source\Entities\Games\Version.Entity.pas',
  VersionTest in 'Source\GamesTest\VersionTest.pas',
  VersionGroup.Entity in '..\..\Source\Entities\Games\VersionGroup.Entity.pas',
  VersionGroupTest in 'Source\GamesTest\VersionGroupTest.pas',
  Item.Entity in '..\..\Source\Entities\Items\Item.Entity.pas',
  ItemTest in 'Source\ItemsTest\ItemTest.pas',
  ItemAttribute.Entity in '..\..\Source\Entities\Items\ItemAttribute.Entity.pas',
  ItemAttributeTest in 'Source\ItemsTest\ItemAttributeTest.pas',
  ItemFlingEffect.Entity in '..\..\Source\Entities\Items\ItemFlingEffect.Entity.pas',
  ItemFlingEffectTest in 'Source\ItemsTest\ItemFlingEffectTest.pas',
  ItemPocket.Entity in '..\..\Source\Entities\Items\ItemPocket.Entity.pas',
  ItemPocketTest in 'Source\ItemsTest\ItemPocketTest.pas',
  Location.Entity in '..\..\Source\Entities\Locations\Location.Entity.pas',
  LocationTest in 'Source\LocationsTest\LocationTest.pas',
  LocationArea.Entity in '..\..\Source\Entities\Locations\LocationArea.Entity.pas',
  LocationAreaTest in 'Source\LocationsTest\LocationAreaTest.pas',
  PalParkArea.Entity in '..\..\Source\Entities\Locations\PalParkArea.Entity.pas',
  PalParkAreaTest in 'Source\LocationsTest\PalParkAreaTest.pas',
  Region.Entity in '..\..\Source\Entities\Locations\Region.Entity.pas',
  RegionTest in 'Source\LocationsTest\RegionTest.pas',
  Machine.Entity in '..\..\Source\Entities\Machines\Machine.Entity.pas',
  MachineTest in 'Source\MachinesTest\MachineTest.pas',
  Move.Entity in '..\..\Source\Entities\Moves\Move.Entity.pas',
  PokeList.Entity in '..\..\Source\Entities\List\PokeList.Entity.pas',
  Commons.Entities in '..\..\Source\Entities\Commons\Commons.Entities.pas',
  MoveTest in 'Source\MovesTest\MoveTest.pas',
  MoveAilment.Entity in '..\..\Source\Entities\Moves\MoveAilment.Entity.pas',
  MoveAilmentTest in 'Source\MovesTest\MoveAilmentTest.pas',
  MoveBattleStyle.Entity in '..\..\Source\Entities\Moves\MoveBattleStyle.Entity.pas',
  MoveBatleStyleTest in 'Source\MovesTest\MoveBatleStyleTest.pas',
  MoveCategory.Entity in '..\..\Source\Entities\Moves\MoveCategory.Entity.pas',
  MoveCategoryTest in 'Source\MovesTest\MoveCategoryTest.pas',
  MoveDamageClass.Entity in '..\..\Source\Entities\Moves\MoveDamageClass.Entity.pas',
  MoveDamageClassTest in 'Source\MovesTest\MoveDamageClassTest.pas',
  MoveLearnMethod.Entity in '..\..\Source\Entities\Moves\MoveLearnMethod.Entity.pas',
  MoveLearnMethodTest in 'Source\MovesTest\MoveLearnMethodTest.pas',
  MoveTarget.Entity in '..\..\Source\Entities\Moves\MoveTarget.Entity.pas',
  MoveTargetTest in 'Source\MovesTest\MoveTargetTest.pas',
  Ability.Entity in '..\..\Source\Entities\Pokemon\Ability.Entity.pas',
  AbilityTest in 'Source\PokemonTest\AbilityTest.pas',
  Characteristic.Entity in '..\..\Source\Entities\Pokemon\Characteristic.Entity.pas',
  CharacteristicTest in 'Source\PokemonTest\CharacteristicTest.pas',
  EggGroup.Entity in '..\..\Source\Entities\Pokemon\EggGroup.Entity.pas',
  EggGroupTest in 'Source\PokemonTest\EggGroupTest.pas',
  Gender.Entity in '..\..\Source\Entities\Pokemon\Gender.Entity.pas',
  GenderTest in 'Source\PokemonTest\GenderTest.pas',
  GrowthRate.Entity in '..\..\Source\Entities\Pokemon\GrowthRate.Entity.pas',
  GrowthRateTest in 'Source\PokemonTest\GrowthRateTest.pas',
  Nature.Entity in '..\..\Source\Entities\Pokemon\Nature.Entity.pas',
  NatureTest in 'Source\PokemonTest\NatureTest.pas',
  PokeathlonStat.Entity in '..\..\Source\Entities\Pokemon\PokeathlonStat.Entity.pas',
  PokeathlonStatTest in 'Source\PokemonTest\PokeathlonStatTest.pas',
  Pokemon.Entity in '..\..\Source\Entities\Pokemon\Pokemon.Entity.pas',
  Pokemon.Generation.Node.Entity in '..\..\Source\Entities\Pokemon\Pokemon.Generation.Node.Entity.pas';

{$R *.RES}
{$IFNDEF TESTINSIGHT}

var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger: ITestLogger;
{$ENDIF}

begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    ReportMemoryLeaksOnShutdown := True;
    // Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    // Create the test runner
    runner := TDUnitX.CreateRunner;
    // Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    // When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    // tell the runner how we will log things
    // Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create
        (TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    // Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create
      (TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    // Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

{$IFNDEF CI}
    // We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
{$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}

end.
