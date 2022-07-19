unit VersionTest;

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
  Version.Entity;

type

  [TestFixture]
  TVersionTest = class
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

procedure TVersionTest.Setup;
begin
  FPokeWrapper := TPokeWrapper<TGame>.Create;
end;

procedure TVersionTest.TestEntity;
var
  LVersionEntity: TVersionEntity;
begin
  Write('Testing TGames.version .');
  for var I: integer := 1 to 10 do
  begin
    LVersionEntity := nil;
    try
      // Id pokedex 10 not found
      if I <> 10 then
      begin
        LVersionEntity := TVersionEntity.Create;
        FPokeWrapper.GetAsEntity(LVersionEntity, integer(TGame.Version), I);
        // Assertions
        Assert.IsNotEmpty(LVersionEntity.id);
        Assert.IsNotEmpty(LVersionEntity.name);
        // node descriptions

        Write('.');
      end;
    finally
      LVersionEntity.Free;
    end;
  end;
  Assert.WillRaise(TestEntityWillRaise);
  Write('Finished.');
end;

procedure TVersionTest.TestEntityWillRaise;
var
  LVersionEntity: TVersionEntity;
begin
  LVersionEntity := nil;
  try
    LVersionEntity := TVersionEntity.Create;
    FPokeWrapper.GetAsEntity(LVersionEntity, integer(TGame.Version), 9999999);
  finally
    LVersionEntity.Free;
  end;
end;

procedure TVersionTest.TestList;
var
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := nil;
  try
    Write('Testing List of TGames.version...  ');
    LPokeListEntity := FPokeWrapper.GetAsListEntity(integer(TGame.Version));
    Assert.IsNotEmpty(LPokeListEntity.Count);
    FList := LPokeListEntity.Count;
    Write('Finished.');
  finally
    LPokeListEntity.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TVersionTest);

end.
