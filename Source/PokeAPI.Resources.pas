unit PokeAPI.Resources;

interface

type
  TResource = (berry_firmness, //
    berry_flavor);

function GetResourceName(AResource: TResource): string;

implementation

function GetResourceName(AResource: TResource): string;
begin
  result := 'berry-firmness';
end;

end.
