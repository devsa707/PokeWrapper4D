unit MoveAilmentTest;

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
  FPokeWrapper := TPokeWrapper<TMove>.Create;
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
      FPokeWrapper.GetAsEntity(LMoveAilmentEntity,
        integer(TMove.move_ailment), I);
      // Assertions
      Assert.IsNotEmpty(LMoveAilmentEntity.id);
      // Node Moves
      if LMoveAilmentEntity.moves.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveAilmentEntity.moves.Items[0].name);
        Assert.IsNotEmpty(LMoveAilmentEntity.moves.Items[0].url);
      end;
      Assert.IsNotEmpty(LMoveAilmentEntity.name);
      // Node Names
      if LMoveAilmentEntity.names.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveAilmentEntity.names.Items[0].language.name);
        Assert.IsNotEmpty(LMoveAilmentEntity.names.Items[0].language.url);
        Assert.IsNotEmpty(LMoveAilmentEntity.names.Items[0].name);
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
    FPokeWrapper.GetAsEntity(LMoveAilmentEntity,
      integer(TMove.move_ailment), 9999999);
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
    LPokeListEntity := FPokeWrapper.GetAsListEntity
      (integer(TMove.move_ailment));
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
