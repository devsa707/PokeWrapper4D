unit MachineTest;

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
  FPokeWrapper := TPokeWrapper<TMachine>.Create;
end;

procedure TMachineTest.TestEntity;
var
  LMachineEntity: TMachineEntity;
begin
  Write('Testing TMachine.machine .');
  for var I: integer := 1 to FList - 1 do
  begin
    LMachineEntity := nil;
    try
      LMachineEntity := TMachineEntity.Create;
      FPokeWrapper.GetAsEntity(LMachineEntity, integer(TMachine.Machine), I);
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
    FPokeWrapper.GetAsEntity(LMachineEntity, integer(TMachine.Machine),
      9999999);
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
    LPokeListEntity := FPokeWrapper.GetAsListEntity(integer(TMachine.Machine));
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
