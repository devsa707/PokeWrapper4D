unit PalParkAreaTest;

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
  PalParkArea.Entity;

type

  [TestFixture]
  TPalParkAreaTest = class
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

procedure TPalParkAreaTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.pal_park_area);
end;

procedure TPalParkAreaTest.TestEntity;
var
  LPalParkAreaEntity: TPalParkAreaEntity;
begin
  Write('Testing TLocation.pal_park_area .');
  for var I: integer := 1 to FList - 1 do
  begin
    LPalParkAreaEntity := nil;
    try
      LPalParkAreaEntity := TPalParkAreaEntity.Create;
      FPokeWrapper.GetAsEntity(LPalParkAreaEntity, I);
      // Assertions
      Assert.IsNotEmpty(LPalParkAreaEntity.id);
      Assert.IsNotEmpty(LPalParkAreaEntity.name);
      // Node Languages
      for var names in LPalParkAreaEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
      // Node Pokemon Encounters
      for var pokemon_encounters in LPalParkAreaEntity.pokemon_encounters do
      begin
        Assert.IsNotEmpty(pokemon_encounters.base_score);
        Assert.IsNotEmpty(pokemon_encounters.pokemon_species.name);
        Assert.IsNotEmpty(pokemon_encounters.pokemon_species.url);
      end;
      Write('.');
    finally
      LPalParkAreaEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TPalParkAreaTest.TestEntityWillRaise;
var
  LPalParkAreaEntity: TPalParkAreaEntity;
begin
  LPalParkAreaEntity := nil;
  try
    LPalParkAreaEntity := TPalParkAreaEntity.Create;
    FPokeWrapper.GetAsEntity(LPalParkAreaEntity, 9999999);
  finally
    LPalParkAreaEntity.Free;
  end;
end;

procedure TPalParkAreaTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TLocation.pal_park_area...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TPalParkAreaTest);

end.
