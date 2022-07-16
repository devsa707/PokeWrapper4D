unit BerryTest;

interface

uses
  System.SysUtils,
  //
  DUnitX.TestFramework,
  // PokeAPI
  PokeAPI,
  PokeAPI.Interfaces,
  PokeAPI.Types,
  //
  PokeList.Entity,
  Berry.Entity;

type

  [TestFixture]
  TBerryTest = class
  private
    FPokeAPI: IPokeAPI;
    FBerryEntity: TBerryEntity;
    FList: integer;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestList;
    [Test]
    procedure TestEntity;
    procedure TestEntityWillRaise;
  end;

implementation

procedure TBerryTest.Setup;
begin
  FPokeAPI := TPokeAPI<TBerry>.Create;
  FBerryEntity := TBerryEntity.Create;
end;

procedure TBerryTest.TearDown;
begin
  FBerryEntity.Free;
end;

procedure TBerryTest.TestEntity;
begin
  Write('Testing TBerry.Berry .');
  for var I: integer := 1 to FList - 1 do
  begin
    FPokeAPI.GetAsEntity(FBerryEntity, integer(TBerry.Berry), I);
    Assert.IsNotEmpty(FBerryEntity.name);
    Assert.IsNotEmpty(FBerryEntity.firmness.name);
    Assert.IsNotEmpty(IntToStr(FBerryEntity.flavors.Count));
    Assert.IsNotEmpty(FBerryEntity.item.name);
    Assert.IsNotEmpty(FBerryEntity.natural_gift_type.name);
    Write('.');
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TBerryTest.TestEntityWillRaise;
begin
  FPokeAPI.GetAsEntity(FBerryEntity, 50, 9999999);
end;

procedure TBerryTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TBerry...  ');
    LPokeListEntity := FPokeAPI.GetAsListEntity(integer(TBerry.Berry));
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
