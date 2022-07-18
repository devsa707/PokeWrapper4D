unit EvolutionTrigger.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TEvolutionTriggerEntity = class
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

    TPokemonSpecies = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;
  private
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpokemon_species: TObjectList<TPokemonSpecies>;
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpokemon_species(const Value: TObjectList<TPokemonSpecies>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property pokemon_species: TObjectList<TPokemonSpecies> read Fpokemon_species
      write SetFpokemon_species;
  end;

implementation

{ TEvolutionTriggerEntity }

constructor TEvolutionTriggerEntity.Create;
begin
  Fnames := TObjectList<TNames>.Create;
  Fpokemon_species := TObjectList<TPokemonSpecies>.Create;
end;

destructor TEvolutionTriggerEntity.Destroy;
begin
  Fnames.Free;
  Fpokemon_species.Free;
  inherited;
end;

procedure TEvolutionTriggerEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TEvolutionTriggerEntity.SetFpokemon_species
  (const Value: TObjectList<TPokemonSpecies>);
begin
  FreeAndNil(Fpokemon_species);
  Fpokemon_species := Value;
end;

{ TEvolutionTriggerEntity.TNames }

constructor TEvolutionTriggerEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TEvolutionTriggerEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
