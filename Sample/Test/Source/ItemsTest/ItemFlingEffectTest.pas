unit ItemFlingEffectTest;

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
  ItemFlingEffect.Entity;

type

  [TestFixture]
  TItemFlingEffectTest = class
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

procedure TItemFlingEffectTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.item_fling_effect);
end;

procedure TItemFlingEffectTest.TestEntity;
var
  LItemFlingEffectEntity: TItemFlingEffectEntity;
begin
  Write('Testing TItem.item_fling_effect .');
  for var I: integer := 1 to FList - 1 do
  begin
    LItemFlingEffectEntity := nil;
    try
      LItemFlingEffectEntity := TItemFlingEffectEntity.Create;
      FPokeWrapper.GetAsEntity(LItemFlingEffectEntity, I);
      // Assertions
      // node Effect Entries
      for var effect_entries in LItemFlingEffectEntity.effect_entries do
      begin
        Assert.IsNotEmpty(effect_entries.effect);
        Assert.IsNotEmpty(effect_entries.language.name);
        Assert.IsNotEmpty(effect_entries.language.url);
      end;
      //
      Assert.IsNotEmpty(LItemFlingEffectEntity.id);
      // node Items
      for var items in LItemFlingEffectEntity.items do
      begin
        Assert.IsNotEmpty(items.name);
        Assert.IsNotEmpty(items.url);
      end;
      Write('.');
    finally
      LItemFlingEffectEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TItemFlingEffectTest.TestEntityWillRaise;
var
  LItemFlingEffectEntity: TItemFlingEffectEntity;
begin
  LItemFlingEffectEntity := nil;
  try
    LItemFlingEffectEntity := TItemFlingEffectEntity.Create;
    FPokeWrapper.GetAsEntity(LItemFlingEffectEntity, 9999999);
  finally
    LItemFlingEffectEntity.Free;
  end;
end;

procedure TItemFlingEffectTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TItem.item_fling_effect...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TItemFlingEffectTest);

end.
