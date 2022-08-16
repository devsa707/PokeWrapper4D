unit EvolutionChainTest;

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
  EvolutionChain.Entity;

type

  [TestFixture]
  TEvolutionChainTest = class
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

procedure TEvolutionChainTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.evolution_chain);
end;

procedure TEvolutionChainTest.TestEntity;
var
  LEvolutionChainEntity: TEvolutionChainEntity;
begin
  Write('Testing TEncounter.encounter_method .');
  for var I: integer := 1 to FList - 1 do
  begin
    LEvolutionChainEntity := nil;
    try
      LEvolutionChainEntity := TEvolutionChainEntity.Create;
      FPokeWrapper.GetAsEntity(LEvolutionChainEntity, I);
      // Assertions
      Assert.IsNotEmpty(LEvolutionChainEntity.id);
      Write('.');
    finally
      LEvolutionChainEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TEvolutionChainTest.TestEntityWillRaise;
var
  LEvolutionChainEntity: TEvolutionChainEntity;
begin
  LEvolutionChainEntity := nil;
  try
    LEvolutionChainEntity := TEvolutionChainEntity.Create;
    FPokeWrapper.GetAsEntity(LEvolutionChainEntity, 9999999);
  finally
    LEvolutionChainEntity.Free;
  end;
end;

procedure TEvolutionChainTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TEncounter.encounter_method...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    if LPokeListEntity.Count < 100 then
      FList := LPokeListEntity.Count
    else
      FList := 100;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TEvolutionChainTest);

end.
