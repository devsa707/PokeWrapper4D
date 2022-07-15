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
    FBaseUrl: string;
    FMVCRESTClient: IMVCRESTClient;
    FPokeInfo: IPokeInfo;
    FTypeInfo: PTypeInfo;
  public
    constructor Create(ABaseUrl: string); overload;
    function Get(AResource: TBerries; AValue: Integer): string; overload;
    function Get(AResource: TBerries; AValue: string): string; overload;
  end;

implementation

{ TPokeAPIJson }

constructor TPokeAPIJson<T>.Create(ABaseUrl: string);
begin
  FTypeInfo := TypeInfo(T);
  FBaseUrl := ABaseUrl;
  FMVCRESTClient := TMVCRESTClient.Create;
  FPokeInfo := TPokeInfo.Create;
end;

function TPokeAPIJson<T>.Get(AResource: TBerries; AValue: string): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeInfo.GetResourceName(FTypeInfo, Integer(AResource));
  FMVCRESTClient.BaseURL(FBaseUrl);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName + AValue);
  Result := LMVCRESTResponse.Content;
end;

function TPokeAPIJson<T>.Get(AResource: TBerries; AValue: Integer): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeInfo.GetResourceName(FTypeInfo, Integer(AResource));
  FMVCRESTClient.BaseURL(FBaseUrl);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName + IntToStr(AValue));
  Result := LMVCRESTResponse.Content;
end;

end.
