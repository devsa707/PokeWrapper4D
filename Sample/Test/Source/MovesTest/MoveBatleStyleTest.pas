unit MoveBatleStyleTest;

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
  MoveBattleStyle.Entity;

type

  [TestFixture]
  TMoveBatleStyleTest = class
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

procedure TMoveBatleStyleTest.Setup;
begin
  FPokeWrapper := TPokeWrapper<TMove>.Create;
end;

procedure TMoveBatleStyleTest.TestEntity;
var
  LMoveBattleStyleEntity: TMoveBattleStyleEntity;
begin
  Write('Testing TMove.move_battle_style .');
  for var I: integer := 1 to FList - 1 do
  begin
    LMoveBattleStyleEntity := nil;
    try
      LMoveBattleStyleEntity := TMoveBattleStyleEntity.Create;
      FPokeWrapper.GetAsEntity(LMoveBattleStyleEntity,
        integer(TMove.move_battle_style), I);
      // Assertions
      Assert.IsNotEmpty(LMoveBattleStyleEntity.id);
      Assert.IsNotEmpty(LMoveBattleStyleEntity.name);
      // Node Names
      if LMoveBattleStyleEntity.names.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveBattleStyleEntity.names.Items[0].language.name);
        Assert.IsNotEmpty(LMoveBattleStyleEntity.names.Items[0].language.url);
        Assert.IsNotEmpty(LMoveBattleStyleEntity.names.Items[0].name);
      end;
      Write('.');
    finally
      LMoveBattleStyleEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TMoveBatleStyleTest.TestEntityWillRaise;
var
  LMoveBattleStyleEntity: TMoveBattleStyleEntity;
begin
  LMoveBattleStyleEntity := nil;
  try
    LMoveBattleStyleEntity := TMoveBattleStyleEntity.Create;
    FPokeWrapper.GetAsEntity(LMoveBattleStyleEntity,
      integer(TMove.move_battle_style), 9999999);
  finally
    LMoveBattleStyleEntity.Free;
  end;
end;

procedure TMoveBatleStyleTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TMove.move_battle_style...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity
      (integer(TMove.move_battle_style));
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TMoveBatleStyleTest);

end.
