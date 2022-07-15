unit PokeAPI;

interface

uses
  // System
  System.SysUtils,
  System.Generics.Collections,
  //
  PokeAPI.Types,
  System.TypInfo,
  PokeAPI.Resources,
  PokeAPI.Interfaces,
  // MVCFramework
  MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient;

type

  TPokeAPIJson<T> = class(TInterfacedObject, IPokeAPI)
  private
    FPropInfo: TPropInfo;
    FBaseUrl: string;
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
end;

function TPokeAPIJson<T>.Get(AIndex: integer; AValue: string): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeInfo.GetResourceName(FTypeInfo, AIndex);
  FMVCRESTClient.BaseURL(FBaseUrl);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName + AValue);
  Result := LMVCRESTResponse.Content;
end;

function TPokeAPIJson<T>.Get(AIndex: integer; AValue: integer): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeInfo.GetResourceName(FTypeInfo, AIndex);
  FMVCRESTClient.BaseURL(FBaseUrl);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName + IntToStr(AValue));
  Result := LMVCRESTResponse.Content;
end;

function TPokeAPIJson<T>.Get(AIndex: integer): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeInfo.GetResourceName(FTypeInfo, AIndex);
  FMVCRESTClient.BaseURL(FBaseUrl);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName);
  Result := LMVCRESTResponse.Content;
end;

end.
