unit PokemonFinder;

interface

uses
  System.SysUtils,
  PokeFactory,
  PokeWrapper.Types,
  DataFinder.DB,
  pokemon.Entity;

type
  IPokemonFinder = interface
    ['{440C4CE4-67B8-4608-B304-CE43EBC1DC78}']
    function FindPokemon(AValue: string): TPokemonEntity;
  end;

  TPokemonFinder = class(TInterfacedObject, IPokemonFinder)
  public
    class function New: IPokemonFinder;
    function FindPokemon(AValue: string): TPokemonEntity;
  end;

implementation

function TPokemonFinder.FindPokemon(AValue: string): TPokemonEntity;
var
  LDataFinder   : TDataFinder;
  LGenericEntity: TGenericEntity;
  LJSON         : string;
begin
  LDataFinder := nil;
  try
    Result := TPokemonEntity.Create;
    try
      LDataFinder := TDataFinder.Create(nil);
      LJSON       := LDataFinder.Find(AValue, 'pokemon');
      if LJSON.Equals(EmptyStr) then
      begin
        LGenericEntity := nil;
        try
          LGenericEntity := TGenericEntity.Create;
          TPokeFactory.New(TPokemon.pokemon).GetAsEntity(Result, AValue);
          LJSON                    := TPokeFactory.New(TPokemon.pokemon).Get(AValue);
          LGenericEntity.Id        := Result.Id;
          LGenericEntity.Name      := Result.Name;
          LGenericEntity.Json      := LJSON;
          LGenericEntity.TableName := 'pokemon';
          LDataFinder.Save(LGenericEntity);
        finally
          LGenericEntity.Free;
        end;
      end
      else
      begin
        TPokeFactory.New(TPokemon.pokemon).JsonToObject(LJSON, Result);
      end;
    except
      on E: Exception do
      begin
        FreeAndNil(Result);
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    LDataFinder.Free;
  end;
end;

class function TPokemonFinder.New: IPokemonFinder;
begin
  Result := TPokemonFinder.Create;
end;

end.
