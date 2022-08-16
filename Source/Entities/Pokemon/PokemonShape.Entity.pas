unit PokemonShape.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TPokemonShapeEntity = class
  type
    TAwesomeNames = class
    private
      Fawesome_name: string;
      Flanguage: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property awesome_name: string read Fawesome_name write Fawesome_name;
      property language: TResource read Flanguage write Flanguage;
    end;
  private
    Fawesome_names: TObjectList<TAwesomeNames>;
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpokemon_species: TObjectList<TResource>;
    procedure SetFawesome_names(const Value: TObjectList<TAwesomeNames>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpokemon_species(const Value: TObjectList<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property awesome_names: TObjectList<TAwesomeNames> read Fawesome_names write SetFawesome_names;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property pokemon_species: TObjectList<TResource> read Fpokemon_species write SetFpokemon_species;
  end;

implementation

{ TPokemonShapeEntity.TAwesomeNames }

constructor TPokemonShapeEntity.TAwesomeNames.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TPokemonShapeEntity.TAwesomeNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TPokemonShapeEntity }

constructor TPokemonShapeEntity.Create;
begin
  Fawesome_names := TObjectList<TAwesomeNames>.Create;
  Fnames := TObjectList<TNames>.Create;
  Fpokemon_species := TObjectList<TResource>.Create;
end;

destructor TPokemonShapeEntity.Destroy;
begin
  Fawesome_names.Free;
  Fnames.Free;
  Fpokemon_species.Free;
  inherited;
end;

procedure TPokemonShapeEntity.SetFawesome_names(const Value: TObjectList<TAwesomeNames>);
begin
  FreeAndNil(Fawesome_names);
  Fawesome_names := Value;
end;

procedure TPokemonShapeEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TPokemonShapeEntity.SetFpokemon_species(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fpokemon_species);
  Fpokemon_species := Value;
end;

end.
