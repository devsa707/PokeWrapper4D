unit GenerationTest;

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
  Generation.Entity;

type

  [TestFixture]
  TGenerationTest = class
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

procedure TGenerationTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.Generation);
end;

procedure TGenerationTest.TestEntity;
var
  LGenerationEntity: TGenerationEntity;
begin
  Write('Testing TGames.generation .');
  for var I: integer := 1 to FList - 1 do
  begin
    LGenerationEntity := nil;
    try
      LGenerationEntity := TGenerationEntity.Create;
      FPokeWrapper.GetAsEntity(LGenerationEntity, I);
      // Assertions
      // node abilities moves
      for var abilities in LGenerationEntity.abilities do
      begin
        Assert.IsNotEmpty(abilities.name);
        Assert.IsNotEmpty(abilities.url);
      end;
      Assert.IsNotEmpty(LGenerationEntity.id);
      Assert.IsNotEmpty(LGenerationEntity.main_region.name);
      Assert.IsNotEmpty(LGenerationEntity.main_region.url);
      // node nullable moves
      for var moves in LGenerationEntity.moves do
      begin
        Assert.IsNotEmpty(moves.name);
        Assert.IsNotEmpty(moves.url);
      end;
      Assert.IsNotEmpty(LGenerationEntity.name);
      // node language
      for var names in LGenerationEntity.names do
      begin
        Assert.IsNotEmpty(names.name);
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
      end;
      // node pokemon_species
      for var pokemon_species in LGenerationEntity.pokemon_species do
      begin
        Assert.IsNotEmpty(pokemon_species.name);
        Assert.IsNotEmpty(pokemon_species.url);
      end;
      // node nullable types
      for var Types in LGenerationEntity.Types do
      begin
        Assert.IsNotEmpty(Types.name);
        Assert.IsNotEmpty(Types.url);
      end;
      Write('.');
    finally
      LGenerationEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TGenerationTest.TestEntityWillRaise;
var
  LGenerationEntity: TGenerationEntity;
begin
  LGenerationEntity := nil;
  try
    LGenerationEntity := TGenerationEntity.Create;
    FPokeWrapper.GetAsEntity(LGenerationEntity, 9999999);
  finally
    LGenerationEntity.Free;
  end;
end;

procedure TGenerationTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TGames.generation...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TGenerationTest);

end.
