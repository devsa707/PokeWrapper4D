unit TypeTest;

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
  PokemonType.Entity;

type

  [TestFixture]
  TTypeTest = class
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

procedure TTypeTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.Type_);
end;

procedure TTypeTest.TestEntity;
var
  LPokemonTypeEntity: TPokemonTypeEntity;
begin
  Write('Testing Type .');
  for var I: integer := 1 to 8 do
  begin
    LPokemonTypeEntity := nil;
    try
      LPokemonTypeEntity := TPokemonTypeEntity.Create;
      FPokeWrapper.GetAsEntity(LPokemonTypeEntity, I);
      // Assertions
      // Node Double Damage From
      for var double_damage_from in LPokemonTypeEntity.damage_relations.double_damage_from do
      begin
        Assert.IsNotEmpty(double_damage_from.name);
        Assert.IsNotEmpty(double_damage_from.url);
      end;
      // Node Game Indices
      for var game_indices in LPokemonTypeEntity.game_indices do
      begin
        Assert.IsNotEmpty(game_indices.game_index);
        Assert.IsNotEmpty(game_indices.generation.name);
        Assert.IsNotEmpty(game_indices.generation.url);
      end;
      //
      Assert.IsNotEmpty(LPokemonTypeEntity.generation.name);
      Assert.IsNotEmpty(LPokemonTypeEntity.generation.url);
      Assert.IsNotEmpty(LPokemonTypeEntity.id);
      // Node Game Indices
      for var game_indices in LPokemonTypeEntity.game_indices do
      begin
        Assert.IsNotEmpty(game_indices.game_index);
        Assert.IsNotEmpty(game_indices.generation.name);
        Assert.IsNotEmpty(game_indices.generation.url);
      end;
      // Node Moves
      for var moves in LPokemonTypeEntity.moves do
      begin
        Assert.IsNotEmpty(moves.name);
        Assert.IsNotEmpty(moves.url);
      end;
      // Node Names
      for var names in LPokemonTypeEntity.names do
      begin
        Assert.IsNotEmpty(names.name);
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
      end;
      // Node Names
      for var past_damage_relations in LPokemonTypeEntity.past_damage_relations do
      begin
        Assert.IsNotEmpty(past_damage_relations.generation.name);
        Assert.IsNotEmpty(past_damage_relations.generation.url);
        Assert.IsNotEmpty(past_damage_relations.generation.name);
        Assert.IsNotEmpty(past_damage_relations.generation.url);
        for var no_damage_to in past_damage_relations.damage_relations.no_damage_to do
        begin
          Assert.IsNotEmpty(no_damage_to.name);
          Assert.IsNotEmpty(no_damage_to.url);
        end;
        for var half_damage_to in past_damage_relations.damage_relations.half_damage_to do
        begin
          Assert.IsNotEmpty(half_damage_to.name);
          Assert.IsNotEmpty(half_damage_to.url);
        end;
        for var double_damage_to in past_damage_relations.damage_relations.double_damage_to do
        begin
          Assert.IsNotEmpty(double_damage_to.name);
          Assert.IsNotEmpty(double_damage_to.url);
        end;
        for var no_damage_from in past_damage_relations.damage_relations.no_damage_from do
        begin
          Assert.IsNotEmpty(no_damage_from.name);
          Assert.IsNotEmpty(no_damage_from.url);
        end;
        for var half_damage_from in past_damage_relations.damage_relations.half_damage_from do
        begin
          Assert.IsNotEmpty(half_damage_from.name);
          Assert.IsNotEmpty(half_damage_from.url);
        end;
        for var double_damage_from in past_damage_relations.damage_relations.double_damage_from do
        begin
          Assert.IsNotEmpty(double_damage_from.name);
          Assert.IsNotEmpty(double_damage_from.url);
        end;
      end;
      for var pokemon in LPokemonTypeEntity.pokemon do
      begin
        Assert.IsNotEmpty(pokemon.pokemon.name);
        Assert.IsNotEmpty(pokemon.pokemon.url);
        Assert.IsNotEmpty(pokemon.slot);
      end;
      Write('.');
    finally
      LPokemonTypeEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TTypeTest.TestEntityWillRaise;
var
  LPokemonTypeEntity: TPokemonTypeEntity;
begin
  LPokemonTypeEntity := nil;
  try
    LPokemonTypeEntity := TPokemonTypeEntity.Create;
    FPokeWrapper.GetAsEntity(LPokemonTypeEntity, 9999999);
  finally
    LPokemonTypeEntity.Free;
  end;
end;

procedure TTypeTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of Type...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TTypeTest);

end.
