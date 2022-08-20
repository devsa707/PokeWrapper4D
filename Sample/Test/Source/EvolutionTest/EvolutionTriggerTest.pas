unit EvolutionTriggerTest;

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
  EvolutionTrigger.Entity;

type

  [TestFixture]
  TEvolutionTriggerTest = class
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

procedure TEvolutionTriggerTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.evolution_trigger);
end;

procedure TEvolutionTriggerTest.TestEntity;
var
  LEvolutionTriggerEntity: TEvolutionTriggerEntity;
begin
  Write('Testing TEvolution.evolution_trigger .');
  for var I: integer := 1 to FList - 1 do
  begin
    LEvolutionTriggerEntity := nil;
    try
      LEvolutionTriggerEntity := TEvolutionTriggerEntity.Create;
      FPokeWrapper.GetAsEntity(LEvolutionTriggerEntity, I);
      // Assertions
      Assert.IsNotEmpty(LEvolutionTriggerEntity.id);
      Assert.IsNotEmpty(LEvolutionTriggerEntity.name);
      for var names in LEvolutionTriggerEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
      for var pokemon_species in LEvolutionTriggerEntity.pokemon_species do
      begin
        Assert.IsNotEmpty(pokemon_species.name);
        Assert.IsNotEmpty(pokemon_species.url);
      end;
      Write('.');
    finally
      LEvolutionTriggerEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TEvolutionTriggerTest.TestEntityWillRaise;
var
  LEvolutionTriggerEntity: TEvolutionTriggerEntity;
begin
  LEvolutionTriggerEntity := nil;
  try
    LEvolutionTriggerEntity := TEvolutionTriggerEntity.Create;
    FPokeWrapper.GetAsEntity(LEvolutionTriggerEntity, 9999999);
  finally
    LEvolutionTriggerEntity.Free;
  end;
end;

procedure TEvolutionTriggerTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TEvolution.evolution_trigger...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TEvolutionTriggerTest);

end.
