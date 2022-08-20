unit PokemonTest;

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
  Pokemon.Entity;

type

  [TestFixture]
  TPokemonTest = class
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

procedure TPokemonTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.Pokemon);
end;

procedure TPokemonTest.TestEntity;
var
  LPokemonEntity: TPokemonEntity;
begin
  Write('Testing TPokemon.pokemon .');
  for var I: integer := 1 to 10 do
  begin
    LPokemonEntity := nil;
    try
      LPokemonEntity := TPokemonEntity.Create;
      TPokeFactory.New(TPokemon.Pokemon).GetAsEntity(LPokemonEntity, I);
      // Assertions
      // Node Abilities
      for var abilities in LPokemonEntity.abilities do
      begin
        Assert.IsNotEmpty(abilities.ability.name);
        Assert.IsNotEmpty(abilities.ability.url);
        Assert.IsNotEmpty(abilities.is_hidden);
        Assert.IsNotEmpty(abilities.slot);
      end;
      //
      Assert.IsNotEmpty(LPokemonEntity.base_experience);
      // Node Forms
      for var forms in LPokemonEntity.forms do
      begin
        Assert.IsNotEmpty(forms.name);
        Assert.IsNotEmpty(forms.url);
      end;
      // Node Game Indices
      for var game_indices in LPokemonEntity.game_indices do
      begin
        Assert.IsNotEmpty(game_indices.game_index);
        Assert.IsNotEmpty(game_indices.version.name);
        Assert.IsNotEmpty(game_indices.version.url);
      end;
      //
      Assert.IsNotEmpty(LPokemonEntity.height);
      // Node Held Items
      for var held_items in LPokemonEntity.held_items do
      begin
        Assert.IsNotEmpty(held_items.item.name);
        Assert.IsNotEmpty(held_items.item.url);
        for var version_details in held_items.version_details do
        begin
          Assert.IsNotEmpty(version_details.version.name);
          Assert.IsNotEmpty(version_details.version.url);
          Assert.IsNotEmpty(version_details.rarity);
        end;
      end;
      // Node Held Items
      for var moves in LPokemonEntity.moves do
      begin
        Assert.IsNotEmpty(moves.move.name);
        Assert.IsNotEmpty(moves.move.url);
        for var version_group_details in moves.version_group_details do
        begin
          Assert.IsNotEmpty(version_group_details.level_learned_at);
          Assert.IsNotEmpty(version_group_details.move_learn_method.name);
          Assert.IsNotEmpty(version_group_details.move_learn_method.url);
          Assert.IsNotEmpty(version_group_details.version_group.name);
          Assert.IsNotEmpty(version_group_details.version_group.url);
        end;
      end;
      //
      Assert.IsNotEmpty(LPokemonEntity.location_area_encounters);
      Assert.IsNotEmpty(LPokemonEntity.name);
      Assert.IsNotEmpty(LPokemonEntity.order);
      // Node Past Types
      for var past_types in LPokemonEntity.past_types do
      begin
        Assert.IsNotEmpty(past_types.Generation.name);
        Assert.IsNotEmpty(past_types.Generation.url);
        Assert.IsNotEmpty(past_types.Types.Items[0].slot);
        Assert.IsNotEmpty(past_types.Types.Items[0].type_.name);
        Assert.IsNotEmpty(past_types.Types.Items[0].type_.url);
      end;
      // Node Species
      Assert.IsNotEmpty(LPokemonEntity.species.name);
      Assert.IsNotEmpty(LPokemonEntity.species.url);
      // Node Stats
      for var stats in LPokemonEntity.stats do
      begin
        Assert.IsNotEmpty(stats.base_stat);
        Assert.IsNotEmpty(stats.effort);
        Assert.IsNotEmpty(stats.stat.name);
        Assert.IsNotEmpty(stats.stat.url);
      end;
      // Node Types
      for var Types in LPokemonEntity.Types do
      begin
        Assert.IsNotEmpty(Types.slot);
        Assert.IsNotEmpty(Types.type_.name);
        Assert.IsNotEmpty(Types.type_.url);
      end;
      // Node Sprites
      Assert.IsNotEmpty(LPokemonEntity.Sprites.other.official_artwork.front_default);
      Assert.IsNotEmpty(LPokemonEntity.Sprites.versions.generation_i.red_blue.back_default);
      Write('.');
    finally
      LPokemonEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TPokemonTest.TestEntityWillRaise;
var
  LPokemonEntity: TPokemonEntity;
begin
  LPokemonEntity := nil;
  try
    LPokemonEntity := TPokemonEntity.Create;
    FPokeWrapper.GetAsEntity(LPokemonEntity, 9999999);
  finally
    LPokemonEntity.Free;
  end;
end;

procedure TPokemonTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TPokemon.pokemon...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TPokemonTest);

end.
