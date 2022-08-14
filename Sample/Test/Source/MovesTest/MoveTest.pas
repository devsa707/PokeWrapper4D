unit MoveTest;

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
  Move.Entity;

type

  [TestFixture]
  TMoveTest = class
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

procedure TMoveTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.Move));
end;

procedure TMoveTest.TestEntity;
var
  LMoveEntity: TMoveEntity;
begin
  Write('Testing TMove.move .');
  for var I: integer := 1 to 20 do
  begin
    LMoveEntity := nil;
    try
      LMoveEntity := TMoveEntity.Create;
      FPokeWrapper.GetAsEntity(LMoveEntity, I);
      // Assertions
      Assert.IsNotEmpty(LMoveEntity.accuracy);
      // Node Contest Combos
      if LMoveEntity.contest_combos.normal.use_after.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveEntity.contest_combos.normal.use_after[0].name);
        Assert.IsNotEmpty(LMoveEntity.contest_combos.normal.use_after[0].url);
      end;
      // Node Contest Effect
      // contest can be null
      if not LMoveEntity.contest_effect.name.IsEmpty then
      begin
        Assert.IsNotEmpty(LMoveEntity.contest_effect.name);
        Assert.IsNotEmpty(LMoveEntity.contest_effect.url);
      end;
      // Node Contest Type
      Assert.IsNotEmpty(LMoveEntity.contest_type.name);
      Assert.IsNotEmpty(LMoveEntity.contest_type.url);
      // Node Damage Class
      Assert.IsNotEmpty(LMoveEntity.damage_class.name);
      Assert.IsNotEmpty(LMoveEntity.damage_class.url);
      //
      // effect_chance can be null
      // Assert.IsNotEmpty(LMoveEntity.effect_chance);
      // Node Effect Changes
      if LMoveEntity.effect_changes.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveEntity.effect_changes.Items[0].effect_entries.Items[0].effect);
        // short_effect can be null
        // Assert.IsNotEmpty(LMoveEntity.effect_changes.Items[0]
        // .effect_entries.Items[0].short_effect);
        Assert.IsNotEmpty(LMoveEntity.effect_changes.Items[0].effect_entries.Items[0].language.name);
        Assert.IsNotEmpty(LMoveEntity.effect_changes.Items[0].effect_entries.Items[0].language.url);
        Assert.IsNotEmpty(LMoveEntity.effect_changes.Items[0].version_group.name);
        Assert.IsNotEmpty(LMoveEntity.effect_changes.Items[0].version_group.url);
      end;
      // Node Flavor Text Entries
      if LMoveEntity.flavor_text_entries.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveEntity.flavor_text_entries.Items[0].flavor_text);
        Assert.IsNotEmpty(LMoveEntity.flavor_text_entries.Items[0].language.name);
        Assert.IsNotEmpty(LMoveEntity.flavor_text_entries.Items[0].language.url);
      end;
      // Node Generation
      Assert.IsNotEmpty(LMoveEntity.generation.name);
      Assert.IsNotEmpty(LMoveEntity.generation.url);
      //
      Assert.IsNotEmpty(LMoveEntity.id);
      // Node Learned by Pokemon
      if LMoveEntity.learned_by_pokemon.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveEntity.learned_by_pokemon.Items[0].name);
        Assert.IsNotEmpty(LMoveEntity.learned_by_pokemon.Items[0].url);
      end;
      // Node Machines
      if LMoveEntity.machines.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveEntity.machines.Items[0].Machine.url);
        Assert.IsNotEmpty(LMoveEntity.machines.Items[0].version_group.name);
        Assert.IsNotEmpty(LMoveEntity.machines.Items[0].version_group.url);
      end;
      // Node Meta
      Assert.IsNotEmpty(LMoveEntity.meta.ailment.name);
      Assert.IsNotEmpty(LMoveEntity.meta.ailment.url);
      Assert.IsNotEmpty(LMoveEntity.meta.ailment_chance);
      Assert.IsNotEmpty(LMoveEntity.meta.category.name);
      Assert.IsNotEmpty(LMoveEntity.meta.category.url);
      Assert.IsNotEmpty(LMoveEntity.meta.stat_chance);
      // Node Names
      if LMoveEntity.names.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveEntity.names.Items[0].language.name);
        Assert.IsNotEmpty(LMoveEntity.names.Items[0].language.url);
        Assert.IsNotEmpty(LMoveEntity.names.Items[0].name);
      end;
      // Node Past Values
      // node can contain nullable integer values
      if LMoveEntity.past_values.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveEntity.past_values.Items[0].accuracy);
        Assert.IsNotEmpty(LMoveEntity.past_values.Items[0].effect_chance);
        Assert.IsNotEmpty(LMoveEntity.past_values.Items[0].power);
        Assert.IsNotEmpty(LMoveEntity.past_values.Items[0].pp);
      end;
      // Node Stat Changes
      if LMoveEntity.stat_changes.Count > 0 then
      begin
        Assert.IsNotEmpty(LMoveEntity.stat_changes.Items[0].change);
        Assert.IsNotEmpty(LMoveEntity.stat_changes.Items[0].stat.name);
        Assert.IsNotEmpty(LMoveEntity.stat_changes.Items[0].stat.url);
      end;
      Assert.IsNotEmpty(LMoveEntity.super_contest_effect.url);
      Assert.IsNotEmpty(LMoveEntity.target.name);
      Assert.IsNotEmpty(LMoveEntity.target.url);
      // type_ can be null
      if not LMoveEntity.type_.name.IsEmpty then
      begin
        Assert.IsNotEmpty(LMoveEntity.type_.name);
        Assert.IsNotEmpty(LMoveEntity.type_.url);
      end;
      Write('.');
    finally
      LMoveEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TMoveTest.TestEntityWillRaise;
var
  LMoveEntity: TMoveEntity;
begin
  LMoveEntity := nil;
  try
    LMoveEntity := TMoveEntity.Create;
    FPokeWrapper.GetAsEntity(LMoveEntity, 9999999);
  finally
    LMoveEntity.Free;
  end;
end;

procedure TMoveTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TMove.move...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TMoveTest);

end.
