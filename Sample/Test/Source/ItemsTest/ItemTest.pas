unit ItemTest;

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
  Item.Entity;

type

  [TestFixture]
  TItemTest = class
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

procedure TItemTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.Item);
end;

procedure TItemTest.TestEntity;
var
  LItemEntity: TItemEntity;
begin
  Write('Testing TItem.item .');
  for var I: integer := 1 to 10 do
  begin
    LItemEntity := nil;
    try
      LItemEntity := TItemEntity.Create;
      FPokeWrapper.GetAsEntity(LItemEntity, I);
      // Assertions
      // node Nullable Attributes
      for var attributes in LItemEntity.attributes do
      begin
        Assert.IsNotEmpty(attributes.name);
        Assert.IsNotEmpty(attributes.url);
      end;
      // node Category
      Assert.IsNotEmpty(LItemEntity.category.name);
      Assert.IsNotEmpty(LItemEntity.category.url);
      //
      Assert.IsNotEmpty(LItemEntity.cost);
      // node effect_entries
      // Effect can be null https://pokeapi.co/api/v2/item/432
      // Assert.IsNotEmpty(LItemEntity.effect_entries.Items
      // [LItemEntity.effect_entries.Count - 1].effect);
      for var effect_entries in LItemEntity.effect_entries do
      begin
        Assert.IsNotEmpty(effect_entries.language.name);
        Assert.IsNotEmpty(effect_entries.language.url);
      end;
      // ShortEffect can result null
      // Assert.IsNotEmpty(LItemEntity.effect_entries.Items
      // [LItemEntity.effect_entries.Count - 1].short_effect);
      // node Game Indices
      for var game_indices in LItemEntity.game_indices do
      begin
        Assert.IsNotEmpty(game_indices.game_index);
        Assert.IsNotEmpty(game_indices.generation.name);
        Assert.IsNotEmpty(game_indices.generation.url);
      end;
      // node Nullable Held By Pokemon
      for var held_by_pokemon in LItemEntity.held_by_pokemon do
      begin
        Assert.IsNotEmpty(held_by_pokemon.pokemon.name);
        Assert.IsNotEmpty(held_by_pokemon.pokemon.url);
        for var version_details in held_by_pokemon.version_details do
        begin
          Assert.IsNotEmpty(version_details.rarity);
          Assert.IsNotEmpty(version_details.version.name);
          Assert.IsNotEmpty(version_details.version.url);
        end;
      end;
      Assert.IsNotEmpty(LItemEntity.id);
      // node Languages
      for var names in LItemEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
      // node sprites
      Assert.IsNotEmpty(LItemEntity.sprites.default);
      Write('.');
    finally
      LItemEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TItemTest.TestEntityWillRaise;
var
  LItemEntity: TItemEntity;
begin
  LItemEntity := nil;
  try
    LItemEntity := TItemEntity.Create;
    FPokeWrapper.GetAsEntity(LItemEntity, 9999999);
  finally
    LItemEntity.Free;
  end;
end;

procedure TItemTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TItem.item...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TItemTest);

end.
