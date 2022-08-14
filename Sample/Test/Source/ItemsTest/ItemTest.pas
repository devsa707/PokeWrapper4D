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
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.Item));
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
      if LItemEntity.attributes.Count > 0 then
      begin
        Assert.IsNotEmpty(LItemEntity.attributes.Items[LItemEntity.attributes.Count - 1].name);
        Assert.IsNotEmpty(LItemEntity.attributes.Items[LItemEntity.attributes.Count - 1].url);
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
      Assert.IsNotEmpty(LItemEntity.effect_entries.Items[LItemEntity.effect_entries.Count - 1].language.name);
      Assert.IsNotEmpty(LItemEntity.effect_entries.Items[LItemEntity.effect_entries.Count - 1].language.url);
      // ShortEffect can result null
      // Assert.IsNotEmpty(LItemEntity.effect_entries.Items
      // [LItemEntity.effect_entries.Count - 1].short_effect);
      // node Game Indices
      Assert.IsNotEmpty(LItemEntity.game_indices.Items[LItemEntity.game_indices.Count - 1].game_index);
      Assert.IsNotEmpty(LItemEntity.game_indices.Items[LItemEntity.game_indices.Count - 1].generation.name);
      Assert.IsNotEmpty(LItemEntity.game_indices.Items[LItemEntity.game_indices.Count - 1].generation.url);
      // node Nullable Held By Pokemon
      if LItemEntity.held_by_pokemon.Count > 0 then
      begin
        Assert.IsNotEmpty(LItemEntity.held_by_pokemon.Items[LItemEntity.held_by_pokemon.Count - 1].pokemon.name);
        Assert.IsNotEmpty(LItemEntity.held_by_pokemon.Items[LItemEntity.held_by_pokemon.Count - 1].pokemon.url);
        Assert.IsNotEmpty(LItemEntity.held_by_pokemon.Items[LItemEntity.held_by_pokemon.Count - 1].version_details.Items[1].rarity);
        Assert.IsNotEmpty(LItemEntity.held_by_pokemon.Items[LItemEntity.held_by_pokemon.Count - 1].version_details.Items[1].version.name);
        Assert.IsNotEmpty(LItemEntity.held_by_pokemon.Items[LItemEntity.held_by_pokemon.Count - 1].version_details.Items[1].version.url);
      end;
      Assert.IsNotEmpty(LItemEntity.id);
      // node Languages
      Assert.IsNotEmpty(LItemEntity.names.Items[LItemEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LItemEntity.names.Items[LItemEntity.names.Count - 1].language.url);
      Assert.IsNotEmpty(LItemEntity.names.Items[LItemEntity.names.Count - 1].name);
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
