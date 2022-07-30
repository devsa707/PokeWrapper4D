unit Generation.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type

  TGenerationEntity = class
  private
    Fabilities: TObjectList<TResource>;
    Fid: integer;
    Fmain_region: TResource;
    Fmoves: TObjectList<TResource>;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpokemon_species: TObjectList<TResource>;
    Ftypes: TObjectList<TResource>;
    Fversion_groups: TObjectList<TResource>;
    procedure SetFabilities(const Value: TObjectList<TResource>);
    procedure SetFmoves(const Value: TObjectList<TResource>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpokemon_species(const Value: TObjectList<TResource>);
    procedure SetFtypes(const Value: TObjectList<TResource>);
    procedure SetFversion_groups(const Value: TObjectList<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property abilities: TObjectList<TResource> read Fabilities
      write SetFabilities;
    property id: integer read Fid write Fid;
    property main_region: TResource read Fmain_region write Fmain_region;
    property moves: TObjectList<TResource> read Fmoves write SetFmoves;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property pokemon_species: TObjectList<TResource> read Fpokemon_species
      write SetFpokemon_species;
    property types: TObjectList<TResource> read Ftypes write SetFtypes;
    property version_groups: TObjectList<TResource> read Fversion_groups
      write SetFversion_groups;
  end;

implementation

{ TEvolutionEntity }

constructor TGenerationEntity.Create;
begin
  Fabilities := TObjectList<TResource>.Create;
  Fmain_region := TResource.Create;
  Fmoves := TObjectList<TResource>.Create;
  Fnames := TObjectList<TNames>.Create;
  Fpokemon_species := TObjectList<TResource>.Create;
  Ftypes := TObjectList<TResource>.Create;
  Fversion_groups := TObjectList<TResource>.Create;
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

procedure TGenerationEntity.SetFabilities(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fabilities);
  Fabilities := Value;
end;

procedure TGenerationEntity.SetFmoves(const Value: TObjectList<TResource>);
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
  : TObjectList<TResource>);
begin
  FreeAndNil(Fpokemon_species);
  Fpokemon_species := Value;
end;

procedure TGenerationEntity.SetFtypes(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Ftypes);
  Ftypes := Value;
end;

procedure TGenerationEntity.SetFversion_groups(const Value
  : TObjectList<TResource>);
begin
  FreeAndNil(Fversion_groups);
  Fversion_groups := Value;
end;


end.
