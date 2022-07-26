unit LocationAreaTest;

interface

uses
  System.SysUtils,
  //
  DUnitX.TestFramework,
  // PokeAPI
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
  FPokeWrapper := TPokeWrapper<TLocation>.Create;
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
      FPokeWrapper.GetAsEntity(LLocationAreaEntity,
        integer(TLocation.location_area), I);
      // Assertions
      // node Nullable Encounter Method Rates
      if LLocationAreaEntity.encounter_method_rates.Count > 0 then
      begin
        Assert.IsNotEmpty(LLocationAreaEntity.encounter_method_rates.Items
          [LLocationAreaEntity.encounter_method_rates.Count - 1]
          .encounter_method.name);
        Assert.IsNotEmpty(LLocationAreaEntity.encounter_method_rates.Items
          [LLocationAreaEntity.encounter_method_rates.Count - 1]
          .encounter_method.url);

        // node Version Details of Encounter Method Rate
        if LLocationAreaEntity.encounter_method_rates.Items
          [LLocationAreaEntity.encounter_method_rates.Count - 1]
          .version_details.Count > 0 then
        begin
          Assert.IsNotEmpty(LLocationAreaEntity.encounter_method_rates.Items
            [LLocationAreaEntity.encounter_method_rates.Count - 1]
            .version_details.Items[1].rate);
          Assert.IsNotEmpty(LLocationAreaEntity.encounter_method_rates.Items
            [LLocationAreaEntity.encounter_method_rates.Count - 1]
            .version_details.Items[1].version.name);
          Assert.IsNotEmpty(LLocationAreaEntity.encounter_method_rates.Items
            [LLocationAreaEntity.encounter_method_rates.Count - 1]
            .version_details.Items[1].version.url);
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
      Assert.IsNotEmpty(LLocationAreaEntity.names.Items
        [LLocationAreaEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LLocationAreaEntity.names.Items
        [LLocationAreaEntity.names.Count - 1].language.url);
      // Name can return null value
      // Assert.IsNotEmpty(LLocationAreaEntity.names.Items
      // [LLocationAreaEntity.names.Count - 1].name);
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
    FPokeWrapper.GetAsEntity(LLocationAreaEntity,
      integer(TLocation.location_area), 9999999);
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
    LPokeListEntity := FPokeWrapper.GetAsListEntity
      (integer(TLocation.location_area));
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
