unit PokedexTest;

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
  Pokedex.Entity;

type

  [TestFixture]
  TPokedexTest = class
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

procedure TPokedexTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.Pokedex);
end;

procedure TPokedexTest.TestEntity;
var
  LPokedexEntity: TPokedexEntity;
begin
  Write('Testing TGames.pokedex .');
  for var I: integer := 1 to 10 do
  begin
    LPokedexEntity := nil;
    try
      // Id pokedex 10 not found
      if I <> 10 then
      begin
        LPokedexEntity := TPokedexEntity.Create;
        FPokeWrapper.GetAsEntity(LPokedexEntity, I);
        // Assertions
        // node descriptions
        for var descriptions in LPokedexEntity.descriptions do
        begin
          Assert.IsNotEmpty(descriptions.description);
          Assert.IsNotEmpty(descriptions.language.name);
          Assert.IsNotEmpty(descriptions.language.url);
        end;
        //
        Assert.IsNotEmpty(LPokedexEntity.id);
        Assert.IsNotEmpty(LPokedexEntity.is_main_series);
        Assert.IsNotEmpty(LPokedexEntity.name);
        // node language
        for var names in LPokedexEntity.names do
        begin
          Assert.IsNotEmpty(names.language.name);
          Assert.IsNotEmpty(names.language.url);
          Assert.IsNotEmpty(names.name);
        end;
        // node pokemon_entries
        for var pokemon_entries in LPokedexEntity.pokemon_entries do
        begin
          Assert.IsNotEmpty(pokemon_entries.entry_number);
          Assert.IsNotEmpty(pokemon_entries.pokemon_species.name);
          Assert.IsNotEmpty(pokemon_entries.pokemon_species.url);
        end;
        // region can be null
        // Assert.IsNotEmpty(LPokedexEntity.region.name);
        // Assert.IsNotEmpty(LPokedexEntity.region.url);
        // node nullable version_groups
        for var version_groups in LPokedexEntity.version_groups do
        begin
          Assert.IsNotEmpty(version_groups.name);
          Assert.IsNotEmpty(version_groups.url);
        end;
        Write('.');
      end;
    finally
      LPokedexEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TPokedexTest.TestEntityWillRaise;
var
  LPokedexEntity: TPokedexEntity;
begin
  LPokedexEntity := nil;
  try
    LPokedexEntity := TPokedexEntity.Create;
    FPokeWrapper.GetAsEntity(LPokedexEntity, 9999999);
  finally
    LPokedexEntity.Free;
  end;
end;

procedure TPokedexTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TGames.pokedex...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TPokedexTest);

end.
