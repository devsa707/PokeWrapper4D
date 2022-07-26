unit Region.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TRegionEntity = class
  type
    TLocations = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TMainGeneration = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
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

    TPokedexes = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
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
    Fid: integer;
    Flocations: TObjectList<TLocations>;
    Fmain_generation: TMainGeneration;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpokedexes: TObjectList<TPokedexes>;
    Fversion_groups: TObjectList<TVersionGroups>;
    procedure SetFlocations(const Value: TObjectList<TLocations>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpokedexes(const Value: TObjectList<TPokedexes>);
    procedure SetFversion_groups(const Value: TObjectList<TVersionGroups>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property locations: TObjectList<TLocations> read Flocations
      write SetFlocations;
    property main_generation: TMainGeneration read Fmain_generation
      write Fmain_generation;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property pokedexes: TObjectList<TPokedexes> read Fpokedexes
      write SetFpokedexes;
    property version_groups: TObjectList<TVersionGroups> read Fversion_groups
      write SetFversion_groups;
  end;

implementation

{ TRegionEntity }

constructor TRegionEntity.Create;
begin
  Flocations := TObjectList<TLocations>.Create;
  Fmain_generation := TMainGeneration.Create;
  Fnames := TObjectList<TNames>.Create;
  Fpokedexes := TObjectList<TPokedexes>.Create;
  Fversion_groups := TObjectList<TVersionGroups>.Create;
end;

destructor TRegionEntity.Destroy;
begin
  Flocations.Free;
  Fmain_generation.Free;
  Fnames.Free;
  Fpokedexes.Free;
  Fversion_groups.Free;
  inherited;
end;

procedure TRegionEntity.SetFlocations(const Value: TObjectList<TLocations>);
begin
  FreeAndNil(Flocations);
  Flocations := Value;
end;

procedure TRegionEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TRegionEntity.SetFpokedexes(const Value: TObjectList<TPokedexes>);
begin
  FreeAndNil(Fpokedexes);
  Fpokedexes := Value;
end;

procedure TRegionEntity.SetFversion_groups(const Value
  : TObjectList<TVersionGroups>);
begin
  FreeAndNil(Fversion_groups);
  Fversion_groups := Value;
end;

{ TRegionEntity.TNames }

constructor TRegionEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TRegionEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
