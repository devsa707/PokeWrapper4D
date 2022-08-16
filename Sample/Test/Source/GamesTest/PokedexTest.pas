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
        Assert.IsNotEmpty(LPokedexEntity.descriptions.Items[LPokedexEntity.descriptions.Count - 1].description);
        Assert.IsNotEmpty(LPokedexEntity.descriptions.Items[LPokedexEntity.descriptions.Count - 1].language.name);
        Assert.IsNotEmpty(LPokedexEntity.descriptions.Items[LPokedexEntity.descriptions.Count - 1].language.url);
        //
        Assert.IsNotEmpty(LPokedexEntity.id);
        Assert.IsNotEmpty(LPokedexEntity.is_main_series);
        Assert.IsNotEmpty(LPokedexEntity.name);
        // node language
        Assert.IsNotEmpty(LPokedexEntity.names.Items[LPokedexEntity.names.Count - 1].language.name);
        Assert.IsNotEmpty(LPokedexEntity.names.Items[LPokedexEntity.names.Count - 1].language.url);
        Assert.IsNotEmpty(LPokedexEntity.names.Items[LPokedexEntity.names.Count - 1].name);
        // node pokemon_entries
        Assert.IsNotEmpty(LPokedexEntity.pokemon_entries.Items[LPokedexEntity.pokemon_entries.Count - 1].entry_number);
        Assert.IsNotEmpty(LPokedexEntity.pokemon_entries.Items[LPokedexEntity.pokemon_entries.Count - 1].pokemon_species.name);
        Assert.IsNotEmpty(LPokedexEntity.pokemon_entries.Items[LPokedexEntity.pokemon_entries.Count - 1].pokemon_species.url);
        // region can be null
        // Assert.IsNotEmpty(LPokedexEntity.region.name);
        // Assert.IsNotEmpty(LPokedexEntity.region.url);
        // node nullable version_groups
        if LPokedexEntity.version_groups.Count <> 0 then
        begin
          Assert.IsNotEmpty(LPokedexEntity.version_groups.Items[LPokedexEntity.version_groups.Count - 1].name);
          Assert.IsNotEmpty(LPokedexEntity.version_groups.Items[LPokedexEntity.version_groups.Count - 1].url);
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
