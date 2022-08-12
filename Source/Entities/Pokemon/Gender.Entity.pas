unit Gender.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TGenderEntity = class
  type
    TPokemonSpeciesDetails = class
    private
      Fpokemon_species: TResource;
      Frate: integer;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property pokemon_species: TResource read Fpokemon_species
        write Fpokemon_species;
      property rate: integer read Frate write Frate;
    end;
  private
    Fid: integer;
    Fname: string;
    Fpokemon_species_details: TObjectList<TPokemonSpeciesDetails>;
    Frequired_for_evolution: TObjectList<TResource>;
    procedure SetFpokemon_species_details(const Value
      : TObjectList<TPokemonSpeciesDetails>);
    procedure SetFrequired_for_evolution(const Value: TObjectList<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property pokemon_species_details: TObjectList<TPokemonSpeciesDetails>
      read Fpokemon_species_details write SetFpokemon_species_details;
    property required_for_evolution: TObjectList<TResource>
      read Frequired_for_evolution write SetFrequired_for_evolution;
  end;

implementation

{ TGenderEntity.TPokemonSpeciesDetails }

constructor TGenderEntity.TPokemonSpeciesDetails.Create;
begin
  Fpokemon_species := TResource.Create;
end;

destructor TGenderEntity.TPokemonSpeciesDetails.Destroy;
begin
  Fpokemon_species.Free;
  inherited;
end;

{ TGenderEntity }

constructor TGenderEntity.Create;
begin
  Fpokemon_species_details := TObjectList<TPokemonSpeciesDetails>.Create;
  Frequired_for_evolution := TObjectList<TResource>.Create;
end;

destructor TGenderEntity.Destroy;
begin
  Fpokemon_species_details.Free;
  Frequired_for_evolution.Free;
  inherited;
end;

procedure TGenderEntity.SetFpokemon_species_details
  (const Value: TObjectList<TPokemonSpeciesDetails>);
begin
  FreeAndNil(Fpokemon_species_details);
  Fpokemon_species_details := Value;
end;

procedure TGenderEntity.SetFrequired_for_evolution
  (const Value: TObjectList<TResource>);
begin
  FreeAndNil(Frequired_for_evolution);
  Frequired_for_evolution := Value;
end;

end.
