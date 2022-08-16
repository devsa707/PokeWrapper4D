unit SuperContestEffectTest;

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
  SuperContestEffect.Entity;

type

  [TestFixture]
  TSuperContestEffectTest = class
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

procedure TSuperContestEffectTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.super_contest_effect);
end;

procedure TSuperContestEffectTest.TestEntity;
var
  LSuperContestEffectEntity: TSuperContestEffectEntity;
begin
  Write('Testing TBerry.super_contest_effect .');
  for var I: integer := 1 to FList - 1 do
  begin
    LSuperContestEffectEntity := nil;
    try
      LSuperContestEffectEntity := TSuperContestEffectEntity.Create;
      // https://pokeapi.co/api/v2/super-contest-effect/3 is missing
      if I <> 3 then
      begin
        FPokeWrapper.GetAsEntity(LSuperContestEffectEntity, I);
        // Assertions
        Assert.IsNotEmpty(LSuperContestEffectEntity.appeal);
        Assert.IsNotEmpty(LSuperContestEffectEntity.flavor_text_entries.Items[LSuperContestEffectEntity.flavor_text_entries.Count - 1].flavor_text);
        Assert.IsNotEmpty(LSuperContestEffectEntity.flavor_text_entries.Items[LSuperContestEffectEntity.flavor_text_entries.Count - 1].language.name);
        Assert.IsNotEmpty(LSuperContestEffectEntity.flavor_text_entries.Items[LSuperContestEffectEntity.flavor_text_entries.Count - 1].language.url);
        Assert.IsNotEmpty(LSuperContestEffectEntity.id);
        Assert.IsNotEmpty(LSuperContestEffectEntity.moves.Items[LSuperContestEffectEntity.moves.Count - 1].name);
        Assert.IsNotEmpty(LSuperContestEffectEntity.moves.Items[LSuperContestEffectEntity.moves.Count - 1].url);
        Write('.');
      end;
    finally
      LSuperContestEffectEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TSuperContestEffectTest.TestEntityWillRaise;
var
  LSuperContestEffectEntity: TSuperContestEffectEntity;
begin
  LSuperContestEffectEntity := nil;
  try
    LSuperContestEffectEntity := TSuperContestEffectEntity.Create;
    FPokeWrapper.GetAsEntity(LSuperContestEffectEntity, 9999999);
  finally
    LSuperContestEffectEntity.Free;
  end;
end;

procedure TSuperContestEffectTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TContest.super_contest_effect...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TSuperContestEffectTest);

end.
