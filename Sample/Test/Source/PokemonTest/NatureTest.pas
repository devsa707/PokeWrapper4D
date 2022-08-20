unit NatureTest;

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
  Nature.Entity;

type

  [TestFixture]
  TNatureTest = class
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

procedure TNatureTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.Nature);
end;

procedure TNatureTest.TestEntity;
var
  LNatureEntity: TNatureEntity;
begin
  Write('Testing TPokemon.nature .');
  for var I: integer := 1 to FList - 1 do
  begin
    LNatureEntity := nil;
    try
      LNatureEntity := TNatureEntity.Create;
      FPokeWrapper.GetAsEntity(LNatureEntity, I);
      // Assertions
      Assert.IsNotEmpty(LNatureEntity.id);
      // Node Move Battle Style Preferences
      for var move_battle_style_preferences in LNatureEntity.move_battle_style_preferences do
      begin
        Assert.IsNotEmpty(move_battle_style_preferences.high_hp_preference);
        Assert.IsNotEmpty(move_battle_style_preferences.low_hp_preference);
        Assert.IsNotEmpty(move_battle_style_preferences.move_battle_style.name);
        Assert.IsNotEmpty(move_battle_style_preferences.move_battle_style.url);
      end;
      Assert.IsNotEmpty(LNatureEntity.name);
      // Node Names
      for var names in LNatureEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
      // Node Pokeathlon Stat Changes
      for var pokeathlon_stat_changes in LNatureEntity.pokeathlon_stat_changes do
      begin
        Assert.IsNotEmpty(pokeathlon_stat_changes.max_change);
        Assert.IsNotEmpty(pokeathlon_stat_changes.pokeathlon_stat.name);
        Assert.IsNotEmpty(pokeathlon_stat_changes.pokeathlon_stat.url);
      end;
      // Node Levels
      Write('.');
    finally
      LNatureEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TNatureTest.TestEntityWillRaise;
var
  LNatureEntity: TNatureEntity;
begin
  LNatureEntity := nil;
  try
    LNatureEntity := TNatureEntity.Create;
    FPokeWrapper.GetAsEntity(LNatureEntity, 9999999);
  finally
    LNatureEntity.Free;
  end;
end;

procedure TNatureTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TPokemon.nature...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TNatureTest);

end.
