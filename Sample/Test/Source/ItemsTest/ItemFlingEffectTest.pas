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
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.item_fling_effect));
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
      Assert.IsNotEmpty(LItemFlingEffectEntity.effect_entries.Items[LItemFlingEffectEntity.effect_entries.Count - 1].effect);
      Assert.IsNotEmpty(LItemFlingEffectEntity.effect_entries.Items[LItemFlingEffectEntity.effect_entries.Count - 1].language.name);
      Assert.IsNotEmpty(LItemFlingEffectEntity.effect_entries.Items[LItemFlingEffectEntity.effect_entries.Count - 1].language.url);
      //
      Assert.IsNotEmpty(LItemFlingEffectEntity.id);
      // node Items
      Assert.IsNotEmpty(LItemFlingEffectEntity.Items.Items[LItemFlingEffectEntity.Items.Count - 1].name);
      Assert.IsNotEmpty(LItemFlingEffectEntity.Items.Items[LItemFlingEffectEntity.Items.Count - 1].url);
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
