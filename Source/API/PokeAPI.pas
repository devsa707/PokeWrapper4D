unit PokeAPI;

interface

uses
  // System
  System.TypInfo,
  System.SysUtils,
  System.Generics.Collections,
  //
  PokeList.Entity,
  PokeAPI.Resources,
  PokeAPI.Interfaces,
  // MVCFramework
  JsonDataObjects,
  MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient,
  MVCFramework.Serializer.Commons,
  MVCFramework.Serializer.JsonDataObjects;

type

  TPokeAPIJson<T> = class(TInterfacedObject, IPokeAPI)
  private
    FMVCRESTClient: IMVCRESTClient;
    FPokeResource: IPokeResource;
    FTypeInfo: PTypeInfo;
    procedure JSONResponseToObject(AJsonObject: TJsonObject;
      const AObject: TObject);
  public
    constructor Create; overload;
    function GetList(AIndex: integer; AOffset: integer = 0;
      ALimit: integer = 20): string; overload;
    function Get(AIndex: integer; AValue: integer): string; overload;
    function Get(AIndex: integer; AValue: string): string; overload;

    function GetAsListEntity(AIndex: integer; AOffset: integer = 0;
      ALimit: integer = 20): TPokeListEntity;

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

function TPokeAPIJson<T>.GetAsListEntity(AIndex, AOffset, ALimit: integer)
  : TPokeListEntity;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
  LPokeListEntity: TPokeListEntity;
begin
  LPokeListEntity := TPokeListEntity.Create;
  LResourceName := FPokeResource.GetResourceName(FTypeInfo, AIndex);
  FMVCRESTClient.AddQueryStringParam('offset', AOffset);
  FMVCRESTClient.AddQueryStringParam('limit', ALimit);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName);
  JSONResponseToObject(LMVCRESTResponse.ToJSONObject, LPokeListEntity);
  Result := LPokeListEntity;
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

procedure TPokeAPIJson<T>.JSONResponseToObject(AJsonObject: TJsonObject;
  const AObject: TObject);
var
  LMVCJSONSerializer: IMVCJSONSerializer;
begin
  LMVCJSONSerializer := TMVCJsonDataObjectsSerializer.Create;
  LMVCJSONSerializer.JsonObjectToObject(AJsonObject, AObject, stDefault, []);
end;

end.
