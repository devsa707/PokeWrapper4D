unit PokemonType.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TPokemonTypeEntity = class
  type
    TDamageRelations = class
    private
      Fdouble_damage_from: TObjectList<TResource>;
      procedure SetFdouble_damage_from(const Value: TObjectList<TResource>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property double_damage_from: TObjectList<TResource> read Fdouble_damage_from write SetFdouble_damage_from;
    end;

    TGameIndices = class
    private
      Fgame_index: integer;
      Fgeneration: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property game_index: integer read Fgame_index write Fgame_index;
      property generation: TResource read Fgeneration write Fgeneration;
    end;

  type
    TPastDamageRelations = class
    type
      TDamageRelations = class
      private
        Fno_damage_to: TObjectList<TResource>;
        Fhalf_damage_to: TObjectList<TResource>;
        Fdouble_damage_to: TObjectList<TResource>;
        Fno_damage_from: TObjectList<TResource>;
        Fhalf_damage_from: TObjectList<TResource>;
        Fdouble_damage_from: TObjectList<TResource>;
        procedure SetFhalf_damage_to(const Value: TObjectList<TResource>);
        procedure SetFno_damage_to(const Value: TObjectList<TResource>);
        procedure SetFdouble_damage_to(const Value: TObjectList<TResource>);
        procedure SetFno_damage_from(const Value: TObjectList<TResource>);
        procedure SetFhalf_damage_from(const Value: TObjectList<TResource>);
        procedure SetFdouble_damage_from(const Value: TObjectList<TResource>);
      public
        constructor Create; overload;
        destructor Destroy; override;
        property no_damage_to: TObjectList<TResource> read Fno_damage_to write SetFno_damage_to;
        property half_damage_to: TObjectList<TResource> read Fhalf_damage_to write SetFhalf_damage_to;
        property double_damage_to: TObjectList<TResource> read Fdouble_damage_to write SetFdouble_damage_to;
        property no_damage_from: TObjectList<TResource> read Fno_damage_from write SetFno_damage_from;
        property half_damage_from: TObjectList<TResource> read Fhalf_damage_from write SetFhalf_damage_from;
        property double_damage_from: TObjectList<TResource> read Fdouble_damage_from write SetFdouble_damage_from;
      end;
    private
      Fgeneration: TResource;
      Fdamage_relations: TPastDamageRelations.TDamageRelations;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property generation: TResource read Fgeneration write Fgeneration;
      property damage_relations: TPastDamageRelations.TDamageRelations read Fdamage_relations write Fdamage_relations;
    end;

    TPokemon = class
    private
      Fpokemon: TResource;
      Fslot: integer;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property pokemon: TResource read Fpokemon write Fpokemon;
      property slot: integer read Fslot write Fslot;
    end;
  private
    Fdamage_relations: TDamageRelations;
    Fgame_indices: TObjectList<TGameIndices>;
    Fgeneration: TResource;
    Fid: integer;
    Fmove_damage_class: TResource;
    Fmoves: TObjectList<TResource>;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpast_damage_relations: TObjectList<TPastDamageRelations>;
    Fpokemon: TObjectList<TPokemon>;
    procedure SetFgame_indices(const Value: TObjectList<TGameIndices>);
    procedure SetFmoves(const Value: TObjectList<TResource>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpast_damage_relations(const Value: TObjectList<TPastDamageRelations>);
    procedure SetFpokemon(const Value: TObjectList<TPokemon>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property damage_relations: TDamageRelations read Fdamage_relations write Fdamage_relations;
    property game_indices: TObjectList<TGameIndices> read Fgame_indices write SetFgame_indices;
    property generation: TResource read Fgeneration write Fgeneration;
    property id: integer read Fid write Fid;
    property move_damage_class: TResource read Fmove_damage_class write Fmove_damage_class;
    property moves: TObjectList<TResource> read Fmoves write SetFmoves;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property past_damage_relations: TObjectList<TPastDamageRelations> read Fpast_damage_relations write SetFpast_damage_relations;
    property pokemon: TObjectList<TPokemon> read Fpokemon write SetFpokemon;
  end;

implementation

{ TPokemonTypeEntity.TDamageRelations }

constructor TPokemonTypeEntity.TDamageRelations.Create;
begin
  Fdouble_damage_from := TObjectList<TResource>.Create;
end;

destructor TPokemonTypeEntity.TDamageRelations.Destroy;
begin
  Fdouble_damage_from.Free;
  inherited;
end;

procedure TPokemonTypeEntity.TDamageRelations.SetFdouble_damage_from(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fdouble_damage_from);
  Fdouble_damage_from := Value;
end;

{ TPokemonTypeEntity }

constructor TPokemonTypeEntity.Create;
begin
  Fdamage_relations := TDamageRelations.Create;
  Fgame_indices := TObjectList<TGameIndices>.Create;
  Fgeneration := TResource.Create;
  Fmove_damage_class := TResource.Create;
  Fmoves := TObjectList<TResource>.Create;
  Fnames := TObjectList<TNames>.Create;
  Fpast_damage_relations := TObjectList<TPastDamageRelations>.Create;
  Fpokemon := TObjectList<TPokemon>.Create;
end;

destructor TPokemonTypeEntity.Destroy;
begin
  Fdamage_relations.Free;
  Fgame_indices.Free;
  Fgeneration.Free;
  Fmove_damage_class.Free;
  Fmoves.Free;
  Fnames.Free;
  Fpast_damage_relations.Free;
  Fpokemon.Free;
  inherited;
end;

procedure TPokemonTypeEntity.SetFgame_indices(const Value: TObjectList<TGameIndices>);
begin
  FreeAndNil(Fgame_indices);
  Fgame_indices := Value;
end;

procedure TPokemonTypeEntity.SetFmoves(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fmoves);
  Fmoves := Value;
end;

procedure TPokemonTypeEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TPokemonTypeEntity.SetFpast_damage_relations(const Value: TObjectList<TPastDamageRelations>);
begin
  FreeAndNil(Fpast_damage_relations);
  Fpast_damage_relations := Value;
end;

procedure TPokemonTypeEntity.SetFpokemon(const Value: TObjectList<TPokemon>);
begin
  FreeAndNil(Fpokemon);
  Fpokemon := Value;
end;

{ TPokemonTypeEntity.TGameIndices }

constructor TPokemonTypeEntity.TGameIndices.Create;
begin
  Fgeneration := TResource.Create;
end;

destructor TPokemonTypeEntity.TGameIndices.Destroy;
begin
  Fgeneration.Free;
  inherited;
end;

{ TPokemonTypeEntity.TPastDamageRelations.TDamageRelations }

constructor TPokemonTypeEntity.TPastDamageRelations.TDamageRelations.Create;
begin
  Fno_damage_to := TObjectList<TResource>.Create;
  Fhalf_damage_to := TObjectList<TResource>.Create;
  Fdouble_damage_to := TObjectList<TResource>.Create;
  Fno_damage_from := TObjectList<TResource>.Create;
  Fhalf_damage_from := TObjectList<TResource>.Create;
  Fdouble_damage_from := TObjectList<TResource>.Create;
end;

destructor TPokemonTypeEntity.TPastDamageRelations.TDamageRelations.Destroy;
begin
  Fno_damage_to.Free;
  Fhalf_damage_to.Free;
  Fdouble_damage_to.Free;
  Fno_damage_from.Free;
  Fhalf_damage_from.Free;
  Fdouble_damage_from.Free;
  inherited;
end;

procedure TPokemonTypeEntity.TPastDamageRelations.TDamageRelations.SetFdouble_damage_from(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fdouble_damage_from);
  Fdouble_damage_from := Value;
end;

procedure TPokemonTypeEntity.TPastDamageRelations.TDamageRelations.SetFdouble_damage_to(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fdouble_damage_to);
  Fdouble_damage_to := Value;
end;

procedure TPokemonTypeEntity.TPastDamageRelations.TDamageRelations.SetFhalf_damage_from(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fhalf_damage_from);
  Fhalf_damage_from := Value;
end;

procedure TPokemonTypeEntity.TPastDamageRelations.TDamageRelations.SetFhalf_damage_to(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fhalf_damage_to);
  Fhalf_damage_to := Value;
end;

procedure TPokemonTypeEntity.TPastDamageRelations.TDamageRelations.SetFno_damage_from(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fno_damage_from);
  Fno_damage_from := Value;
end;

procedure TPokemonTypeEntity.TPastDamageRelations.TDamageRelations.SetFno_damage_to(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fno_damage_to);
  Fno_damage_to := Value;
end;

{ TPokemonTypeEntity.TPastDamageRelations }

constructor TPokemonTypeEntity.TPastDamageRelations.Create;
begin
  Fgeneration := TResource.Create;
  Fdamage_relations := TPastDamageRelations.TDamageRelations.Create;
end;

destructor TPokemonTypeEntity.TPastDamageRelations.Destroy;
begin
  Fgeneration.Free;
  Fdamage_relations.Free;
  inherited;
end;

{ TPokemonTypeEntity.TPokemon }

constructor TPokemonTypeEntity.TPokemon.Create;
begin
  Fpokemon := TResource.Create;
end;

destructor TPokemonTypeEntity.TPokemon.Destroy;
begin
  Fpokemon.Free;
  inherited;
end;

end.
