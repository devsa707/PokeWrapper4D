unit PokeAPI.Interfaces;

interface

uses
  PokeList.Entity,
  // MVC MVCFramework
  JsonDataObjects,
  MVCFramework.RESTClient.Intf;

type
  IPokeAPI = interface
    ['{001F71D8-64A6-406D-98AF-08F7F23B138D}']
    function GetList(AIndex: integer; //
      AOffset: integer = 0; //
      ALimit: integer = 20) //
      : string;
    function GetAsListEntity(AIndex: integer; //
      AOffset: integer = 0; //
      ALimit: integer = 20): TPokeListEntity;
    function Get(AIndex: integer; AValue: integer): string; overload;
    function Get(AIndex: integer; AValue: string): string; overload;
  end;

implementation

end.
