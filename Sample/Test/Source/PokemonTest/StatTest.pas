unit StatTest;

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
  PokemonStat.Entity;

type

  [TestFixture]
  TStatTest = class
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

procedure TStatTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.Stat);
end;

procedure TStatTest.TestEntity;
var
  LPokemonStatEntity: TPokemonStatEntity;
begin
  Write('Testing Stat .');
  for var I: integer := 1 to 8 do
  begin
    LPokemonStatEntity := nil;
    try
      LPokemonStatEntity := TPokemonStatEntity.Create;
      FPokeWrapper.GetAsEntity(LPokemonStatEntity, I);
      // Assertions
      // Node Affecting Move Decrease
      for var decrease in LPokemonStatEntity.affecting_moves.decrease do
      begin
        Assert.IsNotEmpty(decrease.change);
        Assert.IsNotEmpty(decrease.move.name);
        Assert.IsNotEmpty(decrease.move.url);
      end;
      // Node Affecting Move Increase
      for var increase in LPokemonStatEntity.affecting_moves.increase do
      begin
        Assert.IsNotEmpty(increase.change);
        Assert.IsNotEmpty(increase.move.name);
        Assert.IsNotEmpty(increase.move.url);
      end;
      // Node Affecting Natures Decrease
      for var decrease in LPokemonStatEntity.affecting_natures.decrease do
      begin
        Assert.IsNotEmpty(decrease.name);
        Assert.IsNotEmpty(decrease.url);
      end;
      // Node Affecting Natures Increase
      for var increase in LPokemonStatEntity.affecting_natures.increase do
      begin
        Assert.IsNotEmpty(increase.name);
        Assert.IsNotEmpty(increase.url);
      end;
      //
      Assert.IsNotEmpty(LPokemonStatEntity.game_index);
      Assert.IsNotEmpty(LPokemonStatEntity.id);
      Assert.IsNotEmpty(LPokemonStatEntity.is_battle_only);
      // Assert.IsNotEmpty(LPokemonStatEntity.move_damage_class.name);
      // Assert.IsNotEmpty(LPokemonStatEntity.move_damage_class.url);
      Assert.IsNotEmpty(LPokemonStatEntity.name);
      // Node Affecting Natures Increase
      for var names in LPokemonStatEntity.names do
      begin
        Assert.IsNotEmpty(names.name);
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
      end;

      Write('.');
    finally
      LPokemonStatEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TStatTest.TestEntityWillRaise;
var
  LPokemonStatEntity: TPokemonStatEntity;
begin
  LPokemonStatEntity := nil;
  try
    LPokemonStatEntity := TPokemonStatEntity.Create;
    FPokeWrapper.GetAsEntity(LPokemonStatEntity, 9999999);
  finally
    LPokemonStatEntity.Free;
  end;
end;

procedure TStatTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of Stat...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TStatTest);

end.
