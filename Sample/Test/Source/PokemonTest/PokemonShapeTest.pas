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
  Write('Testing TPokemon.pokemon_shape .');
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
      if LPokemonShapeEntity.awesome_names.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonShapeEntity.awesome_names.Items[0].awesome_name);
        Assert.IsNotEmpty(LPokemonShapeEntity.awesome_names.Items[0].language.name);
        Assert.IsNotEmpty(LPokemonShapeEntity.awesome_names.Items[0].language.url);
      end;
      // Node Names
      if LPokemonShapeEntity.names.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonShapeEntity.names.Items[0].name);
        Assert.IsNotEmpty(LPokemonShapeEntity.names.Items[0].language.name);
        Assert.IsNotEmpty(LPokemonShapeEntity.names.Items[0].language.url);
      end;
      // Node Pokemon Species
      if LPokemonShapeEntity.pokemon_species.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonShapeEntity.pokemon_species.Items[0].name);
        Assert.IsNotEmpty(LPokemonShapeEntity.pokemon_species.Items[0].url);
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
    Write('Testing List of TPokemon.pokemon_shape...  ');
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
