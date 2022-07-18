unit PokeWrapper;

interface

uses
  // System
  System.TypInfo,
  System.SysUtils,
  System.Generics.Collections,
  //
  PokeList.Entity,
  PokeWrapper.Resources,
  PokeWrapper.Interfaces,
  // MVCFramework
  JsonDataObjects,
  MVCFramework.RESTClient,
  MVCFramework.RESTClient.Intf,
  MVCFramework.Serializer.Commons,
  MVCFramework.Serializer.JsonDataObjects;

type

  TPokeWrapper<T> = class(TInterfacedObject, IPokeWrapper)
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

    procedure GetAsEntity(AObject: TObject; AIndex: integer;
      AValue: integer)overload;
    procedure GetAsEntity(AObject: TObject; AIndex: integer;
      AValue: string)overload;
  end;

implementation

{ TPokeAPIJson }

constructor TPokeWrapper<T>.Create;
begin
  FTypeInfo := TypeInfo(T);
  FMVCRESTClient := TMVCRESTClient.Create;
  FPokeResource := TPokeResource.Create;
  FMVCRESTClient.BaseURL('https://pokeapi.co/api/v2/');
end;

function TPokeWrapper<T>.Get(AIndex: integer; AValue: string): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeResource.GetResourceName(FTypeInfo, AIndex);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName + AValue);
  if LMVCRESTResponse.Success then
    Result := LMVCRESTResponse.Content
  else
    raise Exception.Create('Not Found');
end;

procedure TPokeWrapper<T>.GetAsEntity(AObject: TObject; AIndex: integer;
  AValue: string);
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeResource.GetResourceName(FTypeInfo, AIndex);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName + AValue);
  if LMVCRESTResponse.Success then
  begin
    JSONResponseToObject(LMVCRESTResponse.ToJSONObject, AObject);
  end
  else
    raise Exception.Create('Not Found');
end;

procedure TPokeWrapper<T>.GetAsEntity(AObject: TObject;
  AIndex, AValue: integer);
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeResource.GetResourceName(FTypeInfo, AIndex);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName + IntToStr(AValue));
  if LMVCRESTResponse.Success then
  begin
    JSONResponseToObject(LMVCRESTResponse.ToJSONObject, AObject);
  end
  else
    raise Exception.Create('Not Found');
end;

function TPokeWrapper<T>.GetAsListEntity(AIndex, AOffset, ALimit: integer)
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
  if LMVCRESTResponse.Success then
  begin
    JSONResponseToObject(LMVCRESTResponse.ToJSONObject, LPokeListEntity);
    Result := LPokeListEntity;
  end
  else
    raise Exception.Create('Not Found');
end;

function TPokeWrapper<T>.Get(AIndex: integer; AValue: integer): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeResource.GetResourceName(FTypeInfo, AIndex);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName + IntToStr(AValue));
  if LMVCRESTResponse.Success then
    Result := LMVCRESTResponse.Content
  else
    raise Exception.Create('Not Found');
end;

function TPokeWrapper<T>.GetList(AIndex, AOffset, ALimit: integer): string;
var
  LResourceName: string;
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LResourceName := FPokeResource.GetResourceName(FTypeInfo, AIndex);
  FMVCRESTClient.AddQueryStringParam('offset', AOffset);
  FMVCRESTClient.AddQueryStringParam('limit', ALimit);
  LMVCRESTResponse := FMVCRESTClient.Get(LResourceName);
  if LMVCRESTResponse.Success then
    Result := LMVCRESTResponse.Content
  else
    raise Exception.Create('Not Found');
end;

procedure TPokeWrapper<T>.JSONResponseToObject(AJsonObject: TJsonObject;
  const AObject: TObject);
var
  LMVCJSONSerializer: IMVCJSONSerializer;
begin
  LMVCJSONSerializer := TMVCJsonDataObjectsSerializer.Create;
  LMVCJSONSerializer.JsonObjectToObject(AJsonObject, AObject, stDefault, []);
  // Injected object by the MVCRESTResponse.ToJSONObject
  AJsonObject.Free;
end;

end.
