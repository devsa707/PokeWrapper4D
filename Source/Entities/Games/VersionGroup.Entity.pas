unit VersionGroup.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TVersionGroupEntity = class
  private
    Fgeneration: TResource;
    Fid: integer;
    Fmove_learn_methods: TObjectList<TResource>;
    Fname: string;
    Forder: integer;
    Fpokedexes: TObjectList<TResource>;
    Fregions: TObjectList<TResource>;
    Fversions: TObjectList<TResource>;
    procedure SetFmove_learn_methods(const Value
      : TObjectList<TResource>);
    procedure SetFpokedexes(const Value: TObjectList<TResource>);
    procedure SetFregions(const Value: TObjectList<TResource>);
    procedure SetFversions(const Value: TObjectList<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property generation: TResource read Fgeneration write Fgeneration;
    property id: integer read Fid write Fid;
    property move_learn_methods: TObjectList<TResource>
      read Fmove_learn_methods write SetFmove_learn_methods;
    property name: string read Fname write Fname;
    property order: integer read Forder write Forder;
    property pokedexes: TObjectList<TResource> read Fpokedexes
      write SetFpokedexes;
    property regions: TObjectList<TResource> read Fregions write SetFregions;
    property versions: TObjectList<TResource> read Fversions write SetFversions;
  end;

implementation

{ TVersionGoupEntity }

constructor TVersionGroupEntity.Create;
begin
  Fgeneration := TResource.Create;
  Fmove_learn_methods := TObjectList<TResource>.Create;
  Fpokedexes := TObjectList<TResource>.Create;
  Fregions := TObjectList<TResource>.Create;
  Fversions := TObjectList<TResource>.Create;
end;

destructor TVersionGroupEntity.Destroy;
begin
  Fgeneration.Free;
  Fmove_learn_methods.Free;
  Fpokedexes.Free;
  Fregions.Free;
  Fversions.Free;
  inherited;
end;

procedure TVersionGroupEntity.SetFmove_learn_methods
  (const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fmove_learn_methods);
  Fmove_learn_methods := Value;
end;

procedure TVersionGroupEntity.SetFpokedexes(const Value
  : TObjectList<TResource>);
begin
  FreeAndNil(Fpokedexes);
  Fpokedexes := Value;
end;

procedure TVersionGroupEntity.SetFregions(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fregions);
  Fregions := Value;
end;

procedure TVersionGroupEntity.SetFversions(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fversions);
  Fversions := Value;
end;

end.
