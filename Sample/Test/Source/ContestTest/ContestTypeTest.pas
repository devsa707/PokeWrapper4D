unit ContestTypeTest;

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
  ContestType.Entity;

type

  [TestFixture]
  TContestTypeTest = class
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

procedure TContestTypeTest.Setup;
begin
  FPokeWrapper := TPokeWrapper<TContest>.Create;
end;

procedure TContestTypeTest.TestEntity;
var
  LContestTypeEntity: TContestTypeEntity;
begin
  Write('Testing TBerry.contest_type .');
  for var I: integer := 1 to FList - 1 do
  begin
    LContestTypeEntity := nil;
    try
      LContestTypeEntity := TContestTypeEntity.Create;
      FPokeWrapper.GetAsEntity(LContestTypeEntity,
        integer(TContest.contest_type), I);
      // Assertions
      Assert.IsNotEmpty(LContestTypeEntity.berry_flavor.name);
      Assert.IsNotEmpty(LContestTypeEntity.berry_flavor.url);
      Assert.IsNotEmpty(LContestTypeEntity.id);
      Assert.IsNotEmpty(LContestTypeEntity.name);
      Assert.IsNotEmpty(LContestTypeEntity.names.Items
        [LContestTypeEntity.names.Count - 1].color);
      Assert.IsNotEmpty(LContestTypeEntity.names.Items
        [LContestTypeEntity.names.Count - 1].language.name);
      Assert.IsNotEmpty(LContestTypeEntity.names.Items
        [LContestTypeEntity.names.Count - 1].language.url);
      Assert.IsNotEmpty(LContestTypeEntity.names.Items
        [LContestTypeEntity.names.Count - 1].name);
      Write('.');
    finally
      LContestTypeEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TContestTypeTest.TestEntityWillRaise;
var
  LContestTypeEntity: TContestTypeEntity;
begin
  LContestTypeEntity := nil;
  try
    LContestTypeEntity := TContestTypeEntity.Create;
    FPokeWrapper.GetAsEntity(LContestTypeEntity,
      integer(TContest.contest_type), 9999999);
  finally
    LContestTypeEntity.Free;
  end;
end;

procedure TContestTypeTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TContest.contest_type...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity(integer(TContest.contest_type));
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TContestTypeTest);

end.
