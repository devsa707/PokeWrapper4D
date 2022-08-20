unit AbilityTest;

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
  Ability.Entity;

type

  [TestFixture]
  TAbilityTest = class
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

procedure TAbilityTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.Ability);
end;

procedure TAbilityTest.TestEntity;
var
  LAbilityEntity: TAbilityEntity;
begin
  Write('Testing TPokemon.ability .');
  for var I: integer := 1 to 10 do
  begin
    LAbilityEntity := nil;
    try
      LAbilityEntity := TAbilityEntity.Create;
      FPokeWrapper.GetAsEntity(LAbilityEntity, I);
      // Assertions
      // Node Effect Changes
      for var effect_changes in LAbilityEntity.effect_changes do
      begin
        for var effect_entries in effect_changes.effect_entries do
        begin
          Assert.IsNotEmpty(effect_entries.effect);
          Assert.IsNotEmpty(effect_entries.language.name);
          Assert.IsNotEmpty(effect_entries.language.url);
        end;
        Assert.IsNotEmpty(effect_changes.version_group.name);
        Assert.IsNotEmpty(effect_changes.version_group.url);
      end;
      // Node Effect Entries
      for var effect_entries in LAbilityEntity.effect_entries do
      begin
        Assert.IsNotEmpty(effect_entries.effect);
        Assert.IsNotEmpty(effect_entries.language.name);
        Assert.IsNotEmpty(effect_entries.language.url);
        Assert.IsNotEmpty(effect_entries.short_effect);
      end;
      // Node Flavor Text Entries
      for var flavor_text_entries in LAbilityEntity.flavor_text_entries do
      begin
        Assert.IsNotEmpty(flavor_text_entries.flavor_text);
        Assert.IsNotEmpty(flavor_text_entries.language.name);
        Assert.IsNotEmpty(flavor_text_entries.language.url);
        Assert.IsNotEmpty(flavor_text_entries.version_group.name);
        Assert.IsNotEmpty(flavor_text_entries.version_group.url);
      end;
      // Node Generation
      Assert.IsNotEmpty(LAbilityEntity.generation.name);
      Assert.IsNotEmpty(LAbilityEntity.generation.url);
      Assert.IsNotEmpty(LAbilityEntity.id);
      Assert.IsNotEmpty(LAbilityEntity.is_main_series);
      Assert.IsNotEmpty(LAbilityEntity.name);
      // Node Names
      for var names in LAbilityEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
      //
      for var pokemon in LAbilityEntity.pokemon do
      begin
        Assert.IsNotEmpty(pokemon.is_hidden);
        Assert.IsNotEmpty(pokemon.pokemon.name);
        Assert.IsNotEmpty(pokemon.pokemon.url);
      end;
      Write('.');
    finally
      LAbilityEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TAbilityTest.TestEntityWillRaise;
var
  LAbilityEntity: TAbilityEntity;
begin
  LAbilityEntity := nil;
  try
    LAbilityEntity := TAbilityEntity.Create;
    FPokeWrapper.GetAsEntity(LAbilityEntity, 9999999);
  finally
    LAbilityEntity.Free;
  end;
end;

procedure TAbilityTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TPokemon.ability...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TAbilityTest);

end.
