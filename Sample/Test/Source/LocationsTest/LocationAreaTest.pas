unit LocationAreaTest;

interface

uses
  System.SysUtils,
  //
  DUnitX.TestFramework,
  // PokeAPI
  PokeFactory,
  PokeWrapper,
  PokeWrapper.Interfaces,
  PokeWrapper.Types,
  //
  PokeList.Entity,
  LocationArea.Entity;

type

  [TestFixture]
  TLocationAreaTest = class
  private
    FPokeWrapper: IPokeWrapper;
    FList: integer;
  public
    [Setup]
    procedure Setup;
    [Test]
    procedure TestList;
    [Test]
    procedure TestEntity;
    procedure TestEntityWillRaise;
  end;

implementation

procedure TLocationAreaTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.location_area);
end;

procedure TLocationAreaTest.TestEntity;
var
  LLocationAreaEntity: TLocationAreaEntity;
begin
  Write('Testing TLocation.location_area .');
  for var I: integer := 1 to 20 do
  begin
    LLocationAreaEntity := nil;
    try
      LLocationAreaEntity := TLocationAreaEntity.Create;
      FPokeWrapper.GetAsEntity(LLocationAreaEntity, I);
      // Assertions
      // node Nullable Encounter Method Rates
      for var encounter_method_rates in LLocationAreaEntity.encounter_method_rates do
      begin

        Assert.IsNotEmpty(encounter_method_rates.encounter_method.name);
        Assert.IsNotEmpty(encounter_method_rates.encounter_method.url);

        // node Version Details of Encounter Method Rate
        for var version_details in encounter_method_rates.version_details do
        begin
          Assert.IsNotEmpty(version_details.rate);
          Assert.IsNotEmpty(version_details.version.name);
          Assert.IsNotEmpty(version_details.version.url);
        end;
      end;
      Assert.IsNotEmpty(LLocationAreaEntity.game_index);
      Assert.IsNotEmpty(LLocationAreaEntity.id);
      // Node Location
      Assert.IsNotEmpty(LLocationAreaEntity.location.name);
      Assert.IsNotEmpty(LLocationAreaEntity.location.url);
      //
      Assert.IsNotEmpty(LLocationAreaEntity.name);
      // Node Languages
      for var names in LLocationAreaEntity.names do
      begin
        // Assert.IsNotEmpty(names.name);
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
      end;
      Write('.');
    finally
      LLocationAreaEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TLocationAreaTest.TestEntityWillRaise;
var
  LLocationAreaEntity: TLocationAreaEntity;
begin
  LLocationAreaEntity := nil;
  try
    LLocationAreaEntity := TLocationAreaEntity.Create;
    FPokeWrapper.GetAsEntity(LLocationAreaEntity, 9999999);
  finally
    LLocationAreaEntity.Free;
  end;
end;

procedure TLocationAreaTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TLocation.location_area...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TLocationAreaTest);

end.
