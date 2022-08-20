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
        for var flavor_text_entries in LSuperContestEffectEntity.flavor_text_entries do
        begin
          Assert.IsNotEmpty(flavor_text_entries.flavor_text);
          Assert.IsNotEmpty(flavor_text_entries.language.name);
          Assert.IsNotEmpty(flavor_text_entries.language.url);
        end;
        Assert.IsNotEmpty(LSuperContestEffectEntity.id);
        for var moves in LSuperContestEffectEntity.moves do
        begin
          Assert.IsNotEmpty(moves.name);
          Assert.IsNotEmpty(moves.url);
        end;
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
