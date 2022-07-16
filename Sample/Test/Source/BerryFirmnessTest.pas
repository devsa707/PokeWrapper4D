unit BerryFirmnessTest;

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
  BerryFirmness.Entity;

type

  [TestFixture]
  TBerryFirmnessTest = class
  private
    FPokeAPI: IPokeAPI;
    FBerryFirmnessEntity: TBerryFirmnessEntity;
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

procedure TBerryFirmnessTest.Setup;
begin
  FPokeAPI := TPokeAPI<TBerry>.Create;
  FBerryFirmnessEntity := TBerryFirmnessEntity.Create;
end;

procedure TBerryFirmnessTest.TearDown;
begin
  FBerryFirmnessEntity.Free;
end;

procedure TBerryFirmnessTest.TestEntity;
begin
  Write('Testing TBerry.berry_firmness .');
  for var I: integer := 1 to FList - 1 do
  begin
    FPokeAPI.GetAsEntity(FBerryFirmnessEntity,
      integer(TBerry.berry_firmness), I);
    Assert.IsNotEmpty(IntToStr(FBerryFirmnessEntity.berries.Count));
    Assert.IsNotEmpty(IntToStr(FBerryFirmnessEntity.id));
    Assert.IsNotEmpty(FBerryFirmnessEntity.name);
    Assert.IsNotEmpty(IntToStr(FBerryFirmnessEntity.names.Count));
    Write('.');
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TBerryFirmnessTest.TestEntityWillRaise;
begin
  FPokeAPI.GetAsEntity(FBerryFirmnessEntity, 50, 9999999);
end;

procedure TBerryFirmnessTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TBerry.berry_firmness...  ');
    LPokeListEntity := FPokeAPI.GetAsListEntity(integer(TBerry.berry_firmness));
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
