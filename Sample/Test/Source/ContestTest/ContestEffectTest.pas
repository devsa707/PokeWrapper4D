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
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.contest_effect));
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
      Assert.IsNotEmpty(LContestEffectEntity.effect_entries.Items[LContestEffectEntity.effect_entries.Count - 1].effect);
      Assert.IsNotEmpty(LContestEffectEntity.effect_entries.Items[LContestEffectEntity.effect_entries.Count - 1].language.name);
      Assert.IsNotEmpty(LContestEffectEntity.effect_entries.Items[LContestEffectEntity.effect_entries.Count - 1].language.url);
      Assert.IsNotEmpty(LContestEffectEntity.flavor_text_entries.Items[LContestEffectEntity.flavor_text_entries.Count - 1].flavor_text);
      Assert.IsNotEmpty(LContestEffectEntity.flavor_text_entries.Items[LContestEffectEntity.flavor_text_entries.Count - 1].language.name);
      Assert.IsNotEmpty(LContestEffectEntity.flavor_text_entries.Items[LContestEffectEntity.flavor_text_entries.Count - 1].language.url);
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
