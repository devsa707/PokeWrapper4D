unit MoveDamageClassTest;

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
  MoveDamageClass.Entity;

type

  [TestFixture]
  TMoveDamageClassTest = class
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

procedure TMoveDamageClassTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.move_damage_class);
end;

procedure TMoveDamageClassTest.TestEntity;
var
  LMoveDamageClassEntity: TMoveDamageClassEntity;
begin
  Write('Testing TMove.move_damage_class .');
  for var I: integer := 1 to FList - 1 do
  begin
    LMoveDamageClassEntity := nil;
    try
      LMoveDamageClassEntity := TMoveDamageClassEntity.Create;
      FPokeWrapper.GetAsEntity(LMoveDamageClassEntity, I);
      // Assertions
      Assert.IsNotEmpty(LMoveDamageClassEntity.id);
      // Node Descriptions
      for var descriptions in LMoveDamageClassEntity.descriptions do
      begin
        Assert.IsNotEmpty(descriptions.description);
        Assert.IsNotEmpty(descriptions.language.name);
        Assert.IsNotEmpty(descriptions.language.url);
      end;
      // Node Moves
      for var moves in LMoveDamageClassEntity.moves do
      begin
        Assert.IsNotEmpty(moves.name);
        Assert.IsNotEmpty(moves.url);
      end;
      // Node Names
      for var names in LMoveDamageClassEntity.names do
      begin
        Assert.IsNotEmpty(names.name);
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
      end;
      Assert.IsNotEmpty(LMoveDamageClassEntity.name);
      Write('.');
    finally
      LMoveDamageClassEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TMoveDamageClassTest.TestEntityWillRaise;
var
  LMoveDamageClassEntity: TMoveDamageClassEntity;
begin
  LMoveDamageClassEntity := nil;
  try
    LMoveDamageClassEntity := TMoveDamageClassEntity.Create;
    FPokeWrapper.GetAsEntity(LMoveDamageClassEntity, 9999999);
  finally
    LMoveDamageClassEntity.Free;
  end;
end;

procedure TMoveDamageClassTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TMove.move_damage_class...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TMoveDamageClassTest);

end.
