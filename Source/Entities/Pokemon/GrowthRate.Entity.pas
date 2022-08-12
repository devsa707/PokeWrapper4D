unit GrowthRate.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TGrowthRateEntity = class
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

    TLevels = class
    private
      Fexperience: int64;
      Flevel: integer;
    public
      property experience: int64 read Fexperience write Fexperience;
      property level: integer read Flevel write Flevel;
    end;
  private
    Fdescriptions: TObjectList<TDescriptions>;
    Fformula: string;
    Fid: integer;
    Flevels: TObjectList<TLevels>;
    Fname: string;
    Fpokemon_species: TObjectList<TResource>;
    procedure SetFdescriptions(const Value: TObjectList<TDescriptions>);
    procedure SetFlevels(const Value: TObjectList<TLevels>);
    procedure SetFpokemon_species(const Value: TObjectList<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property descriptions: TObjectList<TDescriptions> read Fdescriptions
      write SetFdescriptions;
    property formula: string read Fformula write Fformula;
    property id: integer read Fid write Fid;
    property levels: TObjectList<TLevels> read Flevels write SetFlevels;
    property name: string read Fname write Fname;
    property pokemon_species: TObjectList<TResource> read Fpokemon_species
      write SetFpokemon_species;
  end;

implementation

{ TGrowthRateEntity.TDescriptions }

constructor TGrowthRateEntity.TDescriptions.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TGrowthRateEntity.TDescriptions.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TGrowthRateEntity }

constructor TGrowthRateEntity.Create;
begin
  Fdescriptions := TObjectList<TDescriptions>.Create;
  Flevels := TObjectList<TLevels>.Create;
  Fpokemon_species := TObjectList<TResource>.Create;
end;

destructor TGrowthRateEntity.Destroy;
begin
  Fdescriptions.Free;
  Flevels.Free;
  Fpokemon_species.Free;
  inherited;
end;

procedure TGrowthRateEntity.SetFdescriptions(const Value
  : TObjectList<TDescriptions>);
begin
  FreeAndNil(Fdescriptions);
  Fdescriptions := Value;
end;

procedure TGrowthRateEntity.SetFlevels(const Value: TObjectList<TLevels>);
begin
  FreeAndNil(Flevels);
  Flevels := Value;
end;

procedure TGrowthRateEntity.SetFpokemon_species(const Value
  : TObjectList<TResource>);
begin
  FreeAndNil(Fpokemon_species);
  Fpokemon_species := Value;
end;

end.
