unit ItemPocketTest;

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
  ItemPocket.Entity;

type

  [TestFixture]
  TItemPocketTest = class
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

procedure TItemPocketTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.item_pocket));
end;

procedure TItemPocketTest.TestEntity;
var
  LItemPocketEntity: TItemPocketEntity;
begin
  Write('Testing TItem.item_pocket .');
  for var I: integer := 1 to FList - 1 do
  begin
    LItemPocketEntity := nil;
    try
      LItemPocketEntity := TItemPocketEntity.Create;
      FPokeWrapper.GetAsEntity(LItemPocketEntity, I);
      // Assertions
      // node Effect Entries
      Assert.IsNotEmpty(LItemPocketEntity.categories.Items[LItemPocketEntity.categories.Count - 1].name);
      Assert.IsNotEmpty(LItemPocketEntity.categories.Items[LItemPocketEntity.categories.Count - 1].url);
      //
      Assert.IsNotEmpty(LItemPocketEntity.id);
      Assert.IsNotEmpty(LItemPocketEntity.name);
      // node Items
      Assert.IsNotEmpty(LItemPocketEntity.names.Items[LItemPocketEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LItemPocketEntity.names.Items[LItemPocketEntity.names.Count - 1].language.url);
      Assert.IsNotEmpty(LItemPocketEntity.names.Items[LItemPocketEntity.names.Count - 1].name);
      Write('.');
    finally
      LItemPocketEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TItemPocketTest.TestEntityWillRaise;
var
  LItemPocketEntity: TItemPocketEntity;
begin
  LItemPocketEntity := nil;
  try
    LItemPocketEntity := TItemPocketEntity.Create;
    FPokeWrapper.GetAsEntity(LItemPocketEntity, 9999999);
  finally
    LItemPocketEntity.Free;
  end;
end;

procedure TItemPocketTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TItem.item_pocket...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TItemPocketTest);

end.
