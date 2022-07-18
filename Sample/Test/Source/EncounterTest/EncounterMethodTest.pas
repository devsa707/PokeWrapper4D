unit EncounterMethodTest;

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
  EncounterMethod.Entity;

type

  [TestFixture]
  TEncounterMethodTest = class
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

procedure TEncounterMethodTest.Setup;
begin
  FPokeWrapper := TPokeWrapper<TEncounter>.Create;
end;

procedure TEncounterMethodTest.TestEntity;
var
  LEncounterMethodEntity: TEncounterMethodEntity;
begin
  Write('Testing TEncounter.encounter_method .');
  for var I: integer := 1 to FList - 1 do
  begin
    LEncounterMethodEntity := nil;
    try
      LEncounterMethodEntity := TEncounterMethodEntity.Create;
      FPokeWrapper.GetAsEntity(LEncounterMethodEntity,
        integer(TEncounter.encounter_method), I);
      // Assertions
      Assert.IsNotEmpty(LEncounterMethodEntity.id);
      Assert.IsNotEmpty(LEncounterMethodEntity.name);
      Assert.IsNotEmpty(LEncounterMethodEntity.names.Items
        [LEncounterMethodEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LEncounterMethodEntity.names.Items
        [LEncounterMethodEntity.names.Count - 1].language.url);
      Assert.IsNotEmpty(LEncounterMethodEntity.names.Items
        [LEncounterMethodEntity.names.Count - 1].name);
      Assert.IsNotEmpty(LEncounterMethodEntity.order);
      Write('.');
    finally
      LEncounterMethodEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TEncounterMethodTest.TestEntityWillRaise;
var
  LEncounterMethodEntity: TEncounterMethodEntity;
begin
  LEncounterMethodEntity := nil;
  try
    LEncounterMethodEntity := TEncounterMethodEntity.Create;
    FPokeWrapper.GetAsEntity(LEncounterMethodEntity,
      integer(TEncounter.encounter_method), 9999999);
  finally
    LEncounterMethodEntity.Free;
  end;
end;

procedure TEncounterMethodTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TEncounter.encounter_method...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity
      (integer(TEncounter.encounter_method));
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TEncounterMethodTest);

end.
