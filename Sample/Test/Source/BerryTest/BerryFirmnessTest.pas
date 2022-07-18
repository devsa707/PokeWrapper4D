unit BerryFirmnessTest;

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
  FPokeWrapper := TPokeWrapper<TBerry>.Create;
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
      FPokeWrapper.GetAsEntity(LBerryFirmnessEntity,
        integer(TBerry.berry_firmness), I); // Assertions
      Assert.IsNotEmpty(LBerryFirmnessEntity.berries.Count);
      Assert.IsNotEmpty(LBerryFirmnessEntity.berries.Items
        [LBerryFirmnessEntity.berries.Count - 1].name);
      Assert.IsNotEmpty(LBerryFirmnessEntity.berries.Items
        [LBerryFirmnessEntity.berries.Count - 1].url);
      Assert.IsNotEmpty(LBerryFirmnessEntity.id);
      Assert.IsNotEmpty(LBerryFirmnessEntity.name);
      Assert.IsNotEmpty(LBerryFirmnessEntity.names.Count);
      Assert.IsNotEmpty(LBerryFirmnessEntity.names.Items
        [LBerryFirmnessEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LBerryFirmnessEntity.names.Items
        [LBerryFirmnessEntity.names.Count - 1].language.url);
      Assert.IsNotEmpty(LBerryFirmnessEntity.names.Items
        [LBerryFirmnessEntity.names.Count - 1].name);
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
    FPokeWrapper.GetAsEntity(LBerryFirmnessEntity,
      integer(TBerry.berry_firmness), 9999999);
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
    LPokeListEntity := FPokeWrapper.GetAsListEntity
      (integer(TBerry.berry_firmness));
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
