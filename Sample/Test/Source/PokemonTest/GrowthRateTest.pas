unit GrowthRateTest;

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
  GrowthRate.Entity;

type

  [TestFixture]
  TGrowthRateTest = class
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

procedure TGrowthRateTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.growth_rate);
end;

procedure TGrowthRateTest.TestEntity;
var
  LGrowthRateEntity: TGrowthRateEntity;
begin
  Write('Testing TPokemon.gender .');
  for var I: integer := 1 to 3 do
  begin
    LGrowthRateEntity := nil;
    try
      LGrowthRateEntity := TGrowthRateEntity.Create;
      FPokeWrapper.GetAsEntity(LGrowthRateEntity, I);
      // Assertions
      // Node Descriptions
      for var descriptions in LGrowthRateEntity.descriptions do
      begin
        Assert.IsNotEmpty(descriptions.description);
        Assert.IsNotEmpty(descriptions.language.name);
        Assert.IsNotEmpty(descriptions.language.url);
      end;
      //
      Assert.IsNotEmpty(LGrowthRateEntity.formula);
      Assert.IsNotEmpty(LGrowthRateEntity.id);
      // Node Levels
      for var levels in LGrowthRateEntity.levels do
      begin
        Assert.IsNotEmpty(levels.experience);
        Assert.IsNotEmpty(levels.level);
      end;
      // Node Pokemon Species
      for var pokemon_species in LGrowthRateEntity.pokemon_species do
      begin
        Assert.IsNotEmpty(pokemon_species.name);
        Assert.IsNotEmpty(pokemon_species.url);
      end;
      Write('.');
    finally
      LGrowthRateEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TGrowthRateTest.TestEntityWillRaise;
var
  LGrowthRateEntity: TGrowthRateEntity;
begin
  LGrowthRateEntity := nil;
  try
    LGrowthRateEntity := TGrowthRateEntity.Create;
    FPokeWrapper.GetAsEntity(LGrowthRateEntity, 9999999);
  finally
    LGrowthRateEntity.Free;
  end;
end;

procedure TGrowthRateTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TPokemon.growth_rate...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TGrowthRateTest);

end.
