unit BerryFirmnessTest;

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
  BerryFirmness.Entity;

type

  [TestFixture]
  TBerryFirmnessTest = class
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

procedure TBerryFirmnessTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(TPokemon.berry_firmness);
end;

procedure TBerryFirmnessTest.TestEntity;
var
  LBerryFirmnessEntity: TBerryFirmnessEntity;
begin
  Write('Testing TBerry.berry_firmness .');
  for var I: integer := 1 to FList - 1 do
  begin
    LBerryFirmnessEntity := nil;
    try
      LBerryFirmnessEntity := TBerryFirmnessEntity.Create;
      FPokeWrapper.GetAsEntity(LBerryFirmnessEntity, I); // Assertions
      for var berries in LBerryFirmnessEntity.berries do
      begin
        Assert.IsNotEmpty(berries.name);
        Assert.IsNotEmpty(berries.url);
      end;
      Assert.IsNotEmpty(LBerryFirmnessEntity.id);
      Assert.IsNotEmpty(LBerryFirmnessEntity.name);
      for var names in LBerryFirmnessEntity.names do
      begin
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
      Write('.');
    finally
      LBerryFirmnessEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TBerryFirmnessTest.TestEntityWillRaise;
var
  LBerryFirmnessEntity: TBerryFirmnessEntity;
begin
  LBerryFirmnessEntity := nil;
  try
    LBerryFirmnessEntity := TBerryFirmnessEntity.Create;
    FPokeWrapper.GetAsEntity(LBerryFirmnessEntity, 9999999);
  finally
    LBerryFirmnessEntity.Free;
  end;
end;

procedure TBerryFirmnessTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TBerry.berry_firmness...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TBerryFirmnessTest);

end.
