unit PokemonShapeTest;

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
  PokemonShape.Entity;

type

  [TestFixture]
  TPokemonShapeTest = class
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

procedure TPokemonShapeTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.pokemon_shape);
end;

procedure TPokemonShapeTest.TestEntity;
var
  LPokemonShapeEntity: TPokemonShapeEntity;
begin
  Write('Testing pokemon_shape .');
  for var I: integer := 1 to FList - 1 do
  begin
    LPokemonShapeEntity := nil;
    try
      LPokemonShapeEntity := TPokemonShapeEntity.Create;
      FPokeWrapper.GetAsEntity(LPokemonShapeEntity, I);
      // Assertions
      Assert.IsNotEmpty(LPokemonShapeEntity.id);
      Assert.IsNotEmpty(LPokemonShapeEntity.name);
      // Node Awesome Names
      for var awesome_names in LPokemonShapeEntity.awesome_names do
      begin
        Assert.IsNotEmpty(awesome_names.awesome_name);
        Assert.IsNotEmpty(awesome_names.language.name);
        Assert.IsNotEmpty(awesome_names.language.url);
      end;
      // Node Names
      for var names in LPokemonShapeEntity.names do
      begin
        Assert.IsNotEmpty(names.name);
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
      end;
      // Node Pokemon Species
      for var pokemon_species in LPokemonShapeEntity.pokemon_species do
      begin
        Assert.IsNotEmpty(pokemon_species.name);
        Assert.IsNotEmpty(pokemon_species.url);
      end;
      Write('.');
    finally
      LPokemonShapeEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TPokemonShapeTest.TestEntityWillRaise;
var
  LPokemonShapeEntity: TPokemonShapeEntity;
begin
  LPokemonShapeEntity := nil;
  try
    LPokemonShapeEntity := TPokemonShapeEntity.Create;
    FPokeWrapper.GetAsEntity(LPokemonShapeEntity, 9999999);
  finally
    LPokemonShapeEntity.Free;
  end;
end;

procedure TPokemonShapeTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of pokemon_shape...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TPokemonShapeTest);

end.
