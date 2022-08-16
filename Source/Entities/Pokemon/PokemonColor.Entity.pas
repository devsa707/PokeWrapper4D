unit PokemonColor.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TPokemonColorEntity = class
  private
    Fid: integer;
    Fname: string;
    Fnames: Tobjectlist<Tnames>;
    Fpokemon_species: Tobjectlist<Tresource>;
    procedure SetFnames(const Value: Tobjectlist<Tnames>);
    procedure SetFpokemon_species(const Value: Tobjectlist<Tresource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: Tobjectlist<Tnames> read Fnames write SetFnames;
    property pokemon_species: Tobjectlist<Tresource> read Fpokemon_species write SetFpokemon_species;
  end;

implementation

{ TPokemonColorEntity }

constructor TPokemonColorEntity.Create;
begin
  Fnames := Tobjectlist<Tnames>.Create;
  Fpokemon_species := Tobjectlist<Tresource>.Create;
end;

destructor TPokemonColorEntity.Destroy;
begin
  Fnames.Free;
  Fpokemon_species.Free;
  inherited;
end;

procedure TPokemonColorEntity.SetFnames(const Value: Tobjectlist<Tnames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TPokemonColorEntity.SetFpokemon_species(const Value: Tobjectlist<Tresource>);
begin
  FreeAndNil(Fpokemon_species);
  Fpokemon_species := Value;
end;

end.
