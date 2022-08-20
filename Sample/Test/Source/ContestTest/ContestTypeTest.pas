unit ContestTypeTest;

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
  FPokeWrapper := TPokeFactory.New(TPokemon.contest_type);
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
      FPokeWrapper.GetAsEntity(LContestTypeEntity, I);
      // Assertions
      Assert.IsNotEmpty(LContestTypeEntity.berry_flavor.name);
      Assert.IsNotEmpty(LContestTypeEntity.berry_flavor.url);
      Assert.IsNotEmpty(LContestTypeEntity.id);
      Assert.IsNotEmpty(LContestTypeEntity.name);
      for var names in LContestTypeEntity.names do
      begin
        Assert.IsNotEmpty(names.color);
        Assert.IsNotEmpty(names.language.name);
        Assert.IsNotEmpty(names.language.url);
        Assert.IsNotEmpty(names.name);
      end;
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
    FPokeWrapper.GetAsEntity(LContestTypeEntity, 9999999);
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
    LPokeListEntity := FPokeWrapper.GetAsListEntity;
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
