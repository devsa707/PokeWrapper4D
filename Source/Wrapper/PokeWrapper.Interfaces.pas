unit PokeWrapper.Interfaces;

interface

uses
  System.TypInfo,
  PokeList.Entity,
  // MVC MVCFramework
  JsonDataObjects,
  MVCFramework.RESTClient.Intf;

type
  IPokeWrapper = interface
    ['{001F71D8-64A6-406D-98AF-08F7F23B138D}']
    // Function
    function GetList(AOffset: integer = 0; ALimit: integer = 20): string;
    function GetAsListEntity(AOffset: integer = 0; ALimit: integer = 20): TPokeListEntity;
    function Get(AValue: integer): string; overload;
    function Get(AValue: string): string; overload;
    // Procedure
    procedure JsonToObject(AJson: string; AObject: TObject);
    procedure GetAsEntity(AObject: TObject; AValue: integer)overload;
    procedure GetAsEntity(AObject: TObject; AValue: string)overload;
    procedure GetAsEntityFromUrl(AObject: TObject; AURL: string);
  end;

implementation

end.
