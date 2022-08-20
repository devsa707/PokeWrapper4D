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
  FPokeWrapper := TPokeFactory.New(TPokemon.pokeathlon_stat);
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
      for var decrease in LPokeathlonStatEntity.affecting_natures.decrease do
      begin
        Assert.IsNotEmpty(decrease.max_change);
        Assert.IsNotEmpty(decrease.nature.name);
        Assert.IsNotEmpty(decrease.nature.url);
      end;
      // Node Affecting Natures - Increase
      for var increase in LPokeathlonStatEntity.affecting_natures.increase do
      begin
        Assert.IsNotEmpty(increase.max_change);
        Assert.IsNotEmpty(increase.nature.name);
        Assert.IsNotEmpty(increase.nature.url);
      end;
      //
      Assert.IsNotEmpty(LPokeathlonStatEntity.id);
      Assert.IsNotEmpty(LPokeathlonStatEntity.name);
      // Node Names
      for var names in LPokeathlonStatEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
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
