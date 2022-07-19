unit Pokedex.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  // MVC Framerowk
  MVCFramework.Nullables;

type
  TPokedexEntity = class
  type
    TLanguage = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TDescriptions = class
    private
      Fdescription: string;
      Flanguage: TLanguage;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property description: string read Fdescription write Fdescription;
      property language: TLanguage read Flanguage write Flanguage;
    end;

    TNames = class
    private
      Flanguage: TLanguage;
      Fname: string;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property language: TLanguage read Flanguage write Flanguage;
      property name: string read Fname write Fname;
    end;

    TPokemonEntries = class
    type
      TPokemonSpecies = class
      private
        Fname: string;
        Furl: string;
      public
        property name: string read Fname write Fname;
        property url: string read Furl write Furl;
      end;
    private
      Fentry_number: integer;
      Fpokemon_species: TPokemonSpecies;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property entry_number: integer read Fentry_number write Fentry_number;
      property pokemon_species: TPokemonSpecies read Fpokemon_species
        write Fpokemon_species;
    end;

    TRegion = class
    private
      Fname: NullableString;
      Furl: NullableString;
    public
      property name: NullableString read Fname write Fname;
      property url: NullableString read Furl write Furl;
    end;

    TVersionGroups = class
    private
      Fname: NullableString;
      Furl: NullableString;
    public
      property name: NullableString read Fname write Fname;
      property url: NullableString read Furl write Furl;
    end;
  private
    Fdescriptions: TObjectList<TDescriptions>;
    Fid: integer;
    Fis_main_series: boolean;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpokemon_entries: TObjectList<TPokemonEntries>;
    Fregion: TRegion;
    Fversion_groups: TObjectList<TVersionGroups>;
    procedure SetFdescriptions(const Value: TObjectList<TDescriptions>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpokemon_entries(const Value: TObjectList<TPokemonEntries>);
    procedure SetFversion_groups(const Value: TObjectList<TVersionGroups>);
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
    property region: TRegion read Fregion write Fregion;
    property version_groups: TObjectList<TVersionGroups> read Fversion_groups
      write SetFversion_groups;
  end;

implementation

{ TPokedexEntity.TDescriptions }

constructor TPokedexEntity.TDescriptions.Create;
begin
  Flanguage := TLanguage.Create;
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
  Fregion := TRegion.Create;
  Fversion_groups := TObjectList<TVersionGroups>.Create;
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
  : TObjectList<TVersionGroups>);
begin
  FreeAndNil(Fversion_groups);
  Fversion_groups := Value;
end;

{ TPokedexEntity.TNames }

constructor TPokedexEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TPokedexEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TPokedexEntity.TPokemonEntries }

constructor TPokedexEntity.TPokemonEntries.Create;
begin
  Fpokemon_species := TPokemonSpecies.Create;
end;

destructor TPokedexEntity.TPokemonEntries.Destroy;
begin
  Fpokemon_species.Free;
  inherited;
end;

end.
