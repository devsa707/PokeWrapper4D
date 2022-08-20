unit ContestEffectTest;

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
  ContestEffect.Entity;

type

  [TestFixture]
  TContestEffectTest = class
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

procedure TContestEffectTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.contest_effect);
end;

procedure TContestEffectTest.TestEntity;
var
  LContestEffectEntity: TContestEffectEntity;
begin
  Write('Testing TBerry.contest_effect .');
  for var I: integer := 1 to FList - 1 do
  begin
    LContestEffectEntity := nil;
    try
      LContestEffectEntity := TContestEffectEntity.Create;
      FPokeWrapper.GetAsEntity(LContestEffectEntity, I);
      // Assertions
      Assert.IsNotEmpty(LContestEffectEntity.appeal);
      for var effect_entries in LContestEffectEntity.effect_entries do
      begin
        Assert.IsNotEmpty(effect_entries.effect);
        Assert.IsNotEmpty(effect_entries.language.name);
        Assert.IsNotEmpty(effect_entries.language.url);
      end;
      for var flavor_text_entries in LContestEffectEntity.flavor_text_entries do
      begin
        Assert.IsNotEmpty(flavor_text_entries.flavor_text);
        Assert.IsNotEmpty(flavor_text_entries.language.name);
        Assert.IsNotEmpty(flavor_text_entries.language.url);
      end;
      Assert.IsNotEmpty(LContestEffectEntity.id);
      Assert.IsNotEmpty(LContestEffectEntity.jam);
      Write('.');
    finally
      LContestEffectEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TContestEffectTest.TestEntityWillRaise;
var
  LContestEffectEntity: TContestEffectEntity;
begin
  LContestEffectEntity := nil;
  try
    LContestEffectEntity := TContestEffectEntity.Create;
    FPokeWrapper.GetAsEntity(LContestEffectEntity, 9999999);
  finally
    LContestEffectEntity.Free;
  end;
end;

procedure TContestEffectTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TContest.contest_effect...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TContestEffectTest);

end.
