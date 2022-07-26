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
  PokeList.Entity in '..\..\Source\List\PokeList.Entity.pas',
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
  LocationTest in 'Source\LocationsTest\LocationTest.pas';

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
