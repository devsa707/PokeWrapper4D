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
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.Pokemon));
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
      FPokeWrapper.GetAsEntity(LPokemonEntity, I);
      // Assertions
      // Node Abilities
      if LPokemonEntity.abilities.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonEntity.abilities.Items[0].ability.name);
        Assert.IsNotEmpty(LPokemonEntity.abilities.Items[0].ability.url);
        Assert.IsNotEmpty(LPokemonEntity.abilities.Items[0].is_hidden);
        Assert.IsNotEmpty(LPokemonEntity.abilities.Items[0].slot);
      end;
      //
      Assert.IsNotEmpty(LPokemonEntity.base_experience);
      // Node Forms
      if LPokemonEntity.forms.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonEntity.forms.Items[0].name);
        Assert.IsNotEmpty(LPokemonEntity.forms.Items[0].url);
      end;
      // Node Game Indices
      if LPokemonEntity.game_indices.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonEntity.game_indices.Items[0].game_index);
        Assert.IsNotEmpty(LPokemonEntity.game_indices.Items[0].version.name);
        Assert.IsNotEmpty(LPokemonEntity.game_indices.Items[0].version.url);
      end;
      //
      Assert.IsNotEmpty(LPokemonEntity.height);
      // Node Held Items
      if LPokemonEntity.held_items.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonEntity.held_items.Items[0].item.name);
        Assert.IsNotEmpty(LPokemonEntity.held_items.Items[0].item.url);
        Assert.IsNotEmpty(LPokemonEntity.held_items.Items[0].version_details.version.name);
        Assert.IsNotEmpty(LPokemonEntity.held_items.Items[0].version_details.version.url);
        Assert.IsNotEmpty(LPokemonEntity.held_items.Items[0].version_details.rarity);
      end;
      // Node Held Items
      if LPokemonEntity.moves.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonEntity.moves.Items[0].move.name);
        Assert.IsNotEmpty(LPokemonEntity.moves.Items[0].move.url);
        Assert.IsNotEmpty(LPokemonEntity.moves.Items[0].version_group_details.Items[0].level_learned_at);
        Assert.IsNotEmpty(LPokemonEntity.moves.Items[0].version_group_details.Items[0].move_learn_method.name);
        Assert.IsNotEmpty(LPokemonEntity.moves.Items[0].version_group_details.Items[0].move_learn_method.url);
        Assert.IsNotEmpty(LPokemonEntity.moves.Items[0].version_group_details.Items[0].version_group.name);
        Assert.IsNotEmpty(LPokemonEntity.moves.Items[0].version_group_details.Items[0].version_group.url);
      end;
      //
      Assert.IsNotEmpty(LPokemonEntity.location_area_encounters);
      Assert.IsNotEmpty(LPokemonEntity.name);
      Assert.IsNotEmpty(LPokemonEntity.order);
      // Node Past Types
      if LPokemonEntity.past_types.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonEntity.past_types.Items[0].Generation.name);
        Assert.IsNotEmpty(LPokemonEntity.past_types.Items[0].Generation.url);
        Assert.IsNotEmpty(LPokemonEntity.past_types.Items[0].Types.Items[0].slot);
        Assert.IsNotEmpty(LPokemonEntity.past_types.Items[0].Types.Items[0].type_.name);
        Assert.IsNotEmpty(LPokemonEntity.past_types.Items[0].Types.Items[0].type_.url);
      end;
      // Node Species
      Assert.IsNotEmpty(LPokemonEntity.species.name);
      Assert.IsNotEmpty(LPokemonEntity.species.url);
      // Node Stats
      if LPokemonEntity.stats.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonEntity.stats.Items[0].base_stat);
        Assert.IsNotEmpty(LPokemonEntity.stats.Items[0].effort);
        Assert.IsNotEmpty(LPokemonEntity.stats.Items[0].stat.name);
        Assert.IsNotEmpty(LPokemonEntity.stats.Items[0].stat.url);
      end;
      // Node Types
      if LPokemonEntity.Types.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonEntity.Types.Items[0].slot);
        Assert.IsNotEmpty(LPokemonEntity.Types.Items[0].type_.name);
        Assert.IsNotEmpty(LPokemonEntity.Types.Items[0].type_.url);
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
