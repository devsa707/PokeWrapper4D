unit PokeAPI.Resources;

interface

uses
  System.StrUtils,
  System.TypInfo;

type

  IPokeInfo = interface
    ['{B6B1E0AF-3BB0-4898-BB90-CE5C490F7CC4}']
    function GetResourceName(ATypeInfo: PTypeInfo; AIndex: Integer): string;
  end;

  TPokeInfo = class(TInterfacedObject, IPokeInfo)
  private
    FName: string;
    procedure SetFName(const Value: string);
    property Name: string read FName write SetFName;
  public
    function GetResourceName(ATypeInfo: PTypeInfo; AIndex: Integer): string;
  end;

implementation

{ TPokeInfo }

function TPokeInfo.GetResourceName(ATypeInfo: PTypeInfo;
  AIndex: Integer): string;
begin
  Name := GetEnumName(ATypeInfo, AIndex);
  Result := 'https://pokeapi.co/api/v2/' + FName;
end;

procedure TPokeInfo.SetFName(const Value: string);
begin
  FName := ReplaceStr(Value, '_', '-') + '/';
end;

end.
