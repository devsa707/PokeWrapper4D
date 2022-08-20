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
  Write('Testing pokemon_species .');
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
      for var egg_groups in LPokemonSpeciesEntity.egg_groups do
      begin
        Assert.IsNotEmpty(egg_groups.name);
        Assert.IsNotEmpty(egg_groups.url);
      end;
      // Node Evolution Chain
      Assert.IsNotEmpty(LPokemonSpeciesEntity.evolution_chain.url);
      // Node Flavor Text Entries
      for var flavor_text_entries in LPokemonSpeciesEntity.flavor_text_entries do
      begin
        Assert.IsNotEmpty(flavor_text_entries.flavor_text);
        Assert.IsNotEmpty(flavor_text_entries.language.name);
        Assert.IsNotEmpty(flavor_text_entries.language.url);
      end;
      // Node Form Descriptions
      for var form_descriptions in LPokemonSpeciesEntity.form_descriptions do
      begin
        Assert.IsNotEmpty(form_descriptions.effect);
        Assert.IsNotEmpty(form_descriptions.language.name);
        Assert.IsNotEmpty(form_descriptions.language.url);
      end;
      Assert.IsNotEmpty(LPokemonSpeciesEntity.forms_switchable);
      Assert.IsNotEmpty(LPokemonSpeciesEntity.gender_rate);
      // Node Genera
      for var genera in LPokemonSpeciesEntity.genera do
      begin
        Assert.IsNotEmpty(genera.genus);
        Assert.IsNotEmpty(genera.language.name);
        Assert.IsNotEmpty(genera.language.url);
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
      for var names in LPokemonSpeciesEntity.names do
      begin
        Assert.IsNotEmpty(names.name);
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
      end;
      // Node Names
      for var varieties in LPokemonSpeciesEntity.varieties do
      begin
        Assert.IsNotEmpty(varieties.is_default);
        Assert.IsNotEmpty(varieties.pokemon.name);
        Assert.IsNotEmpty(varieties.pokemon.url);
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
    Write('Testing List of pokemon_species...  ');
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
