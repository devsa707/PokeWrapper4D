unit PokeAPI;

interface

uses
  // System
  System.TypInfo,
  System.SysUtils,
  System.Generics.Collections,
  //
  PokeAPI.Resources,
  PokeAPI.Interfaces,
  // MVCFramework
  MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient;

type

  TPokeAPIJson<T> = class(TInterfacedObject, IPokeAPI)
  private
    FMVCRESTClient: IMVCRESTClient;
    FPokeInfo: IPokeInfo;
    FTypeInfo: PTypeInfo;
  public
    constructor Create; overload;
    function Get(AIndex: integer): string; overload;
    function Get(AIndex: integer; AValue: integer): string; overload;
    function Get(AIndex: integer; AValue: string): string; overload;
  end;

implementation

{ TPokeAPIJson }

constructor TPokeAPIJson<T>.Create;
begin
  FTypeInfo := TypeInfo(T);
  FMVCRESTClient := TMVCRESTClient.Create;
  FPokeInfo := TPokeInfo.Create;
  FMVCRESTClient.BaseURL('https://pokeapi.co/api/v2/');
end;

function TPokeAPIJson<T>.Get(AIndex: integer; AValue: string): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeInfo.GetResourceName(FTypeInfo, AIndex);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName + AValue);
  Result := LMVCRESTResponse.Content;
end;

function TPokeAPIJson<T>.Get(AIndex: integer; AValue: integer): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeInfo.GetResourceName(FTypeInfo, AIndex);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName + IntToStr(AValue));
  Result := LMVCRESTResponse.Content;
end;

function TPokeAPIJson<T>.Get(AIndex: integer): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeInfo.GetResourceName(FTypeInfo, AIndex);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName);
  Result := LMVCRESTResponse.Content;
end;

end.
