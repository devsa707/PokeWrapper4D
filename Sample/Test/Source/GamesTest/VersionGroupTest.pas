unit VersionGroupTest;

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
  VersionGroup.Entity;

type

  [TestFixture]
  TVersionGroupTest = class
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

procedure TVersionGroupTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.version_group));
end;

procedure TVersionGroupTest.TestEntity;
var
  LVersionGroupEntity: TVersionGroupEntity;
begin
  Write('Testing TGames.version_group .');
  for var I: integer := 1 to 10 do
  begin
    LVersionGroupEntity := nil;
    try
      // Id pokedex 10 not found
      if I <> 10 then
      begin
        LVersionGroupEntity := TVersionGroupEntity.Create;
        FPokeWrapper.GetAsEntity(LVersionGroupEntity, I);
        // Assertions
        // node Generation
        Assert.IsNotEmpty(LVersionGroupEntity.generation.name);
        Assert.IsNotEmpty(LVersionGroupEntity.generation.url);
        //
        Assert.IsNotEmpty(LVersionGroupEntity.id);
        // node move-learn-methods
        Assert.IsNotEmpty(LVersionGroupEntity.move_learn_methods.Items[LVersionGroupEntity.move_learn_methods.Count - 1].name);
        Assert.IsNotEmpty(LVersionGroupEntity.move_learn_methods.Items[LVersionGroupEntity.move_learn_methods.Count - 1].url);
        //
        Assert.IsNotEmpty(LVersionGroupEntity.name);
        Assert.IsNotEmpty(LVersionGroupEntity.order);
        // node pokedexes
        Assert.IsNotEmpty(LVersionGroupEntity.pokedexes.Items[LVersionGroupEntity.pokedexes.Count - 1].name);
        Assert.IsNotEmpty(LVersionGroupEntity.pokedexes.Items[LVersionGroupEntity.pokedexes.Count - 1].url);
        // node regions
        Assert.IsNotEmpty(LVersionGroupEntity.regions.Items[LVersionGroupEntity.regions.Count - 1].name);
        Assert.IsNotEmpty(LVersionGroupEntity.regions.Items[LVersionGroupEntity.regions.Count - 1].url);
        // node versions
        Assert.IsNotEmpty(LVersionGroupEntity.versions.Items[LVersionGroupEntity.versions.Count - 1].name);
        Assert.IsNotEmpty(LVersionGroupEntity.versions.Items[LVersionGroupEntity.versions.Count - 1].url);
        Write('.');
      end;
    finally
      LVersionGroupEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TVersionGroupTest.TestEntityWillRaise;
var
  LVersionGroupEntity: TVersionGroupEntity;
begin
  LVersionGroupEntity := nil;
  try
    LVersionGroupEntity := TVersionGroupEntity.Create;
    FPokeWrapper.GetAsEntity(LVersionGroupEntity, 9999999);
  finally
    LVersionGroupEntity.Free;
  end;
end;

procedure TVersionGroupTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TGames.version_group...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TVersionGroupTest);

end.
