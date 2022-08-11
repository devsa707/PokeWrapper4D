unit EggGroup.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TEggGroupEntity = class
  private
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpokemon_species: TObjectList<TResource>;
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpokemon_species(const Value: TObjectList<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property pokemon_species: TObjectList<TResource> read Fpokemon_species
      write SetFpokemon_species;
  end;

implementation

{ TEggGroupEntity }

constructor TEggGroupEntity.Create;
begin
  Fnames := TObjectList<TNames>.Create;
  Fpokemon_species := TObjectList<TResource>.Create;
end;

destructor TEggGroupEntity.Destroy;
begin
  Fnames.Free;
  Fpokemon_species.Free;
  inherited;
end;

procedure TEggGroupEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TEggGroupEntity.SetFpokemon_species(const Value
  : TObjectList<TResource>);
begin
  FreeAndNil(Fpokemon_species);
  Fpokemon_species := Value;
end;

end.
