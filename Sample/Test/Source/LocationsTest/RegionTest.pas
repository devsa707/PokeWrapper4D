unit RegionTest;

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
  Region.Entity;

type

  [TestFixture]
  TRegionTest = class
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

procedure TRegionTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.Region);
end;

procedure TRegionTest.TestEntity;
var
  LRegionEntity: TRegionEntity;
begin
  Write('Testing TLocation.region .');
  for var I: integer := 1 to FList - 1 do
  begin
    LRegionEntity := nil;
    try
      LRegionEntity := TRegionEntity.Create;
      FPokeWrapper.GetAsEntity(LRegionEntity, I);
      // Assertions
      Assert.IsNotEmpty(LRegionEntity.id);
      Assert.IsNotEmpty(LRegionEntity.name);
      // Node Languages
      Assert.IsNotEmpty(LRegionEntity.names.Items[LRegionEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LRegionEntity.names.Items[LRegionEntity.names.Count - 1].language.url);
      Assert.IsNotEmpty(LRegionEntity.names.Items[LRegionEntity.names.Count - 1].name);
      // Node Pokedexes
      Assert.IsNotEmpty(LRegionEntity.pokedexes.Items[LRegionEntity.pokedexes.Count - 1].name);
      Assert.IsNotEmpty(LRegionEntity.pokedexes.Items[LRegionEntity.pokedexes.Count - 1].url);
      // Node Version Groups
      Assert.IsNotEmpty(LRegionEntity.version_groups.Items[LRegionEntity.version_groups.Count - 1].name);
      Assert.IsNotEmpty(LRegionEntity.version_groups.Items[LRegionEntity.version_groups.Count - 1].url);

      Write('.');
    finally
      LRegionEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TRegionTest.TestEntityWillRaise;
var
  LRegionEntity: TRegionEntity;
begin
  LRegionEntity := nil;
  try
    LRegionEntity := TRegionEntity.Create;
    FPokeWrapper.GetAsEntity(LRegionEntity, 9999999);
  finally
    LRegionEntity.Free;
  end;
end;

procedure TRegionTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TLocation.region...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TRegionTest);

end.
