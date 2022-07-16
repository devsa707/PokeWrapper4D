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
  PokeAPI.Interfaces in '..\..\Source\API\PokeAPI.Interfaces.pas',
  PokeAPI in '..\..\Source\API\PokeAPI.pas',
  PokeAPI.Resources in '..\..\Source\API\PokeAPI.Resources.pas',
  PokeAPI.Types in '..\..\Source\API\PokeAPI.Types.pas',
  Berry.Entity in '..\..\Source\Entities\Berries\Berry.Entity.pas',
  PokeList.Entity in '..\..\Source\List\PokeList.Entity.pas',
  BerryTest in 'Source\BerryTest.pas',
  BerryFirmness.Entity in '..\..\Source\Entities\Berries\BerryFirmness.Entity.pas',
  BerryFirmnessTest in 'Source\BerryFirmnessTest.pas';

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
