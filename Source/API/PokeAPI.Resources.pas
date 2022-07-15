unit PokeAPI.Resources;

interface

uses
  System.Character,
  System.StrUtils,
  System.TypInfo;

type

  IPokeResource = interface
    ['{B6B1E0AF-3BB0-4898-BB90-CE5C490F7CC4}']
    function GetResourceNameList(ATypeInfo: PTypeInfo): string;
    function GetResourceName(ATypeInfo: PTypeInfo; AIndex: Integer): string;
  end;

  TPokeResource = class(TInterfacedObject, IPokeResource)
  private
    FName: string;
    procedure SetFName(const Value: string);
    property Name: string read FName write SetFName;
  public
    function GetResourceNameList(ATypeInfo: PTypeInfo): string;
    function GetResourceName(ATypeInfo: PTypeInfo; AIndex: Integer): string;
  end;

implementation

{ TPokeInfo }

function TPokeResource.GetResourceName(ATypeInfo: PTypeInfo;
  AIndex: Integer): string;
begin
  Name := GetEnumName(ATypeInfo, AIndex);
  Result := FName;
end;

function TPokeResource.GetResourceNameList(ATypeInfo: PTypeInfo): string;
var
  LName: string;
begin
  LName := ATypeInfo.Name;
  delete(LName, 1, 1);
  Result := ToLower(LName);
end;

procedure TPokeResource.SetFName(const Value: string);
begin
  FName := ReplaceStr(Value, '_', '-') + '/';
end;

end.
