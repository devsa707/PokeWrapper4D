unit EncounterConditionTest;

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
  FPokeWrapper := TPokeFactory.New(TPokemon.encounter_condition);
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
      FPokeWrapper.GetAsEntity(LEncounterConditionEntity, I);
      // Assertions
      Assert.IsNotEmpty(LEncounterConditionEntity.id);
      Assert.IsNotEmpty(LEncounterConditionEntity.name);
      for var names in LEncounterConditionEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
      for var values in LEncounterConditionEntity.values do
      begin
        Assert.IsNotEmpty(values.name);
        Assert.IsNotEmpty(values.url);
      end;
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
    FPokeWrapper.GetAsEntity(LEncounterConditionEntity, 9999999);
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
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
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
