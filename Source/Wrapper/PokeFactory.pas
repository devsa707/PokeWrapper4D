unit PokeFactory;

interface

uses
  System.TypInfo,
  PokeWrapper,
  PokeWrapper.Interfaces;

type
  TPokeFactory = class
    class function New(AResourceNumber: Integer): IPokeWrapper;
  end;

implementation

{ TPokeFactory }

class function TPokeFactory.New(AResourceNumber: Integer): IPokeWrapper;
begin
  Result := TPokeWrapper.Create(AResourceNumber);
end;

end.
