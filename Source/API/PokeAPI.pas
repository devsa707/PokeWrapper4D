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
    FPokeResource: IPokeResource;
    FTypeInfo: PTypeInfo;
  public
    constructor Create; overload;
    function GetList(AIndex: integer; AOffset: integer = 20;
      ALimit: integer = 20): string; overload;
    function Get(AIndex: integer; AValue: integer): string; overload;
    function Get(AIndex: integer; AValue: string): string; overload;
  end;

implementation

{ TPokeAPIJson }

constructor TPokeAPIJson<T>.Create;
begin
  FTypeInfo := TypeInfo(T);
  FMVCRESTClient := TMVCRESTClient.Create;
  FPokeResource := TPokeResource.Create;
  FMVCRESTClient.BaseURL('https://pokeapi.co/api/v2/');
end;

function TPokeAPIJson<T>.Get(AIndex: integer; AValue: string): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeResource.GetResourceName(FTypeInfo, AIndex);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName + AValue);
  Result := LMVCRESTResponse.Content;
end;

function TPokeAPIJson<T>.Get(AIndex: integer; AValue: integer): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeResource.GetResourceName(FTypeInfo, AIndex);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName + IntToStr(AValue));
  Result := LMVCRESTResponse.Content;
end;

function TPokeAPIJson<T>.GetList(AIndex, AOffset, ALimit: integer): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeResource.GetResourceName(FTypeInfo, AIndex);
  FMVCRESTClient.AddQueryStringParam('offset', AOffset);
  FMVCRESTClient.AddQueryStringParam('limit', ALimit);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName);
  Result := LMVCRESTResponse.Content;
end;

end.
