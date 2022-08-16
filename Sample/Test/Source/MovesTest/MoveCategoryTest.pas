unit MoveCategoryTest;

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
  MoveCategory.Entity;

type

  [TestFixture]
  TMoveCategoryTest = class
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

procedure TMoveCategoryTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.move_category);
end;

procedure TMoveCategoryTest.TestEntity;
var
  LMoveCategoryEntity: TMoveCategoryEntity;
begin
  Write('Testing TMove.move_category .');
  for var I: integer := 1 to FList - 1 do
  begin
    LMoveCategoryEntity := nil;
    try
      LMoveCategoryEntity := TMoveCategoryEntity.Create;
      FPokeWrapper.GetAsEntity(LMoveCategoryEntity, I);
      // Assertions
      Assert.IsNotEmpty(LMoveCategoryEntity.id);
      // Node Descriptions
      if LMoveCategoryEntity.descriptions.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveCategoryEntity.descriptions.Items[0].description);
        Assert.IsNotEmpty(LMoveCategoryEntity.descriptions.Items[0].language.name);
        Assert.IsNotEmpty(LMoveCategoryEntity.descriptions.Items[0].language.url);
      end;
      // Node Moves
      if LMoveCategoryEntity.moves.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveCategoryEntity.moves.Items[0].name);
        Assert.IsNotEmpty(LMoveCategoryEntity.moves.Items[0].url);
      end;
      Assert.IsNotEmpty(LMoveCategoryEntity.name);
      Write('.');
    finally
      LMoveCategoryEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TMoveCategoryTest.TestEntityWillRaise;
var
  LMoveCategoryEntity: TMoveCategoryEntity;
begin
  LMoveCategoryEntity := nil;
  try
    LMoveCategoryEntity := TMoveCategoryEntity.Create;
    FPokeWrapper.GetAsEntity(LMoveCategoryEntity, 9999999);
  finally
    LMoveCategoryEntity.Free;
  end;
end;

procedure TMoveCategoryTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TMove.move_category...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TMoveCategoryTest);

end.
