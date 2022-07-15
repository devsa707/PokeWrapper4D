unit PokeAPI.Interfaces;

interface

uses
  PokeAPI.Resources;

type
  IPokeAPI = interface
    ['{001F71D8-64A6-406D-98AF-08F7F23B138D}']
    function Get(AResource: TResource): string;
  end;

implementation

end.
