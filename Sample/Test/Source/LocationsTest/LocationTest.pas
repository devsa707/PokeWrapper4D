unit LocationTest;

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
  Location.Entity;

type

  [TestFixture]
  TLocationTest = class
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

procedure TLocationTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.Location);
end;

procedure TLocationTest.TestEntity;
var
  LLocationEntity: TLocationEntity;
begin
  Write('Testing TLocation.location .');
  for var I: integer := 1 to 10 do
  begin
    LLocationEntity := nil;
    try
      LLocationEntity := TLocationEntity.Create;
      FPokeWrapper.GetAsEntity(LLocationEntity, I);
      // Assertions
      // node Nullable Areas
      for var areas in LLocationEntity.areas do
      begin
        Assert.IsNotEmpty(areas.name);
        Assert.IsNotEmpty(areas.url);
      end;
      // node Game Indices
      for var game_indices in LLocationEntity.game_indices do
      begin
        Assert.IsNotEmpty(game_indices.game_index);
        Assert.IsNotEmpty(game_indices.generation.name);
        Assert.IsNotEmpty(game_indices.generation.url);
      end;
      //
      Assert.IsNotEmpty(LLocationEntity.id);
      Assert.IsNotEmpty(LLocationEntity.name);
      // node Languages
      for var names in LLocationEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
      Write('.');
    finally
      LLocationEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TLocationTest.TestEntityWillRaise;
var
  LLocationEntity: TLocationEntity;
begin
  LLocationEntity := nil;
  try
    LLocationEntity := TLocationEntity.Create;
    FPokeWrapper.GetAsEntity(LLocationEntity, 9999999);
  finally
    LLocationEntity.Free;
  end;
end;

procedure TLocationTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TLocation.location...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TLocationTest);

end.
