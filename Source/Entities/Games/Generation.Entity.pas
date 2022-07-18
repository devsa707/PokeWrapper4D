unit Generation.Entity;

interface

uses
  MVCFramework.Nullables,
  System.SysUtils,
  System.Generics.Collections;

type

  TGenerationEntity = class
  type
    TAbilities = class
    private
      Fname: NullableString;
      Furl: NullableString;
    public
      property name: NullableString read Fname write Fname;
      property url: NullableString read Furl write Furl;
    end;

    TMainRegion = class
    private
      Fname: NullableString;
      Furl: NullableString;
    public
      property name: NullableString read Fname write Fname;
      property url: NullableString read Furl write Furl;
    end;

    TMoves = class
    private
      Fname: NullableString;
      Furl: NullableString;
    public
      property name: NullableString read Fname write Fname;
      property url: NullableString read Furl write Furl;
    end;

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

    TTypes = class
    private
      Fname: NullableString;
      Furl: NullableString;
    public
      property name: NullableString read Fname write Fname;
      property url: NullableString read Furl write Furl;
    end;

    TVersionGroups = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;
  private
    Fabilities: TObjectList<TAbilities>;
    Fid: integer;
    Fmain_region: TMainRegion;
    Fmoves: TObjectList<TMoves>;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpokemon_species: TObjectList<TPokemonSpecies>;
    Ftypes: TObjectList<TTypes>;
    Fversion_groups: TObjectList<TVersionGroups>;
    procedure SetFabilities(const Value: TObjectList<TAbilities>);
    procedure SetFmoves(const Value: TObjectList<TMoves>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpokemon_species(const Value: TObjectList<TPokemonSpecies>);
    procedure SetFtypes(const Value: TObjectList<TTypes>);
    procedure SetFversion_groups(const Value: TObjectList<TVersionGroups>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property abilities: TObjectList<TAbilities> read Fabilities
      write SetFabilities;
    property id: integer read Fid write Fid;
    property main_region: TMainRegion read Fmain_region write Fmain_region;
    property moves: TObjectList<TMoves> read Fmoves write SetFmoves;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property pokemon_species: TObjectList<TPokemonSpecies> read Fpokemon_species
      write SetFpokemon_species;
    property types: TObjectList<TTypes> read Ftypes write SetFtypes;
    property version_groups: TObjectList<TVersionGroups> read Fversion_groups
      write SetFversion_groups;
  end;

implementation

{ TEvolutionEntity }

constructor TGenerationEntity.Create;
begin
  Fabilities := TObjectList<TAbilities>.Create;
  Fmain_region := TMainRegion.Create;
  Fmoves := TObjectList<TMoves>.Create;
  Fnames := TObjectList<TNames>.Create;
  Fpokemon_species := TObjectList<TPokemonSpecies>.Create;
  Ftypes := TObjectList<TTypes>.Create;
  Fversion_groups := TObjectList<TVersionGroups>.Create;
end;

destructor TGenerationEntity.Destroy;
begin
  Fabilities.Free;
  Fmain_region.Free;
  Fmoves.Free;
  Fnames.Free;
  Fpokemon_species.Free;
  Ftypes.Free;
  Fversion_groups.Free;
  inherited;
end;

procedure TGenerationEntity.SetFabilities(const Value: TObjectList<TAbilities>);
begin
  FreeAndNil(Fabilities);
  Fabilities := Value;
end;

procedure TGenerationEntity.SetFmoves(const Value: TObjectList<TMoves>);
begin
  FreeAndNil(Fmoves);
  Fmoves := Value;
end;

procedure TGenerationEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TGenerationEntity.SetFpokemon_species(const Value
  : TObjectList<TPokemonSpecies>);
begin
  FreeAndNil(Fpokemon_species);
  Fpokemon_species := Value;
end;

procedure TGenerationEntity.SetFtypes(const Value: TObjectList<TTypes>);
begin
  FreeAndNil(Ftypes);
  Ftypes := Value;
end;

procedure TGenerationEntity.SetFversion_groups(const Value
  : TObjectList<TVersionGroups>);
begin
  FreeAndNil(Fversion_groups);
  Fversion_groups := Value;
end;

{ TEvolutionEntity.TNames }

constructor TGenerationEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TGenerationEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
