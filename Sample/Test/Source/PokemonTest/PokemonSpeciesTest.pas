unit PokemonSpeciesTest;

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
  PokemonSpecies.Entity;

type

  [TestFixture]
  TPokemonSpeciesTest = class
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

procedure TPokemonSpeciesTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.pokemon_species);
end;

procedure TPokemonSpeciesTest.TestEntity;
var
  LPokemonSpeciesEntity: TPokemonSpeciesEntity;
begin
  Write('Testing TPokemon.pokemon_species .');
  for var I: integer := 1 to 10 do
  begin
    LPokemonSpeciesEntity := nil;
    try
      LPokemonSpeciesEntity := TPokemonSpeciesEntity.Create;
      FPokeWrapper.GetAsEntity(LPokemonSpeciesEntity, I);
      // Assertions
      Assert.IsNotEmpty(LPokemonSpeciesEntity.base_happiness);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.capture_rate);
      // Node color
      Assert.IsNotEmpty(LPokemonSpeciesEntity.color.name);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.color.url);
      // Node Egg Groups
      if LPokemonSpeciesEntity.egg_groups.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonSpeciesEntity.egg_groups.Items[0].name);
        Assert.IsNotEmpty(LPokemonSpeciesEntity.egg_groups.Items[0].url);
      end;
      // Node Evolution Chain
      Assert.IsNotEmpty(LPokemonSpeciesEntity.evolution_chain.url);
      // Node Flavor Text Entries
      if LPokemonSpeciesEntity.flavor_text_entries.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonSpeciesEntity.flavor_text_entries.Items[0].flavor_text);
        Assert.IsNotEmpty(LPokemonSpeciesEntity.flavor_text_entries.Items[0].language.name);
        Assert.IsNotEmpty(LPokemonSpeciesEntity.flavor_text_entries.Items[0].language.url);
      end;
      // Node Form Descriptions
      if LPokemonSpeciesEntity.form_descriptions.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonSpeciesEntity.form_descriptions.Items[0].effect);
        Assert.IsNotEmpty(LPokemonSpeciesEntity.form_descriptions.Items[0].language.name);
        Assert.IsNotEmpty(LPokemonSpeciesEntity.form_descriptions.Items[0].language.url);
      end;
      Assert.IsNotEmpty(LPokemonSpeciesEntity.forms_switchable);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.gender_rate);
      // Node Genera
      if LPokemonSpeciesEntity.genera.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonSpeciesEntity.genera.Items[0].genus);
        Assert.IsNotEmpty(LPokemonSpeciesEntity.genera.Items[0].language.name);
        Assert.IsNotEmpty(LPokemonSpeciesEntity.genera.Items[0].language.url);
      end;
      // Node Pokemon Species
      Assert.IsNotEmpty(LPokemonSpeciesEntity.generation.name);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.generation.url);
      // Node Growth Rate
      Assert.IsNotEmpty(LPokemonSpeciesEntity.growth_rate.name);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.growth_rate.url);
      // Node Habitat
      Assert.IsNotEmpty(LPokemonSpeciesEntity.habitat.name);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.habitat.url);
      //
      Assert.IsNotEmpty(LPokemonSpeciesEntity.has_gender_differences);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.hatch_counter);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.id);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.is_baby);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.is_legendary);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.is_mythical);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.name);
      // Node Names
      if LPokemonSpeciesEntity.names.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonSpeciesEntity.names.Items[0].name);
        Assert.IsNotEmpty(LPokemonSpeciesEntity.names.Items[0].language.name);
        Assert.IsNotEmpty(LPokemonSpeciesEntity.names.Items[0].language.url);
      end;
      // Node Names
      if LPokemonSpeciesEntity.varieties.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonSpeciesEntity.varieties.Items[0].is_default);
        Assert.IsNotEmpty(LPokemonSpeciesEntity.varieties.Items[0].pokemon.name);
        Assert.IsNotEmpty(LPokemonSpeciesEntity.varieties.Items[0].pokemon.url);
      end;
      Write('.');
    finally
      LPokemonSpeciesEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TPokemonSpeciesTest.TestEntityWillRaise;
var
  LPokemonSpeciesEntity: TPokemonSpeciesEntity;
begin
  LPokemonSpeciesEntity := nil;
  try
    LPokemonSpeciesEntity := TPokemonSpeciesEntity.Create;
    FPokeWrapper.GetAsEntity(LPokemonSpeciesEntity, 9999999);
  finally
    LPokemonSpeciesEntity.Free;
  end;
end;

procedure TPokemonSpeciesTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TPokemon.pokemon_species...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TPokemonSpeciesTest);

end.
