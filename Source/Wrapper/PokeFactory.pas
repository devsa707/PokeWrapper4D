unit PokeFactory;

interface

uses
  System.TypInfo,
  PokeWrapper.Types,
  PokeWrapper,
  PokeWrapper.Interfaces;

type
  TPokeFactory = class
    class function New(APokemon : TPokemon): IPokeWrapper;
  end;

implementation

{ TPokeFactory }

class function TPokeFactory.New(APokemon : TPokemon): IPokeWrapper;
begin
  Result := TPokeWrapper.Create(APokemon);
end;

end.
