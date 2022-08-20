unit PokemonColorTest;

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
  PokemonColor.Entity;

type

  [TestFixture]
  TPokemonColorTest = class
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

procedure TPokemonColorTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.pokemon_color);
end;

procedure TPokemonColorTest.TestEntity;
var
  LPokemonColorEntity: TPokemonColorEntity;
begin
  Write('Testing pokemon_color .');
  for var I: integer := 1 to FList - 1 do
  begin
    LPokemonColorEntity := nil;
    try
      LPokemonColorEntity := TPokemonColorEntity.Create;
      FPokeWrapper.GetAsEntity(LPokemonColorEntity, I);
      // Assertions
      Assert.IsNotEmpty(LPokemonColorEntity.id);
      Assert.IsNotEmpty(LPokemonColorEntity.name);
      // Node Names
      for var names in LPokemonColorEntity.names do
      begin
        Assert.IsNotEmpty(names.name);
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
      end;
      // Node Pokemon Species
      for var pokemon_species in LPokemonColorEntity.pokemon_species do
      begin
        Assert.IsNotEmpty(pokemon_species.name);
        Assert.IsNotEmpty(pokemon_species.url);
      end;
      Write('.');
    finally
      LPokemonColorEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TPokemonColorTest.TestEntityWillRaise;
var
  LPokemonColorEntity: TPokemonColorEntity;
begin
  LPokemonColorEntity := nil;
  try
    LPokemonColorEntity := TPokemonColorEntity.Create;
    FPokeWrapper.GetAsEntity(LPokemonColorEntity, 9999999);
  finally
    LPokemonColorEntity.Free;
  end;
end;

procedure TPokemonColorTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of pokemon_color...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TPokemonColorTest);

end.
