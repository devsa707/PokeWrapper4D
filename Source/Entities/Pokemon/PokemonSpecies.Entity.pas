unit PokemonSpecies.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TPokemonSpeciesEntity = class
  type
    TEvolutionChain = class
    private
      Furl: string;
    public
      property url: string read Furl write Furl;
    end;

    TFlavorTextEntries = class
    private
      Fflavor_text: string;
      Flanguage: TResource;
      Fversion: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property flavor_text: string read Fflavor_text write Fflavor_text;
      property language: TResource read Flanguage write Flanguage;
      property version: TResource read Fversion write Fversion;
    end;

    TFormDescriptions = class
    private
      Feffect: string;
      Flanguage: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property effect: string read Feffect write Feffect;
      property language: TResource read Flanguage write Flanguage;
    end;

    TGenera = class
    private
      Fgenus: string;
      Flanguage: TResource;
    public
      property genus: string read Fgenus write Fgenus;
      property language: TResource read Flanguage write Flanguage;
    end;

    TPalParkEncounters = class
    private
      Farea: TResource;
      Fbase_score: integer;
      Frate: integer;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property area: TResource read Farea write Farea;
      property base_score: integer read Fbase_score write Fbase_score;
      property rate: integer read Frate write Frate;
    end;

    TPokedexNumbers = class
    private
      Fentry_number: integer;
      Fpokedex: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property entry_number: integer read Fentry_number write Fentry_number;
      property pokedex: TResource read Fpokedex write Fpokedex;
    end;

    TVarieties = class
    private
      Fis_default: boolean;
      Fpokemon: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property is_default: boolean read Fis_default write Fis_default;
      property pokemon: TResource read Fpokemon write Fpokemon;
    end;
  private
    Fbase_happiness: integer;
    Fcapture_rate: integer;
    Fcolor: TResource;
    Fegg_groups: TObjectList<TResource>;
    Fevolution_chain: TEvolutionChain;
    Fevolves_from_species: TResource;
    Fflavor_text_entries: TObjectList<TFlavorTextEntries>;
    Fform_descriptions: TObjectList<TFormDescriptions>;
    Fforms_switchable: boolean;
    Fgender_rate: integer;
    Fgenera: TObjectList<TGenera>;
    Fgeneration: TResource;
    Fgrowth_rate: TResource;
    Fhabitat: TResource;
    Fhas_gender_differences: boolean;
    Fhatch_counter: integer;
    Fid: integer;
    Fis_baby: boolean;
    Fis_legendary: boolean;
    Fis_mythical: boolean;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Forder: integer;
    Fpal_park_encounters: TObjectList<TPalParkEncounters>;
    Fpokedex_numbers: TObjectList<TPokedexNumbers>;
    Fshape: TResource;
    Fvarieties: TObjectList<TVarieties>;
    procedure SetFegg_groups(const Value: TObjectList<TResource>);
    procedure SetFflavor_text_entries(const Value: TObjectList<TFlavorTextEntries>);
    procedure SetFdescriptions(const Value: TObjectList<TFormDescriptions>);
    procedure SetFgenera(const Value: TObjectList<TGenera>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpal_park_encounters(const Value: TObjectList<TPalParkEncounters>);
    procedure SetFpokedex_numbers(const Value: TObjectList<TPokedexNumbers>);
    procedure SetFvarieties(const Value: TObjectList<TVarieties>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property base_happiness: integer read Fbase_happiness write Fbase_happiness;
    property capture_rate: integer read Fcapture_rate write Fcapture_rate;
    property color: TResource read Fcolor write Fcolor;
    property egg_groups: TObjectList<TResource> read Fegg_groups write SetFegg_groups;
    property evolution_chain: TEvolutionChain read Fevolution_chain write Fevolution_chain;
    property evolves_from_species: TResource read Fevolves_from_species write Fevolves_from_species;
    property flavor_text_entries: TObjectList<TFlavorTextEntries> read Fflavor_text_entries write SetFflavor_text_entries;
    property form_descriptions: TObjectList<TFormDescriptions> read Fform_descriptions write SetFdescriptions;
    property forms_switchable: boolean read Fforms_switchable write Fforms_switchable;
    property gender_rate: integer read Fgender_rate write Fgender_rate;
    property genera: TObjectList<TGenera> read Fgenera write SetFgenera;
    property generation: TResource read Fgeneration write Fgeneration;
    property growth_rate: TResource read Fgrowth_rate write Fgrowth_rate;
    property habitat: TResource read Fhabitat write Fhabitat;
    property has_gender_differences: boolean read Fhas_gender_differences write Fhas_gender_differences;
    property hatch_counter: integer read Fhatch_counter write Fhatch_counter;
    property id: integer read Fid write Fid;
    property is_baby: boolean read Fis_baby write Fis_baby;
    property is_legendary: boolean read Fis_legendary write Fis_legendary;
    property is_mythical: boolean read Fis_mythical write Fis_mythical;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property order: integer read Forder write Forder;
    property pal_park_encounters: TObjectList<TPalParkEncounters> read Fpal_park_encounters write SetFpal_park_encounters;
    property pokedex_numbers: TObjectList<TPokedexNumbers> read Fpokedex_numbers write SetFpokedex_numbers;
    property shape: TResource read Fshape write Fshape;
    property varieties: TObjectList<TVarieties> read Fvarieties write SetFvarieties;
  end;

implementation

{ TPokemonSpeciesEntity }

constructor TPokemonSpeciesEntity.Create;
begin
  Fcolor := TResource.Create;
  Fegg_groups := TObjectList<TResource>;
  Fevolution_chain := TEvolutionChain.Create;
  Fevolves_from_species := TResource.Create;
  Fflavor_text_entries := TObjectList<TFlavorTextEntries>.Create;
  Fform_descriptions := TObjectList<TFormDescriptions>.Create;
  Fgenera := TObjectList<TGenera>.Create;
  Fgeneration := TResource.Create;
  Fgrowth_rate := TResource.Create;
  Fhabitat := TResource.Create;
  Fnames := TObjectList<TNames>.Create;
  Fpal_park_encounters := TObjectList<TPalParkEncounters>.Create;
  Fpokedex_numbers := TObjectList<TPokedexNumbers>.Create;
  Fshape := TResource.Create;
  Fvarieties := TObjectList<TVarieties>.Create;
end;

destructor TPokemonSpeciesEntity.Destroy;
begin
  Fcolor.Free;
  Fegg_groups.Free;
  Fevolution_chain.Free;
  Fevolves_from_species.Free;
  Fflavor_text_entries.Free;
  Fform_descriptions.Free;
  Fgenera.Free;
  Fgeneration.Free;
  Fgrowth_rate.Free;
  Fhabitat.Free;
  Fnames.Free;
  Fpal_park_encounters.Free;
  Fpokedex_numbers.Free;
  Fshape.Free;
  Fvarieties.Free;
  inherited;
end;

procedure TPokemonSpeciesEntity.SetFdescriptions(const Value: TObjectList<TFormDescriptions>);
begin
  FreeAndNil(Fform_descriptions);
  Fform_descriptions := Value;
end;

procedure TPokemonSpeciesEntity.SetFegg_groups(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fegg_groups);
  Fegg_groups := Value;
end;

procedure TPokemonSpeciesEntity.SetFflavor_text_entries(const Value: TObjectList<TFlavorTextEntries>);
begin
  FreeAndNil(Fflavor_text_entries);
  Fflavor_text_entries := Value;
end;

procedure TPokemonSpeciesEntity.SetFgenera(const Value: TObjectList<TGenera>);
begin
  FreeAndNil(Fgenera);
  Fgenera := Value;
end;

procedure TPokemonSpeciesEntity.SetFnames(const Value: tobjeclist<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TPokemonSpeciesEntity.SetFpal_park_encounters(const Value: TObjectList<TPalParkEncounters>);
begin
  FreeAndNil(Fpal_park_encounters);
  Fpal_park_encounters := Value;
end;

procedure TPokemonSpeciesEntity.SetFpokedex_numbers(const Value: TObjectList<TPokedexNumbers>);
begin
  FreeAndNil(Fpokedex_numbers);
  Fpokedex_numbers := Value;
end;

procedure TPokemonSpeciesEntity.SetFvarieties(const Value: TObjectList<TVarieties>);
begin
  FreeAndNil(Fvarieties);
  Fvarieties := Value;
end;

{ TPokemonSpeciesEntity.TFlavorTextEntries }

constructor TPokemonSpeciesEntity.TFlavorTextEntries.Create;
begin
  Flanguage := TResource.Create;
  Fversion := TResource.Create;
end;

destructor TPokemonSpeciesEntity.TFlavorTextEntries.Destroy;
begin
  Flanguage.Free;
  Fversion.Free;
  inherited;
end;

{ TPokemonSpeciesEntity.TDescription }

constructor TPokemonSpeciesEntity.TFormDescriptions.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TPokemonSpeciesEntity.TFormDescriptions.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TPokemonSpeciesEntity.TPalParkEncounters }

constructor TPokemonSpeciesEntity.TPalParkEncounters.Create;
begin
  Farea := TResource.Create;
end;

destructor TPokemonSpeciesEntity.TPalParkEncounters.Destroy;
begin
  Farea.Free;
  inherited;
end;

{ TPokemonSpeciesEntity.TPokedexNumbers }

constructor TPokemonSpeciesEntity.TPokedexNumbers.Create;
begin
  Fpokedex := TResource.Create
end;

destructor TPokemonSpeciesEntity.TPokedexNumbers.Destroy;
begin
  Fpokedex.Free;
  inherited;
end;

{ TPokemonSpeciesEntity.TVarieties }

constructor TPokemonSpeciesEntity.TVarieties.Create;
begin
  Fpokemon := TResource.Create;
end;

destructor TPokemonSpeciesEntity.TVarieties.Destroy;
begin
  Fpokemon.Free;
  inherited;
end;

end.
