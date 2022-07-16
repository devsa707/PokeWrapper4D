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
end;

procedure TBerryTest.TearDown;
begin
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
      FPokeAPI.GetAsEntity(LBerryEntity, integer(TBerry.Berry), I);
      Assert.IsNotEmpty(LBerryEntity.name);
      Assert.IsNotEmpty(LBerryEntity.firmness.name);
      Assert.IsNotEmpty(IntToStr(LBerryEntity.flavors.Count));
      Assert.IsNotEmpty(LBerryEntity.item.name);
      Assert.IsNotEmpty(LBerryEntity.natural_gift_type.name);
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
    FPokeAPI.GetAsEntity(LBerryEntity, 50, 9999999);
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
