unit EncounterConditionValueTest;

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
  EncounterConditionValue.Entity;

type

  [TestFixture]
  TEncounterConditionValueTest = class
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

procedure TEncounterConditionValueTest.Setup;
begin
  FPokeWrapper := TPokeWrapper<TEncounter>.Create;
end;

procedure TEncounterConditionValueTest.TestEntity;
var
  LEncounterConditionValueEntity: TEncounterConditionValueEntity;
begin
  Write('Testing TEncounter.encounter_condition_value .');
  for var I: integer := 1 to FList - 1 do
  begin
    LEncounterConditionValueEntity := nil;
    try
      LEncounterConditionValueEntity := TEncounterConditionValueEntity.Create;
      FPokeWrapper.GetAsEntity(LEncounterConditionValueEntity,
        integer(TEncounter.encounter_condition_value), I);
      // Assertions
      Assert.IsNotEmpty(LEncounterConditionValueEntity.condition.name);
      Assert.IsNotEmpty(LEncounterConditionValueEntity.condition.url);
      Assert.IsNotEmpty(LEncounterConditionValueEntity.id);
      Assert.IsNotEmpty(LEncounterConditionValueEntity.name);
      Assert.IsNotEmpty(LEncounterConditionValueEntity.names.Items
        [LEncounterConditionValueEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LEncounterConditionValueEntity.names.Items
        [LEncounterConditionValueEntity.names.Count - 1].language.url);
      Assert.IsNotEmpty(LEncounterConditionValueEntity.names.Items
        [LEncounterConditionValueEntity.names.Count - 1].name);
      Write('.');
    finally
      LEncounterConditionValueEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TEncounterConditionValueTest.TestEntityWillRaise;
var
  LEncounterConditionValueEntity: TEncounterConditionValueEntity;
begin
  LEncounterConditionValueEntity := nil;
  try
    LEncounterConditionValueEntity := TEncounterConditionValueEntity.Create;
    FPokeWrapper.GetAsEntity(LEncounterConditionValueEntity,
      integer(TEncounter.encounter_condition_value), 9999999);
  finally
    LEncounterConditionValueEntity.Free;
  end;
end;

procedure TEncounterConditionValueTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TEncounter.encounter_condition_value...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity
      (integer(TEncounter.encounter_condition_value));
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TEncounterConditionValueTest);

end.
