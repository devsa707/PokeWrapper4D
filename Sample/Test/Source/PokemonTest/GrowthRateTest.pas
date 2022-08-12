unit GrowthRateTest;

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
  FPokeWrapper := TPokeWrapper<TPokemon>.Create;
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
      FPokeWrapper.GetAsEntity(LGrowthRateEntity,
        integer(TPokemon.growth_rate), I);
      // Assertions
      // Node Descriptions
      if LGrowthRateEntity.descriptions.Count > 0 then
      begin
        Assert.IsNotEmpty(LGrowthRateEntity.descriptions.Items[0].description);
        Assert.IsNotEmpty(LGrowthRateEntity.descriptions.Items[0]
          .language.name);
        Assert.IsNotEmpty(LGrowthRateEntity.descriptions.Items[0].language.url);
      end;
      //
      Assert.IsNotEmpty(LGrowthRateEntity.formula);
      Assert.IsNotEmpty(LGrowthRateEntity.id);
      // Node Levels
      if LGrowthRateEntity.levels.Count > 0 then
      begin
        Assert.IsNotEmpty(LGrowthRateEntity.levels.Items[0].experience);
        Assert.IsNotEmpty(LGrowthRateEntity.levels.Items[0].level);
      end;
      // Node Pokemon Species
      if LGrowthRateEntity.pokemon_species.Count > 0 then
      begin
        Assert.IsNotEmpty(LGrowthRateEntity.pokemon_species.Items[0].name);
        Assert.IsNotEmpty(LGrowthRateEntity.pokemon_species.Items[0].url);
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
    FPokeWrapper.GetAsEntity(LGrowthRateEntity,
      integer(TPokemon.growth_rate), 9999999);
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
    LPokeListEntity := FPokeWrapper.GetAsListEntity
      (integer(TPokemon.growth_rate));
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
