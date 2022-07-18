unit EncounterConditionTest;

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
  EncounterCondition.Entity;

type

  [TestFixture]
  TEncounterConditionTest = class
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

procedure TEncounterConditionTest.Setup;
begin
  FPokeWrapper := TPokeWrapper<TEncounter>.Create;
end;

procedure TEncounterConditionTest.TestEntity;
var
  LEncounterConditionEntity: TEncounterConditionEntity;
begin
  Write('Testing TEncounter.enconter_condition .');
  for var I: integer := 1 to FList - 1 do
  begin
    LEncounterConditionEntity := nil;
    try
      LEncounterConditionEntity := TEncounterConditionEntity.Create;
      FPokeWrapper.GetAsEntity(LEncounterConditionEntity,
        integer(TEncounter.encounter_condition), I);
      // Assertions
      Assert.IsNotEmpty(LEncounterConditionEntity.id);
      Assert.IsNotEmpty(LEncounterConditionEntity.name);
      Assert.IsNotEmpty(LEncounterConditionEntity.names.Items
        [LEncounterConditionEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LEncounterConditionEntity.names.Items
        [LEncounterConditionEntity.names.Count - 1].language.url);
      Assert.IsNotEmpty(LEncounterConditionEntity.names.Items
        [LEncounterConditionEntity.names.Count - 1].name);
      Assert.IsNotEmpty(LEncounterConditionEntity.values.Items
        [LEncounterConditionEntity.values.Count - 1].name);
      Assert.IsNotEmpty(LEncounterConditionEntity.values.Items
        [LEncounterConditionEntity.values.Count - 1].url);
      Write('.');
    finally
      LEncounterConditionEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TEncounterConditionTest.TestEntityWillRaise;
var
  LEncounterConditionEntity: TEncounterConditionEntity;
begin
  LEncounterConditionEntity := nil;
  try
    LEncounterConditionEntity := TEncounterConditionEntity.Create;
    FPokeWrapper.GetAsEntity(LEncounterConditionEntity,
      integer(TEncounter.encounter_condition), 9999999);
  finally
    LEncounterConditionEntity.Free;
  end;
end;

procedure TEncounterConditionTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TEncounter.enconter_condition...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity
      (integer(TEncounter.encounter_condition));
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TEncounterConditionTest);

end.
