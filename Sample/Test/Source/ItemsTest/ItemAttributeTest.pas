unit ItemAttributeTest;

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
  ItemAttribute.Entity;

type

  [TestFixture]
  TItemAttributeTest = class
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

procedure TItemAttributeTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.item_attribute);
end;

procedure TItemAttributeTest.TestEntity;
var
  LItemAttributeEntity: TItemAttributeEntity;
begin
  Write('Testing TItem.item_attribute .');
  for var I: integer := 1 to 5 do
  begin
    LItemAttributeEntity := nil;
    try
      LItemAttributeEntity := TItemAttributeEntity.Create;
      FPokeWrapper.GetAsEntity(LItemAttributeEntity, I);
      // Assertions
      // node Descriptions
      Assert.IsNotEmpty(LItemAttributeEntity.descriptions.Items[LItemAttributeEntity.descriptions.Count - 1].description);
      Assert.IsNotEmpty(LItemAttributeEntity.descriptions.Items[LItemAttributeEntity.descriptions.Count - 1].language.name);
      Assert.IsNotEmpty(LItemAttributeEntity.descriptions.Items[LItemAttributeEntity.descriptions.Count - 1].language.url);
      //
      Assert.IsNotEmpty(LItemAttributeEntity.id);
      // node Nullable Items
      if LItemAttributeEntity.Items.Count > 0 then
      begin
        Assert.IsNotEmpty(LItemAttributeEntity.Items.Items[LItemAttributeEntity.Items.Count - 1].name);
        Assert.IsNotEmpty(LItemAttributeEntity.Items.Items[LItemAttributeEntity.Items.Count - 1].url);
      end;
      //
      Assert.IsNotEmpty(LItemAttributeEntity.name);
      // node Languages
      Assert.IsNotEmpty(LItemAttributeEntity.names.Items[LItemAttributeEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LItemAttributeEntity.names.Items[LItemAttributeEntity.names.Count - 1].language.url);
      Assert.IsNotEmpty(LItemAttributeEntity.names.Items[LItemAttributeEntity.names.Count - 1].name);
      Write('.');
    finally
      LItemAttributeEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TItemAttributeTest.TestEntityWillRaise;
var
  LItemAttributeEntity: TItemAttributeEntity;
begin
  LItemAttributeEntity := nil;
  try
    LItemAttributeEntity := TItemAttributeEntity.Create;
    FPokeWrapper.GetAsEntity(LItemAttributeEntity, 9999999);
  finally
    LItemAttributeEntity.Free;
  end;
end;

procedure TItemAttributeTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TItem.item_attribute...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TItemAttributeTest);

end.
