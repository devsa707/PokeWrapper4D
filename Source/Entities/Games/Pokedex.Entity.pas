unit Pokedex.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TPokedexEntity = class
  type
    TDescriptions = class
    private
      Fdescription: string;
      Flanguage: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property description: string read Fdescription write Fdescription;
      property language: TResource read Flanguage write Flanguage;
    end;
    TPokemonEntries = class
    private
      Fentry_number: integer;
      Fpokemon_species: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property entry_number: integer read Fentry_number write Fentry_number;
      property pokemon_species: TResource read Fpokemon_species
        write Fpokemon_species;
    end;
  private
    Fdescriptions: TObjectList<TDescriptions>;
    Fid: integer;
    Fis_main_series: boolean;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpokemon_entries: TObjectList<TPokemonEntries>;
    Fregion: TResource;
    Fversion_groups: TObjectList<TResource>;
    procedure SetFdescriptions(const Value: TObjectList<TDescriptions>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpokemon_entries(const Value: TObjectList<TPokemonEntries>);
    procedure SetFversion_groups(const Value: TObjectList<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property descriptions: TObjectList<TDescriptions> read Fdescriptions
      write SetFdescriptions;
    property id: integer read Fid write Fid;
    property is_main_series: boolean read Fis_main_series write Fis_main_series;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property pokemon_entries: TObjectList<TPokemonEntries> read Fpokemon_entries
      write SetFpokemon_entries;
    property region: TResource read Fregion write Fregion;
    property version_groups: TObjectList<TResource> read Fversion_groups
      write SetFversion_groups;
  end;

implementation

{ TPokedexEntity.TDescriptions }

constructor TPokedexEntity.TDescriptions.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TPokedexEntity.TDescriptions.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TPokedexEntity }

constructor TPokedexEntity.Create;
begin
  Fdescriptions := TObjectList<TDescriptions>.Create;
  Fnames := TObjectList<TNames>.Create;
  Fpokemon_entries := TObjectList<TPokemonEntries>.Create;
  Fregion := TResource.Create;
  Fversion_groups := TObjectList<TResource>.Create;
end;

destructor TPokedexEntity.Destroy;
begin
  Fdescriptions.Free;
  Fnames.Free;
  Fpokemon_entries.Free;
  Fregion.Free;
  Fversion_groups.Free;
  inherited;
end;

procedure TPokedexEntity.SetFdescriptions(const Value
  : TObjectList<TDescriptions>);
begin
  FreeAndNil(Fdescriptions);
  Fdescriptions := Value;
end;

procedure TPokedexEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TPokedexEntity.SetFpokemon_entries(const Value
  : TObjectList<TPokemonEntries>);
begin
  FreeAndNil(Fpokemon_entries);
  Fpokemon_entries := Value;
end;

procedure TPokedexEntity.SetFversion_groups(const Value
  : TObjectList<TResource>);
begin
  FreeAndNil(Fversion_groups);
  Fversion_groups := Value;
end;

{ TPokedexEntity.TPokemonEntries }

constructor TPokedexEntity.TPokemonEntries.Create;
begin
  Fpokemon_species := TResource.Create;
end;

destructor TPokedexEntity.TPokemonEntries.Destroy;
begin
  Fpokemon_species.Free;
  inherited;
end;

end.
