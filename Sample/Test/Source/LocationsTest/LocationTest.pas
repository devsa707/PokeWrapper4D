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
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.Location));
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
      if LLocationEntity.areas.Count > 0 then
      begin
        Assert.IsNotEmpty(LLocationEntity.areas.Items[LLocationEntity.areas.Count - 1].name);
        Assert.IsNotEmpty(LLocationEntity.areas.Items[LLocationEntity.areas.Count - 1].url);
      end;
      // node Game Indices
      Assert.IsNotEmpty(LLocationEntity.game_indices.Items[LLocationEntity.game_indices.Count - 1].game_index);
      Assert.IsNotEmpty(LLocationEntity.game_indices.Items[LLocationEntity.game_indices.Count - 1].generation.name);
      Assert.IsNotEmpty(LLocationEntity.game_indices.Items[LLocationEntity.game_indices.Count - 1].generation.url);
      //
      Assert.IsNotEmpty(LLocationEntity.id);
      Assert.IsNotEmpty(LLocationEntity.name);
      // node Languages
      Assert.IsNotEmpty(LLocationEntity.names.Items[LLocationEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LLocationEntity.names.Items[LLocationEntity.names.Count - 1].language.url);
      Assert.IsNotEmpty(LLocationEntity.names.Items[LLocationEntity.names.Count - 1].name);
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
