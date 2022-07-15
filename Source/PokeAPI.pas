unit PokeAPI;

interface

uses
  // System
  System.Generics.Collections,
  //
  PokeAPI.Resources,
  PokeAPI.Interfaces,
  // MVCFramework
  MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient;

type

  TPokeAPIJson = class(TInterfacedObject, IPokeAPI)
  private
    FBaseUrl: string;
    FMVCRESTClient: IMVCRESTClient;

  public
    constructor Create(ABaseUrl: string); overload;
    function Get(AResource: TResource): string;
  end;

implementation

{ TPokeAPIJson }

constructor TPokeAPIJson.Create(ABaseUrl: string);
begin
  FBaseUrl := ABaseUrl;
  FMVCRESTClient := TMVCRESTClient.Create;
end;

function TPokeAPIJson.Get(AResource: TResource): string;
var
  LMVCRESTResponse: IMVCRESTResponse;
begin
  FMVCRESTClient.BaseURL(FBaseUrl);
  LMVCRESTResponse := FMVCRESTClient.Get(GetResourceName(AResource) + '1');
  Result := LMVCRESTResponse.Content;
end;

end.
