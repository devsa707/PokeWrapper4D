unit PokeAPI.Interfaces;

interface

type
  IPokeAPI = interface
    ['{001F71D8-64A6-406D-98AF-08F7F23B138D}']
    function GetList(AIndex: integer; //
      AOffset: integer = 20; //
      ALimit: integer = 20) //
      : string; overload;
    function Get(AIndex: integer; AValue: integer): string; overload;
    function Get(AIndex: integer; AValue: string): string; overload;
  end;

implementation

end.
