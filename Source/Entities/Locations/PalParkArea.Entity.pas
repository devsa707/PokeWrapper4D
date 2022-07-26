unit PalParkArea.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TPalParkAreaEntity = class
  type
    TNames = class
    type
      TLanguage = class
      private
        Fname: string;
        Furl: string;
      public
        property name: string read Fname write Fname;
        property url: string read Furl write Furl;
      end;
    private
      Flanguage: TLanguage;
      Fname: string;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property language: TLanguage read Flanguage write Flanguage;
      property name: string read Fname write Fname;
    end;

    TPokemonEncounters = class
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
      Fbase_score: integer;
      Fpokemon_species: TPokemonSpecies;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property base_score: integer read Fbase_score write Fbase_score;
      property pokemon_species: TPokemonSpecies read Fpokemon_species
        write Fpokemon_species;
    end;
  private
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpokemon_encounters: TObjectList<TPokemonEncounters>;
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpokemon_encounters(const Value
      : TObjectList<TPokemonEncounters>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property pokemon_encounters: TObjectList<TPokemonEncounters>
      read Fpokemon_encounters write SetFpokemon_encounters;
  end;

implementation

{ TPalParkAreaEntity }

constructor TPalParkAreaEntity.Create;
begin
  Fnames := TObjectList<TNames>.Create;
  Fpokemon_encounters := TObjectList<TPokemonEncounters>.Create;
end;

destructor TPalParkAreaEntity.Destroy;
begin
  Fnames.Free;
  Fpokemon_encounters.Free;
  inherited;
end;

procedure TPalParkAreaEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TPalParkAreaEntity.SetFpokemon_encounters
  (const Value: TObjectList<TPokemonEncounters>);
begin
  FreeAndNil(Fpokemon_encounters);
  Fpokemon_encounters := Value;
end;

{ TPalParkAreaEntity.TNames }

constructor TPalParkAreaEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TPalParkAreaEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TPalParkAreaEntity.TPokemonEncounters }

constructor TPalParkAreaEntity.TPokemonEncounters.Create;
begin
  Fpokemon_species := TPokemonSpecies.Create;
end;

destructor TPalParkAreaEntity.TPokemonEncounters.Destroy;
begin
  Fpokemon_species.Free;
  inherited;
end;

end.
