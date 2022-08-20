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
  FPokeWrapper := TPokeFactory.New(TPokemon.Move);
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
      for var use_after in LMoveEntity.contest_combos.normal.use_after do
      begin
        Assert.IsNotEmpty(use_after.name);
        Assert.IsNotEmpty(use_after.url);
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
      for var effect_changes in LMoveEntity.effect_changes do
      begin
        // short_effect can be null
        // Assert.IsNotEmpty(LMoveEntity.effect_changes.Items[0]
        // .effect_entries.Items[0].short_effect);
        for var effect_entries in effect_changes.effect_entries do
        begin
          Assert.IsNotEmpty(effect_entries.language.name);
          Assert.IsNotEmpty(effect_entries.language.url);
        end;
        Assert.IsNotEmpty(effect_changes.version_group.name);
        Assert.IsNotEmpty(effect_changes.version_group.url);
      end;
      // Node Flavor Text Entries
      for var flavor_text_entries in LMoveEntity.flavor_text_entries do
      begin
        Assert.IsNotEmpty(flavor_text_entries.flavor_text);
        Assert.IsNotEmpty(flavor_text_entries.language.name);
        Assert.IsNotEmpty(flavor_text_entries.language.url);
      end;
      // Node Generation
      Assert.IsNotEmpty(LMoveEntity.generation.name);
      Assert.IsNotEmpty(LMoveEntity.generation.url);
      //
      Assert.IsNotEmpty(LMoveEntity.id);
      // Node Learned by Pokemon
      for var learned_by_pokemon in LMoveEntity.learned_by_pokemon do
      begin
        Assert.IsNotEmpty(learned_by_pokemon.name);
        Assert.IsNotEmpty(learned_by_pokemon.url);
      end;
      // Node Machines
      for var machines in LMoveEntity.machines do
      begin
        Assert.IsNotEmpty(machines.Machine.url);
        Assert.IsNotEmpty(machines.version_group.name);
        Assert.IsNotEmpty(machines.version_group.url);
      end;
      // Node Meta
      Assert.IsNotEmpty(LMoveEntity.meta.ailment.name);
      Assert.IsNotEmpty(LMoveEntity.meta.ailment.url);
      Assert.IsNotEmpty(LMoveEntity.meta.ailment_chance);
      Assert.IsNotEmpty(LMoveEntity.meta.category.name);
      Assert.IsNotEmpty(LMoveEntity.meta.category.url);
      Assert.IsNotEmpty(LMoveEntity.meta.stat_chance);
      // Node Names
      for var names in LMoveEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
      // Node Past Values
      // node can contain nullable integer values
      for var past_values in LMoveEntity.past_values do
      begin
        Assert.IsNotEmpty(past_values.accuracy);
        Assert.IsNotEmpty(past_values.effect_chance);
        Assert.IsNotEmpty(past_values.power);
        Assert.IsNotEmpty(past_values.pp);
      end;
      // Node Stat Changes
      for var stat_changes in LMoveEntity.stat_changes do
      begin
        Assert.IsNotEmpty(stat_changes.change);
        Assert.IsNotEmpty(stat_changes.stat.name);
        Assert.IsNotEmpty(stat_changes.stat.url);
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
