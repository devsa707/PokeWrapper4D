unit PokeAPI.Interfaces;

interface

uses
  PokeAPI.Types;

type
  IPokeAPI = interface
    ['{001F71D8-64A6-406D-98AF-08F7F23B138D}']
    function Get(AResource: TBerries; AValue: integer): string; overload;
    function Get(AResource: TBerries; AValue: string): string; overload;
  end;

implementation

end.
