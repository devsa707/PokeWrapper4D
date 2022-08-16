unit PokemonFormsTest;

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
  PokemonForm.Entity;

type

  [TestFixture]
  TPokemonFormsTest = class
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

procedure TPokemonFormsTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.pokemon_form);
end;

procedure TPokemonFormsTest.TestEntity;
var
  LPokemonFormEntity: TPokemonFormEntity;
begin
  Write('Testing TPokemon.pokemon_form .');
  for var I: integer := 1 to 10 do
  begin
    LPokemonFormEntity := nil;
    try
      LPokemonFormEntity := TPokemonFormEntity.Create;
      FPokeWrapper.GetAsEntity(LPokemonFormEntity, I);
      // Assertions
      Assert.IsNotEmpty(LPokemonFormEntity.id);
      Assert.IsNotEmpty(LPokemonFormEntity.name);
      // Node Form Names
      if LPokemonFormEntity.form_names.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonFormEntity.form_names.Items[0].name);
        Assert.IsNotEmpty(LPokemonFormEntity.form_names.Items[0].language.name);
        Assert.IsNotEmpty(LPokemonFormEntity.form_names.Items[0].language.url);
      end;
      // Node Names
      if LPokemonFormEntity.names.Count > 0 then
      begin
        Assert.IsNotEmpty(LPokemonFormEntity.names.Items[0].name);
        Assert.IsNotEmpty(LPokemonFormEntity.names.Items[0].language.name);
        Assert.IsNotEmpty(LPokemonFormEntity.names.Items[0].language.url);
      end;
      Write('.');
    finally
      LPokemonFormEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TPokemonFormsTest.TestEntityWillRaise;
var
  LPokemonFormEntity: TPokemonFormEntity;
begin
  LPokemonFormEntity := nil;
  try
    LPokemonFormEntity := TPokemonFormEntity.Create;
    FPokeWrapper.GetAsEntity(LPokemonFormEntity, 9999999);
  finally
    LPokemonFormEntity.Free;
  end;
end;

procedure TPokemonFormsTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TPokemon.pokemon_form...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TPokemonFormsTest);

end.
