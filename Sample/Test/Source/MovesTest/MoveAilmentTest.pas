unit MoveAilmentTest;

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
  MoveAilment.Entity;

type

  [TestFixture]
  TMoveAilmentTest = class
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

procedure TMoveAilmentTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.move_ailment);
end;

procedure TMoveAilmentTest.TestEntity;
var
  LMoveAilmentEntity: TMoveAilmentEntity;
begin
  Write('Testing TMove.move_ailment .');
  for var I: integer := 1 to 9 do
  begin
    LMoveAilmentEntity := nil;
    try
      LMoveAilmentEntity := TMoveAilmentEntity.Create;
      FPokeWrapper.GetAsEntity(LMoveAilmentEntity, I);
      // Assertions
      Assert.IsNotEmpty(LMoveAilmentEntity.id);
      // Node Moves
      for var moves in LMoveAilmentEntity.moves do
      begin
        Assert.IsNotEmpty(moves.name);
        Assert.IsNotEmpty(moves.url);
      end;
      Assert.IsNotEmpty(LMoveAilmentEntity.name);
      // Node Names
      for var names in LMoveAilmentEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
      Write('.');
    finally
      LMoveAilmentEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TMoveAilmentTest.TestEntityWillRaise;
var
  LMoveAilmentEntity: TMoveAilmentEntity;
begin
  LMoveAilmentEntity := nil;
  try
    LMoveAilmentEntity := TMoveAilmentEntity.Create;
    FPokeWrapper.GetAsEntity(LMoveAilmentEntity, 9999999);
  finally
    LMoveAilmentEntity.Free;
  end;
end;

procedure TMoveAilmentTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TMove.move_ailment...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TMoveAilmentTest);

end.
