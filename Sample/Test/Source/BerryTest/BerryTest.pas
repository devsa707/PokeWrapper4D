unit BerryTest;

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
  Berry.Entity;

type

  [TestFixture]
  TBerryTest = class
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

procedure TBerryTest.Setup;
begin
  FPokeWrapper := TPokeWrapper<TBerry>.Create;
end;

procedure TBerryTest.TestEntity;
var
  LBerryEntity: TBerryEntity;
begin
  Write('Testing TBerry.berry .');
  for var I: integer := 1 to FList - 1 do
  begin
    LBerryEntity := nil;
    try
      LBerryEntity := TBerryEntity.Create;
      FPokeWrapper.GetAsEntity(LBerryEntity, integer(TBerry.Berry), I);
      // Assertions
      Assert.IsNotEmpty(LBerryEntity.name);
      Assert.IsNotEmpty(LBerryEntity.firmness.name);
      Assert.IsNotEmpty(LBerryEntity.flavors.Count);
      Assert.IsNotEmpty(LBerryEntity.flavors.Items[LBerryEntity.flavors.Count -
        1].flavor.name);
      Assert.IsNotEmpty(LBerryEntity.flavors.Items[LBerryEntity.flavors.Count -
        1].flavor.url);
      Assert.IsNotEmpty(LBerryEntity.flavors.Items[LBerryEntity.flavors.Count -
        1].flavor.potency);
      Assert.IsNotEmpty(LBerryEntity.item.name);
      Assert.IsNotEmpty(LBerryEntity.natural_gift_power);
      Assert.IsNotEmpty(LBerryEntity.natural_gift_type.name);
      Assert.IsNotEmpty(LBerryEntity.natural_gift_type.url);
      Write('.');
    finally
      LBerryEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TBerryTest.TestEntityWillRaise;
var
  LBerryEntity: TBerryEntity;
begin
  LBerryEntity := nil;
  try
    LBerryEntity := TBerryEntity.Create;
    FPokeWrapper.GetAsEntity(LBerryEntity, integer(TBerry.Berry), 9999999);
  finally
    LBerryEntity.Free;
  end;
end;

procedure TBerryTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TBerry.berry...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity(integer(TBerry.Berry));
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TBerryTest);

end.
