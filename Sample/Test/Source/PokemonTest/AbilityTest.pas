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
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.Ability));
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
      if LAbilityEntity.effect_changes.Count > 0 then
      begin
        Assert.IsNotEmpty(LAbilityEntity.effect_changes.Items[0].effect_entries.Items[0].effect);
        Assert.IsNotEmpty(LAbilityEntity.effect_changes.Items[0].effect_entries.Items[0].language.name);
        Assert.IsNotEmpty(LAbilityEntity.effect_changes.Items[0].effect_entries.Items[0].language.url);
      end;
      // Node Effect Entries
      if LAbilityEntity.effect_entries.Count > 0 then
      begin
        Assert.IsNotEmpty(LAbilityEntity.effect_entries.Items[0].effect);
        Assert.IsNotEmpty(LAbilityEntity.effect_entries.Items[0].language.name);
        Assert.IsNotEmpty(LAbilityEntity.effect_entries.Items[0].language.url);
        Assert.IsNotEmpty(LAbilityEntity.effect_entries.Items[0].short_effect);
      end;
      // Node Flavor Text Entries
      if LAbilityEntity.flavor_text_entries.Count > 0 then
      begin
        Assert.IsNotEmpty(LAbilityEntity.flavor_text_entries.Items[0].flavor_text);
        Assert.IsNotEmpty(LAbilityEntity.flavor_text_entries.Items[0].language.name);
        Assert.IsNotEmpty(LAbilityEntity.flavor_text_entries.Items[0].language.url);
        Assert.IsNotEmpty(LAbilityEntity.flavor_text_entries.Items[0].version_group.name);
        Assert.IsNotEmpty(LAbilityEntity.flavor_text_entries.Items[0].version_group.url);
      end;
      // Node Generation
      Assert.IsNotEmpty(LAbilityEntity.generation.name);
      Assert.IsNotEmpty(LAbilityEntity.generation.url);
      Assert.IsNotEmpty(LAbilityEntity.id);
      Assert.IsNotEmpty(LAbilityEntity.is_main_series);
      Assert.IsNotEmpty(LAbilityEntity.name);
      // Node Names
      if LAbilityEntity.names.Count > 0 then
      begin
        Assert.IsNotEmpty(LAbilityEntity.names.Items[0].language.name);
        Assert.IsNotEmpty(LAbilityEntity.names.Items[0].language.url);
        Assert.IsNotEmpty(LAbilityEntity.names.Items[0].name);
      end;
      //
      if LAbilityEntity.pokemon.Count > 0 then
      begin
        Assert.IsNotEmpty(LAbilityEntity.pokemon.Items[0].is_hidden);
        Assert.IsNotEmpty(LAbilityEntity.pokemon.Items[0].pokemon.name);
        Assert.IsNotEmpty(LAbilityEntity.pokemon.Items[0].pokemon.url);
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
