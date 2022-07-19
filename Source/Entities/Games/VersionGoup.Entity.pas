unit VersionGoup.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TVersionGoupEntity = class
  type
    TGeneration = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

  type
    TMoveLearnMethods = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TPokedexes = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TRegions = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TVersions = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

  private
    Fgeneration: TGeneration;
    Fid: integer;
    Fmove_learn_methods: TObjectList<TMoveLearnMethods>;
    Fname: string;
    Forder: integer;
    Fpokedexes: TObjectList<TPokedexes>;
    Fregions: TObjectList<TRegions>;
    Fversions: TObjectList<TVersions>;
    procedure SetFmove_learn_methods(const Value
      : TObjectList<TMoveLearnMethods>);
    procedure SetFpokedexes(const Value: TObjectList<TPokedexes>);
    procedure SetFregions(const Value: TObjectList<TRegions>);
    procedure SetFversions(const Value: TObjectList<TVersions>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property generation: TGeneration read Fgeneration write Fgeneration;
    property id: integer read Fid write Fid;
    property move_learn_methods: TObjectList<TMoveLearnMethods>
      read Fmove_learn_methods write SetFmove_learn_methods;
    property name: string read Fname write Fname;
    property order: integer read Forder write Forder;
    property pokedexes: TObjectList<TPokedexes> read Fpokedexes
      write SetFpokedexes;
    property regions: TObjectList<TRegions> read Fregions write SetFregions;
    property versions: TObjectList<TVersions> read Fversions write SetFversions;
  end;

implementation

{ TVersionGoupEntity }

constructor TVersionGoupEntity.Create;
begin
  Fgeneration := TGeneration.Create;
  Fmove_learn_methods := TObjectList<TMoveLearnMethods>.Create;
  Fpokedexes := TObjectList<TPokedexes>.Create;
  Fregions := TObjectList<TRegions>.Create;
  Fversions := TObjectList<TVersions>.Create;
end;

destructor TVersionGoupEntity.Destroy;
begin
  Fgeneration.Free;
  Fmove_learn_methods.Free;
  Fpokedexes.Free;
  Fregions.Free;
  Fversions.Free;
  inherited;
end;

procedure TVersionGoupEntity.SetFmove_learn_methods
  (const Value: TObjectList<TMoveLearnMethods>);
begin
  FreeAndNil(Fmove_learn_methods);
  Fmove_learn_methods := Value;
end;

procedure TVersionGoupEntity.SetFpokedexes(const Value
  : TObjectList<TPokedexes>);
begin
  FreeAndNil(Fpokedexes);
  Fpokedexes := Value;
end;

procedure TVersionGoupEntity.SetFregions(const Value: TObjectList<TRegions>);
begin
  FreeAndNil(Fregions);
  Fregions := Value;
end;

procedure TVersionGoupEntity.SetFversions(const Value: TObjectList<TVersions>);
begin
  FreeAndNil(Fversions);
  Fversions := Value;
end;

end.
