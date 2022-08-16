unit GenerationTest;

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
  Generation.Entity;

type

  [TestFixture]
  TGenerationTest = class
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

procedure TGenerationTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.Generation);
end;

procedure TGenerationTest.TestEntity;
var
  LGenerationEntity: TGenerationEntity;
begin
  Write('Testing TGames.generation .');
  for var I: integer := 1 to FList - 1 do
  begin
    LGenerationEntity := nil;
    try
      LGenerationEntity := TGenerationEntity.Create;
      FPokeWrapper.GetAsEntity(LGenerationEntity, I);
      // Assertions
      // node abilities moves
      if LGenerationEntity.abilities.Count <> 0 then
      begin
        Assert.IsNotEmpty(LGenerationEntity.abilities.Items[LGenerationEntity.abilities.Count - 1].name);
        Assert.IsNotEmpty(LGenerationEntity.abilities.Items[LGenerationEntity.abilities.Count - 1].url);
      end;
      Assert.IsNotEmpty(LGenerationEntity.id);
      Assert.IsNotEmpty(LGenerationEntity.main_region.name);
      Assert.IsNotEmpty(LGenerationEntity.main_region.url);
      // node nullable moves
      if LGenerationEntity.moves.Count <> 0 then
      begin
        Assert.IsNotEmpty(LGenerationEntity.moves.Items[LGenerationEntity.moves.Count - 1].name);
        Assert.IsNotEmpty(LGenerationEntity.moves.Items[LGenerationEntity.moves.Count - 1].url);
      end;
      Assert.IsNotEmpty(LGenerationEntity.name);
      // node language
      Assert.IsNotEmpty(LGenerationEntity.names.Items[LGenerationEntity.names.Count - 1].name);
      Assert.IsNotEmpty(LGenerationEntity.names.Items[LGenerationEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LGenerationEntity.names.Items[LGenerationEntity.names.Count - 1].language.url);
      // node pokemon_species
      Assert.IsNotEmpty(LGenerationEntity.pokemon_species.Items[LGenerationEntity.pokemon_species.Count - 1].name);
      Assert.IsNotEmpty(LGenerationEntity.pokemon_species.Items[LGenerationEntity.pokemon_species.Count - 1].url);
      // node nullable types
      if LGenerationEntity.Types.Count <> 0 then
      begin
        Assert.IsNotEmpty(LGenerationEntity.Types.Items[LGenerationEntity.Types.Count - 1].name);
        Assert.IsNotEmpty(LGenerationEntity.Types.Items[LGenerationEntity.Types.Count - 1].url);
      end;
      Write('.');
    finally
      LGenerationEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TGenerationTest.TestEntityWillRaise;
var
  LGenerationEntity: TGenerationEntity;
begin
  LGenerationEntity := nil;
  try
    LGenerationEntity := TGenerationEntity.Create;
    FPokeWrapper.GetAsEntity(LGenerationEntity, 9999999);
  finally
    LGenerationEntity.Free;
  end;
end;

procedure TGenerationTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TGames.generation...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TGenerationTest);

end.
