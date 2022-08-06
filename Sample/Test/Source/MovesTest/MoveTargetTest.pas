unit MoveTargetTest;

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
  FPokeWrapper := TPokeWrapper<TMove>.Create;
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
      FPokeWrapper.GetAsEntity(LMoveTargetEntity,
        integer(TMove.move_target), I);
      // Assertions
      Assert.IsNotEmpty(LMoveTargetEntity.name);
      // Node Descriptions
      if LMoveTargetEntity.descriptions.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveTargetEntity.descriptions.Items[0].description);
        Assert.IsNotEmpty(LMoveTargetEntity.descriptions.Items[0]
          .language.name);
        Assert.IsNotEmpty(LMoveTargetEntity.descriptions.Items[0].language.url);
      end;
      // Node Moves
      if LMoveTargetEntity.moves.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveTargetEntity.moves.Items[0].name);
        Assert.IsNotEmpty(LMoveTargetEntity.moves.Items[0].url);
      end;
      Assert.IsNotEmpty(LMoveTargetEntity.name);
      // Node Names
      if LMoveTargetEntity.names.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveTargetEntity.names.Items[0].language.name);
        Assert.IsNotEmpty(LMoveTargetEntity.names.Items[0].language.url);
        Assert.IsNotEmpty(LMoveTargetEntity.names.Items[0].name);
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
    FPokeWrapper.GetAsEntity(LMoveTargetEntity,
      integer(TMove.move_target), 9999999);
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
    LPokeListEntity := FPokeWrapper.GetAsListEntity(integer(TMove.move_target));
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
