unit PokeWrapper;

interface

uses
  // System
  System.TypInfo,
  System.SysUtils,
  System.Generics.Collections,
  //
  PokeList.Entity,
  PokeWrapper.Types,
  PokeWrapper.Resources,
  PokeWrapper.Interfaces,
  // MVCFramework
  JsonDataObjects,
  MVCFramework.RESTClient,
  MVCFramework.RESTClient.Intf,
  MVCFramework.Serializer.Commons,
  MVCFramework.Serializer.JsonDataObjects;

type

  TPokeWrapper = class(TInterfacedObject, IPokeWrapper)
  private
    FMVCRESTClient: IMVCRESTClient;
    FPokeResource : IPokeResource;
    FResource     : string;
    FBaseUrl      : string;
    procedure JSONResponseToObject(AMVCRESTResponse: IMVCRESTResponse; const AObject: TObject);
  public
    constructor Create(APokemon: TPokemon); overload;
    function GetList(AOffset: integer = 0; ALimit: integer = 20): string; overload;
    function Get(AValue: integer): string; overload;
    function Get(AValue: string): string; overload;
    function GetAsListEntity(AOffset: integer = 0; ALimit: integer = 20): TPokeListEntity;

    procedure JsonToObject(AJson: string; AObject: TObject);
    procedure GetAsEntity(AObject: TObject; AValue: integer)overload;
    procedure GetAsEntity(AObject: TObject; AValue: string)overload;
    procedure GetAsEntityFromUrl(AObject: TObject; AURL: string);
  end;

implementation

{ TPokeAPIJson }

constructor TPokeWrapper.Create(APokemon: TPokemon);
begin
  FPokeResource  := TPokeResource.Create;
  FMVCRESTClient := TMVCRESTClient.Create;
  FResource      := FPokeResource.GetResourceName(APokemon);
  FBaseUrl       := 'https://pokeapi.co/api/v2/';
  FMVCRESTClient.BaseURL(FBaseUrl);
end;

function TPokeWrapper.Get(AValue: string): string;
var
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LMVCRESTResponse := FMVCRESTClient.Get(Format(FResource, [AValue]));
  if LMVCRESTResponse.Success then
    Result := LMVCRESTResponse.Content
  else
    raise Exception.Create('Not Found');
end;

procedure TPokeWrapper.GetAsEntity(AObject: TObject; AValue: string);
var
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LMVCRESTResponse := FMVCRESTClient.Get(Format(FResource, [AValue]));
  if LMVCRESTResponse.Success then
  begin
    JSONResponseToObject(LMVCRESTResponse, AObject);
  end
  else
    raise Exception.Create('Not Found');
end;

procedure TPokeWrapper.GetAsEntityFromUrl(AObject: TObject; AURL: string);
var
  LMVCRESTResponse: IMVCRESTResponse;
begin
  FMVCRESTClient.BaseURL(AURL);
  LMVCRESTResponse := FMVCRESTClient.Get('');
  FMVCRESTClient.BaseURL(FBaseUrl);
  if LMVCRESTResponse.Success then
  begin
    JSONResponseToObject(LMVCRESTResponse, AObject);
  end
  else
    raise Exception.Create('Not Found');
end;

procedure TPokeWrapper.GetAsEntity(AObject: TObject; AValue: integer);
var
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LMVCRESTResponse := FMVCRESTClient.Get(Format(FResource, [IntToStr(AValue)]));
  if LMVCRESTResponse.Success then
  begin
    JSONResponseToObject(LMVCRESTResponse, AObject);
  end
  else
    raise Exception.Create('Not Found');
end;

function TPokeWrapper.Get(AValue: integer): string;
var
  LMVCRESTResponse: IMVCRESTResponse;
begin
  LMVCRESTResponse := FMVCRESTClient.Get(Format(FResource, [IntToStr(AValue)]));
  if LMVCRESTResponse.Success then
    Result := LMVCRESTResponse.Content
  else
    raise Exception.Create('Not Found');
end;

function TPokeWrapper.GetList(AOffset, ALimit: integer): string;
var
  LMVCRESTResponse: IMVCRESTResponse;
begin
  FMVCRESTClient.AddQueryStringParam('offset', AOffset);
  FMVCRESTClient.AddQueryStringParam('limit', ALimit);
  LMVCRESTResponse := FMVCRESTClient.Get(Format(FResource, ['']));
  if LMVCRESTResponse.Success then
    Result := LMVCRESTResponse.Content
  else
    raise Exception.Create('Not Found');
end;

function TPokeWrapper.GetAsListEntity(AOffset, ALimit: integer): TPokeListEntity;
var
  LMVCRESTResponse: IMVCRESTResponse;
  LPokeListEntity : TPokeListEntity;
begin
  LPokeListEntity := TPokeListEntity.Create;
  FMVCRESTClient.AddQueryStringParam('offset', AOffset);
  FMVCRESTClient.AddQueryStringParam('limit', ALimit);
  LMVCRESTResponse := FMVCRESTClient.Get(Format(FResource, ['']));
  if LMVCRESTResponse.Success then
  begin
    JSONResponseToObject(LMVCRESTResponse, LPokeListEntity);
    Result := LPokeListEntity;
  end
  else
    raise Exception.Create('Not Found');
end;

procedure TPokeWrapper.JSONResponseToObject(AMVCRESTResponse: IMVCRESTResponse; const AObject: TObject);
var
  LMVCJSONSerializer: IMVCJSONSerializer;
  LTJsonObject      : TJsonObject;
begin
  LTJsonObject := nil;
  try
    LTJsonObject       := AMVCRESTResponse.ToJSONObject;
    LMVCJSONSerializer := TMVCJsonDataObjectsSerializer.Create;
    LMVCJSONSerializer.JsonObjectToObject(LTJsonObject, AObject, stDefault, []);
  finally
    LTJsonObject.Free;
  end;
end;

procedure TPokeWrapper.JsonToObject(AJson: string; AObject: TObject);
var
  LTJsonObject      : TJsonObject;
  LMVCJSONSerializer: IMVCJSONSerializer;
begin
  LTJsonObject := nil;
  try
    LTJsonObject       := TMVCJsonDataObjectsSerializer.ParseObject(AJson);
    LMVCJSONSerializer := TMVCJsonDataObjectsSerializer.Create;
    LMVCJSONSerializer.JsonObjectToObject(LTJsonObject, AObject, stDefault, []);
  finally
    LTJsonObject.Free;
  end;
end;

end.
