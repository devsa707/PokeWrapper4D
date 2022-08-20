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
      for var descriptions in LItemAttributeEntity.descriptions do
      begin
        Assert.IsNotEmpty(descriptions.description);
        Assert.IsNotEmpty(descriptions.language.name);
        Assert.IsNotEmpty(descriptions.language.url);
      end;
      //
      Assert.IsNotEmpty(LItemAttributeEntity.id);
      // node Items
      for var Items in LItemAttributeEntity.Items do
      begin
        Assert.IsNotEmpty(Items.name);
        Assert.IsNotEmpty(Items.url);
      end;
      //
      Assert.IsNotEmpty(LItemAttributeEntity.name);
      // node Languages
      for var names in LItemAttributeEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
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
