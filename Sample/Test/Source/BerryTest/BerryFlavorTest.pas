unit BerryFlavorTest;

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
  FPokeWrapper := TPokeWrapper<TBerry>.Create;
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
      FPokeWrapper.GetAsEntity(LBerryFlavorEntity,
        integer(TBerry.berry_flavor), I);
      // Assertions
      Assert.IsNotEmpty(LBerryFlavorEntity.berries.Count);
      Assert.IsNotEmpty(LBerryFlavorEntity.berries.Items
        [LBerryFlavorEntity.berries.Count - 1].berry.name);
      Assert.IsNotEmpty(LBerryFlavorEntity.berries.Items
        [LBerryFlavorEntity.berries.Count - 1].berry.url);
      Assert.IsNotEmpty(LBerryFlavorEntity.berries.Items
        [LBerryFlavorEntity.berries.Count - 1].potency);
      Assert.IsNotEmpty(LBerryFlavorEntity.contest_type.name);
      Assert.IsNotEmpty(LBerryFlavorEntity.contest_type.url);
      Assert.IsNotEmpty(LBerryFlavorEntity.id);
      Assert.IsNotEmpty(LBerryFlavorEntity.name);
      Assert.IsNotEmpty(LBerryFlavorEntity.names.Count);
      Assert.IsNotEmpty(LBerryFlavorEntity.names.Items
        [LBerryFlavorEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LBerryFlavorEntity.names.Items
        [LBerryFlavorEntity.names.Count - 1].language.url);
      Assert.IsNotEmpty(LBerryFlavorEntity.names.Items
        [LBerryFlavorEntity.names.Count - 1].name);
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
    FPokeWrapper.GetAsEntity(LBerryFlavorEntity,
      integer(TBerry.berry_flavor), 9999999);
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
    LPokeListEntity := FPokeWrapper.GetAsListEntity
      (integer(TBerry.berry_flavor));
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
