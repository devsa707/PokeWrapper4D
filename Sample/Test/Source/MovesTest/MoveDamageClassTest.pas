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
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.move_damage_class));
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
      if LMoveDamageClassEntity.descriptions.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveDamageClassEntity.descriptions.Items[0].description);
        Assert.IsNotEmpty(LMoveDamageClassEntity.descriptions.Items[0].language.name);
        Assert.IsNotEmpty(LMoveDamageClassEntity.descriptions.Items[0].language.url);
      end;
      // Node Moves
      if LMoveDamageClassEntity.moves.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveDamageClassEntity.moves.Items[0].name);
        Assert.IsNotEmpty(LMoveDamageClassEntity.moves.Items[0].url);
      end;
      // Node Names
      if LMoveDamageClassEntity.names.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveDamageClassEntity.names.Items[0].name);
        Assert.IsNotEmpty(LMoveDamageClassEntity.names.Items[0].language.name);
        Assert.IsNotEmpty(LMoveDamageClassEntity.names.Items[0].language.url);
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
    LPokeListEntity := FPokeWrapper.GetAsListEntity;d
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
