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
end;

procedure TBerryFirmnessTest.TearDown;
begin
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
      FPokeAPI.GetAsEntity(LBerryFirmnessEntity,
        integer(TBerry.berry_firmness), I);
      Assert.IsNotEmpty(LBerryFirmnessEntity.berries.Count);
      Assert.IsNotEmpty(LBerryFirmnessEntity.berries.Items
        [LBerryFirmnessEntity.berries.Count - 1].name);
      Assert.IsNotEmpty(LBerryFirmnessEntity.berries.Items
        [LBerryFirmnessEntity.berries.Count - 1].url);
      Assert.IsNotEmpty(LBerryFirmnessEntity.id);
      Assert.IsNotEmpty(LBerryFirmnessEntity.name);
      Assert.IsNotEmpty(LBerryFirmnessEntity.names.Count);
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
    FPokeAPI.GetAsEntity(LBerryFirmnessEntity, 50, 9999999);
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
