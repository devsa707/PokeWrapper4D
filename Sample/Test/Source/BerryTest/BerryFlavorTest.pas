unit BerryFlavorTest;

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
  BerryFlavor.Entity;

type

  [TestFixture]
  TBerryFlavorTest = class
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

procedure TBerryFlavorTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.berry_flavor);
end;

procedure TBerryFlavorTest.TestEntity;
var
  LBerryFlavorEntity: TBerryFlavorEntity;
begin
  Write('Testing TBerry.berry_flavor .');
  for var I: integer := 1 to FList - 1 do
  begin
    LBerryFlavorEntity := nil;
    try
      LBerryFlavorEntity := TBerryFlavorEntity.Create;
      FPokeWrapper.GetAsEntity(LBerryFlavorEntity, I);
      // Assertions
      for var berries in LBerryFlavorEntity.berries do
      begin
        Assert.IsNotEmpty(berries.berry.name);
        Assert.IsNotEmpty(berries.berry.url);
        Assert.IsNotEmpty(berries.potency);
      end;
      Assert.IsNotEmpty(LBerryFlavorEntity.contest_type.name);
      Assert.IsNotEmpty(LBerryFlavorEntity.contest_type.url);
      Assert.IsNotEmpty(LBerryFlavorEntity.id);
      Assert.IsNotEmpty(LBerryFlavorEntity.name);
      for var names in LBerryFlavorEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
      Write('.');
    finally
      LBerryFlavorEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TBerryFlavorTest.TestEntityWillRaise;
var
  LBerryFlavorEntity: TBerryFlavorEntity;
begin
  LBerryFlavorEntity := nil;
  try
    LBerryFlavorEntity := TBerryFlavorEntity.Create;
    FPokeWrapper.GetAsEntity(LBerryFlavorEntity, 9999999);
  finally
    LBerryFlavorEntity.Free;
  end;
end;

procedure TBerryFlavorTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TBerry.berry_flavor...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TBerryFlavorTest);

end.
