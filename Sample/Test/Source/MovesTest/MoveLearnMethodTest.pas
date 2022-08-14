unit MoveLearnMethodTest;

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
  MoveLearnMethod.Entity;

type

  [TestFixture]
  TMoveLearnMethodTest = class
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

procedure TMoveLearnMethodTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.move_learn_method));
end;

procedure TMoveLearnMethodTest.TestEntity;
var
  LMoveLearnMethodEntity: TMoveLearnMethodEntity;
begin
  Write('Testing TMove.move_learn_method .');
  for var I: integer := 1 to FList - 1 do
  begin
    LMoveLearnMethodEntity := nil;
    try
      LMoveLearnMethodEntity := TMoveLearnMethodEntity.Create;
      FPokeWrapper.GetAsEntity(LMoveLearnMethodEntity, I);
      // Assertions
      Assert.IsNotEmpty(LMoveLearnMethodEntity.id);
      Assert.IsNotEmpty(LMoveLearnMethodEntity.name);
      // Node Descriptions
      if LMoveLearnMethodEntity.descriptions.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveLearnMethodEntity.descriptions.Items[0].description);
        Assert.IsNotEmpty(LMoveLearnMethodEntity.descriptions.Items[0].language.name);
        Assert.IsNotEmpty(LMoveLearnMethodEntity.descriptions.Items[0].language.url);
      end;
      // Node Names
      if LMoveLearnMethodEntity.names.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveLearnMethodEntity.names.Items[0].name);
        Assert.IsNotEmpty(LMoveLearnMethodEntity.names.Items[0].language.name);
        Assert.IsNotEmpty(LMoveLearnMethodEntity.names.Items[0].language.url);
      end;
      // Node Names
      if LMoveLearnMethodEntity.version_groups.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveLearnMethodEntity.version_groups.Items[0].name);
        Assert.IsNotEmpty(LMoveLearnMethodEntity.version_groups.Items[0].url);
      end;
      Assert.IsNotEmpty(LMoveLearnMethodEntity.name);
      Write('.');
    finally
      LMoveLearnMethodEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TMoveLearnMethodTest.TestEntityWillRaise;
var
  LMoveLearnMethodEntity: TMoveLearnMethodEntity;
begin
  LMoveLearnMethodEntity := nil;
  try
    LMoveLearnMethodEntity := TMoveLearnMethodEntity.Create;
    FPokeWrapper.GetAsEntity(LMoveLearnMethodEntity, 9999999);
  finally
    LMoveLearnMethodEntity.Free;
  end;
end;

procedure TMoveLearnMethodTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TMove.move_learn_method...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TMoveLearnMethodTest);

end.
