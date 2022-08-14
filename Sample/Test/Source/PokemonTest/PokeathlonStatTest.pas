unit PokeathlonStatTest;

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
  PokeathlonStat.Entity;

type

  [TestFixture]
  TPokeathlonStatTest = class
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

procedure TPokeathlonStatTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.pokeathlon_stat));
end;

procedure TPokeathlonStatTest.TestEntity;
var
  LPokeathlonStatEntity: TPokeathlonStatEntity;
begin
  Write('Testing TPokemon.pokeathlon_stat .');
  for var I: integer := 1 to FList - 1 do
  begin
    LPokeathlonStatEntity := nil;
    try
      LPokeathlonStatEntity := TPokeathlonStatEntity.Create;
      FPokeWrapper.GetAsEntity(LPokeathlonStatEntity, I);
      // Assertions
      Assert.IsNotEmpty(LPokeathlonStatEntity.id);
      // Node Affecting Natures - Decrease
      if LPokeathlonStatEntity.affecting_natures.decrease.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokeathlonStatEntity.affecting_natures.decrease.Items[0].max_change);
        Assert.IsNotEmpty(LPokeathlonStatEntity.affecting_natures.decrease.Items[0].nature.name);
        Assert.IsNotEmpty(LPokeathlonStatEntity.affecting_natures.decrease.Items[0].nature.url);
      end;
      // Node Affecting Natures - Increase
      if LPokeathlonStatEntity.affecting_natures.increase.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokeathlonStatEntity.affecting_natures.increase.Items[0].max_change);
        Assert.IsNotEmpty(LPokeathlonStatEntity.affecting_natures.increase.Items[0].nature.name);
        Assert.IsNotEmpty(LPokeathlonStatEntity.affecting_natures.increase.Items[0].nature.url);
      end;
      //
      Assert.IsNotEmpty(LPokeathlonStatEntity.id);
      Assert.IsNotEmpty(LPokeathlonStatEntity.name);
      // Node Names
      if LPokeathlonStatEntity.names.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokeathlonStatEntity.names.Items[0].language.name);
        Assert.IsNotEmpty(LPokeathlonStatEntity.names.Items[0].language.url);
        Assert.IsNotEmpty(LPokeathlonStatEntity.names.Items[0].name);
      end;
      Write('.');
    finally
      LPokeathlonStatEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TPokeathlonStatTest.TestEntityWillRaise;
var
  LPokeathlonStatEntity: TPokeathlonStatEntity;
begin
  LPokeathlonStatEntity := nil;
  try
    LPokeathlonStatEntity := TPokeathlonStatEntity.Create;
    FPokeWrapper.GetAsEntity(LPokeathlonStatEntity, 9999999);
  finally
    LPokeathlonStatEntity.Free;
  end;
end;

procedure TPokeathlonStatTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TPokemon.pokeathlon_stat...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TPokeathlonStatTest);

end.
