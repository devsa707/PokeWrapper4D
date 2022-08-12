unit EggGroupTest;

interface

uses
  System.SysUtils,
  //
  DUnitX.TestFramework,
  // PokeAPI
  PokeWrapper,
  PokeWrapper.Interfaces,
  PokeWrapper.Types,
  //
  PokeList.Entity,
  EggGroup.Entity;

type

  [TestFixture]
  TEggGroupTest = class
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

procedure TEggGroupTest.Setup;
begin
  FPokeWrapper := TPokeWrapper<TPokemon>.Create;
end;

procedure TEggGroupTest.TestEntity;
var
  LEggGroupEntity: TEggGroupEntity;
begin
  Write('Testing TPokemon.egg_group .');
  for var I: integer := 1 to 10 do
  begin
    LEggGroupEntity := nil;
    try
      LEggGroupEntity := TEggGroupEntity.Create;
      FPokeWrapper.GetAsEntity(LEggGroupEntity, integer(TPokemon.egg_group), I);
      // Assertions
      Assert.IsNotEmpty(LEggGroupEntity.id);
      Assert.IsNotEmpty(LEggGroupEntity.name);
      // Node Names
      if LEggGroupEntity.names.Count > 0 then
      begin
        Assert.IsNotEmpty(LEggGroupEntity.names.Items[0].name);
        Assert.IsNotEmpty(LEggGroupEntity.names.Items[0].language.name);
        Assert.IsNotEmpty(LEggGroupEntity.names.Items[0].language.url);
      end;
      // Node Pokemon Species
      if LEggGroupEntity.pokemon_species.Count > 0 then
      begin
        Assert.IsNotEmpty(LEggGroupEntity.pokemon_species.Items[0].name);
        Assert.IsNotEmpty(LEggGroupEntity.pokemon_species.Items[0].url);
      end;
      Write('.');
    finally
      LEggGroupEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TEggGroupTest.TestEntityWillRaise;
var
  LEggGroupEntity: TEggGroupEntity;
begin
  LEggGroupEntity := nil;
  try
    LEggGroupEntity := TEggGroupEntity.Create;
    FPokeWrapper.GetAsEntity(LEggGroupEntity,
      integer(TPokemon.egg_group), 9999999);
  finally
    LEggGroupEntity.Free;
  end;
end;

procedure TEggGroupTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TPokemon.egg_group...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity
      (integer(TPokemon.egg_group));
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TEggGroupTest);

end.
