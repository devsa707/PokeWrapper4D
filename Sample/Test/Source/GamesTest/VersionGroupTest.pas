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
  FPokeWrapper := TPokeFactory.New(TPokemon.version_group);
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
        for var move_learn_methods in LVersionGroupEntity.move_learn_methods do
        begin
          Assert.IsNotEmpty(move_learn_methods.name);
          Assert.IsNotEmpty(move_learn_methods.url);
        end;
        //
        Assert.IsNotEmpty(LVersionGroupEntity.name);
        Assert.IsNotEmpty(LVersionGroupEntity.order);
        // node pokedexes
        for var pokedexes in LVersionGroupEntity.pokedexes do
        begin
          Assert.IsNotEmpty(pokedexes.name);
          Assert.IsNotEmpty(pokedexes.url);
        end;
        // node regions
        for var regions in LVersionGroupEntity.regions do
        begin
          Assert.IsNotEmpty(regions.name);
          Assert.IsNotEmpty(regions.url);
        end;
        // node versions
        for var versions in LVersionGroupEntity.versions do
        begin
          Assert.IsNotEmpty(versions.name);
          Assert.IsNotEmpty(versions.url);
        end;
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
