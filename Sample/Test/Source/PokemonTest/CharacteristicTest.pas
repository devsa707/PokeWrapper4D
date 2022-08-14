unit CharacteristicTest;

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
  Characteristic.Entity;

type

  [TestFixture]
  TCharacteristicTest = class
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

procedure TCharacteristicTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.Characteristic));
end;

procedure TCharacteristicTest.TestEntity;
var
  LCharacteristicEntity: TCharacteristicEntity;
begin
  Write('Testing TPokemon.characteristic .');
  for var I: integer := 1 to 10 do
  begin
    LCharacteristicEntity := nil;
    try
      LCharacteristicEntity := TCharacteristicEntity.Create;
      FPokeWrapper.GetAsEntity(LCharacteristicEntity, I);
      // Assertions
      // Node Description
      if LCharacteristicEntity.description.Count > 0 then
      begin
        Assert.IsNotEmpty(LCharacteristicEntity.description.Items[0].description);
        Assert.IsNotEmpty(LCharacteristicEntity.description.Items[0].language.name);
        Assert.IsNotEmpty(LCharacteristicEntity.description.Items[0].language.url);
      end;
      //
      Assert.IsNotEmpty(LCharacteristicEntity.gene_modulo);
      // Node Highest Stat
      Assert.IsNotEmpty(LCharacteristicEntity.highest_stat.name);
      Assert.IsNotEmpty(LCharacteristicEntity.highest_stat.url);
      if LCharacteristicEntity.possible_values.Count > 0 then
      begin
        Assert.IsNotEmpty(LCharacteristicEntity.possible_values.Items[0]);
      end;
      Write('.');
    finally
      LCharacteristicEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TCharacteristicTest.TestEntityWillRaise;
var
  LCharacteristicEntity: TCharacteristicEntity;
begin
  LCharacteristicEntity := nil;
  try
    LCharacteristicEntity := TCharacteristicEntity.Create;
    FPokeWrapper.GetAsEntity(LCharacteristicEntity, 9999999);
  finally
    LCharacteristicEntity.Free;
  end;
end;

procedure TCharacteristicTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TPokemon.characteristic...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TCharacteristicTest);

end.
