unit Region.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TRegionEntity = class
  private
    Fid: integer;
    Flocations: TObjectList<TResource>;
    Fmain_generation: TResource;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpokedexes: TObjectList<TResource>;
    Fversion_groups: TObjectList<TResource>;
    procedure SetFlocations(const Value: TObjectList<TResource>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpokedexes(const Value: TObjectList<TResource>);
    procedure SetFversion_groups(const Value: TObjectList<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property locations: TObjectList<TResource> read Flocations
      write SetFlocations;
    property main_generation: TResource read Fmain_generation
      write Fmain_generation;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property pokedexes: TObjectList<TResource> read Fpokedexes
      write SetFpokedexes;
    property version_groups: TObjectList<TResource> read Fversion_groups
      write SetFversion_groups;
  end;

implementation

{ TRegionEntity }

constructor TRegionEntity.Create;
begin
  Flocations := TObjectList<TResource>.Create;
  Fmain_generation := TResource.Create;
  Fnames := TObjectList<TNames>.Create;
  Fpokedexes := TObjectList<TResource>.Create;
  Fversion_groups := TObjectList<TResource>.Create;
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

procedure TRegionEntity.SetFlocations(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Flocations);
  Flocations := Value;
end;

procedure TRegionEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TRegionEntity.SetFpokedexes(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fpokedexes);
  Fpokedexes := Value;
end;

procedure TRegionEntity.SetFversion_groups(const Value
  : TObjectList<TResource>);
begin
  FreeAndNil(Fversion_groups);
  Fversion_groups := Value;
end;

end.
