unit MachineTest;

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
  Machine.Entity;

type

  [TestFixture]
  TMachineTest = class
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

procedure TMachineTest.Setup;
begin
  FPokeWrapper := TPokeFactory.New(integer(TPokemon.Machine));
end;

procedure TMachineTest.TestEntity;
var
  LMachineEntity: TMachineEntity;
begin
  Write('Testing TMachine.machine .');
  for var I: integer := 1 to 20 do
  begin
    LMachineEntity := nil;
    try
      LMachineEntity := TMachineEntity.Create;
      FPokeWrapper.GetAsEntity(LMachineEntity, I);
      // Assertions
      Assert.IsNotEmpty(LMachineEntity.id);
      Assert.IsNotEmpty(LMachineEntity.item.name);
      Assert.IsNotEmpty(LMachineEntity.item.url);
      Assert.IsNotEmpty(LMachineEntity.move.name);
      Assert.IsNotEmpty(LMachineEntity.move.url);
      Assert.IsNotEmpty(LMachineEntity.version_group.name);
      Assert.IsNotEmpty(LMachineEntity.version_group.url);
      Write('.');
    finally
      LMachineEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TMachineTest.TestEntityWillRaise;
var
  LMachineEntity: TMachineEntity;
begin
  LMachineEntity := nil;
  try
    LMachineEntity := TMachineEntity.Create;
    FPokeWrapper.GetAsEntity(LMachineEntity, 9999999);
  finally
    LMachineEntity.Free;
  end;
end;

procedure TMachineTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TMachine.machine...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TMachineTest);

end.
