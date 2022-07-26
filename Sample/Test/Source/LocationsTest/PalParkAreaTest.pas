unit PalParkAreaTest;

interface

uses
  System.SysUtils,
  //
  DUnitX.TestFramework,
  // PokeAPI
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
  FPokeWrapper := TPokeWrapper<TLocation>.Create;
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
      FPokeWrapper.GetAsEntity(LPalParkAreaEntity,
        integer(TLocation.pal_park_area), I);
      // Assertions
      Assert.IsNotEmpty(LPalParkAreaEntity.id);
      Assert.IsNotEmpty(LPalParkAreaEntity.name);
      // Node Languages
      Assert.IsNotEmpty(LPalParkAreaEntity.names.Items
        [LPalParkAreaEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LPalParkAreaEntity.names.Items
        [LPalParkAreaEntity.names.Count - 1].language.url);
      Assert.IsNotEmpty(LPalParkAreaEntity.names.Items
        [LPalParkAreaEntity.names.Count - 1].name);
      // Node Pokemon Encounters
      Assert.IsNotEmpty(LPalParkAreaEntity.pokemon_encounters.Items
        [LPalParkAreaEntity.pokemon_encounters.Count - 1].base_score);
      Assert.IsNotEmpty(LPalParkAreaEntity.pokemon_encounters.Items
        [LPalParkAreaEntity.pokemon_encounters.Count - 1].pokemon_species.name);
      Assert.IsNotEmpty(LPalParkAreaEntity.pokemon_encounters.Items
        [LPalParkAreaEntity.pokemon_encounters.Count - 1].pokemon_species.url);
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
    FPokeWrapper.GetAsEntity(LPalParkAreaEntity,
      integer(TLocation.pal_park_area), 9999999);
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
    LPokeListEntity := FPokeWrapper.GetAsListEntity
      (integer(TLocation.pal_park_area));
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
