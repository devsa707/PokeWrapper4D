unit MoveTargetTest;

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
  MoveTarget.Entity;

type

  [TestFixture]
  TMoveTargetTest = class
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

procedure TMoveTargetTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.move_target);
end;

procedure TMoveTargetTest.TestEntity;
var
  LMoveTargetEntity: TMoveTargetEntity;
begin
  Write('Testing TMove.move_target .');
  for var I: integer := 1 to FList - 1 do
  begin
    LMoveTargetEntity := nil;
    try
      LMoveTargetEntity := TMoveTargetEntity.Create;
      FPokeWrapper.GetAsEntity(LMoveTargetEntity, I);
      // Assertions
      Assert.IsNotEmpty(LMoveTargetEntity.name);
      // Node Descriptions
      for var descriptions in LMoveTargetEntity.descriptions do
      begin
        Assert.IsNotEmpty(descriptions.description);
        Assert.IsNotEmpty(descriptions.language.name);
        Assert.IsNotEmpty(descriptions.language.url);
      end;
      // Node Moves
      for var moves in LMoveTargetEntity.moves do
      begin
        Assert.IsNotEmpty(moves.name);
        Assert.IsNotEmpty(moves.url);
      end;
      Assert.IsNotEmpty(LMoveTargetEntity.name);
      // Node Names
      for var names in LMoveTargetEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
      Write('.');
    finally
      LMoveTargetEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TMoveTargetTest.TestEntityWillRaise;
var
  LMoveTargetEntity: TMoveTargetEntity;
begin
  LMoveTargetEntity := nil;
  try
    LMoveTargetEntity := TMoveTargetEntity.Create;
    FPokeWrapper.GetAsEntity(LMoveTargetEntity, 9999999);
  finally
    LMoveTargetEntity.Free;
  end;
end;

procedure TMoveTargetTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TMove.move_target...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TMoveTargetTest);

end.
