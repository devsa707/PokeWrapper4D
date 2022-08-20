unit PokemonHabitatTest;

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
  PokemonHabitat.Entity;

type

  [TestFixture]
  TPokemonHabitatTest = class
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

procedure TPokemonHabitatTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.pokemon_habitat);
end;

procedure TPokemonHabitatTest.TestEntity;
var
  LPokemonHabitatEntity: TPokemonHabitatEntity;
begin
  Write('Testing pokemon_habitat .');
  for var I: integer := 1 to FList - 1 do
  begin
    LPokemonHabitatEntity := nil;
    try
      LPokemonHabitatEntity := TPokemonHabitatEntity.Create;
      FPokeWrapper.GetAsEntity(LPokemonHabitatEntity, I);
      // Assertions
      Assert.IsNotEmpty(LPokemonHabitatEntity.id);
      Assert.IsNotEmpty(LPokemonHabitatEntity.name);
      // Node Names
      for var names in LPokemonHabitatEntity.names do
      begin
        Assert.IsNotEmpty(names.name);
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
      end;
      // Node Pokemon Species
      for var pokemon_species in LPokemonHabitatEntity.pokemon_species do
      begin
        Assert.IsNotEmpty(pokemon_species.name);
        Assert.IsNotEmpty(pokemon_species.url);
      end;
      Write('.');
    finally
      LPokemonHabitatEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TPokemonHabitatTest.TestEntityWillRaise;
var
  LPokemonHabitatEntity: TPokemonHabitatEntity;
begin
  LPokemonHabitatEntity := nil;
  try
    LPokemonHabitatEntity := TPokemonHabitatEntity.Create;
    FPokeWrapper.GetAsEntity(LPokemonHabitatEntity, 9999999);
  finally
    LPokemonHabitatEntity.Free;
  end;
end;

procedure TPokemonHabitatTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of pokemon_habitat...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TPokemonHabitatTest);

end.
