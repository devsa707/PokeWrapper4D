unit Move.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Machine.Entity,
  Commons.Entities;

type
  TMoveEntity = class
  type
    TNormal = class
    private
      Fuse_after: TObjectList<TResource>;
      Fuse_before: TObjectList<TResource>;
      procedure SetFuse_after(const Value: TObjectList<TResource>);
      procedure SetFuse_before(const Value: TObjectList<TResource>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property use_after: TObjectList<TResource> read Fuse_after
        write SetFuse_after;
      property use_before: TObjectList<TResource> read Fuse_before
        write SetFuse_before;
    end;

    TSuper = class
    private
      Fuse_after: TObjectList<TResource>;
      Fuse_before: TObjectList<TResource>;
      procedure SetFuse_after(const Value: TObjectList<TResource>);
      procedure SetFuse_before(const Value: TObjectList<TResource>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property use_after: TObjectList<TResource> read Fuse_after
        write SetFuse_after;
      property use_before: TObjectList<TResource> read Fuse_before
        write SetFuse_before;
    end;

    TContestCombos = class
    private
      Fnormal: TNormal;
      Fsuper: TSuper;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property normal: TNormal read Fnormal write Fnormal;
      property super: TSuper read Fsuper write Fsuper;
    end;

    TEffectEntries = class
    private
      Feffect: string;
      Flanguage: TResource;
      Fshort_effect: string;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property effect: string read Feffect write Feffect;
      property language: TResource read Flanguage write Flanguage;
      property short_effect: string read Fshort_effect write Fshort_effect;
    end;

    TEffectChanges = class
    private
      Feffect_entries: TObjectList<TEffectEntries>;
      Fversion_group: TResource;
      procedure SetFeffect_entries(const Value: TObjectList<TEffectEntries>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property effect_entries: TObjectList<TEffectEntries> read Feffect_entries
        write SetFeffect_entries;
      property version_group: TResource read Fversion_group
        write Fversion_group;
    end;

    TFlavorTextEntries = class
    private
      Fflavor_text: string;
      Flanguage: TResource;
      Fversion_group: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property flavor_text: string read Fflavor_text write Fflavor_text;
      property language: TResource read Flanguage write Flanguage;
      property version_group: TResource read Fversion_group
        write Fversion_group;
    end;

    TMachines = class
    private
      Fmachine: TMachineEntity;
      Fversion_group: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property Machine: TMachineEntity read Fmachine write Fmachine;
      property version_group: TResource read Fversion_group
        write Fversion_group;
    end;
  private
    Faccuracy: integer;
    Fcontest_combos: TContestCombos;
    Fcontest_effect: TResource;
    Fcontest_type: TResource;
    Fdamage_class: TResource;
    Feffect_chance: integer;
    Feffect_changes: TObjectList<TEffectChanges>;
    Feffect_entries: TObjectList<TEffectEntries>;
    Fflavor_text_entries: TObjectList<TFlavorTextEntries>;
    Fgeneration: TResource;
    Fid: integer;
    Flearned_by_pokemon: TObjectList<TResource>;
    procedure SetFeffect_changes(const Value: TObjectList<TEffectChanges>);
    procedure SetFeffect_entries(const Value: TObjectList<TEffectEntries>);
    procedure SetFflavor_text_entries(const Value
      : TObjectList<TFlavorTextEntries>);
    procedure SetFlearned_by_pokemon(const Value
      : TObjectList<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property accuracy: integer read Faccuracy write Faccuracy;
    property contest_combos: TContestCombos read Fcontest_combos
      write Fcontest_combos;
    property contest_effect: TResource read Fcontest_effect
      write Fcontest_effect;
    property contest_type: TResource read Fcontest_type write Fcontest_type;
    property damage_class: TResource read Fdamage_class write Fdamage_class;
    property effect_chance: integer read Feffect_chance write Feffect_chance;
    property effect_changes: TObjectList<TEffectChanges> read Feffect_changes
      write SetFeffect_changes;
    property effect_entries: TObjectList<TEffectEntries> read Feffect_entries
      write SetFeffect_entries;
    property flavor_text_entries: TObjectList<TFlavorTextEntries>
      read Fflavor_text_entries write SetFflavor_text_entries;
    property generation: TResource read Fgeneration write Fgeneration;
    property id: integer read Fid write Fid;
    property learned_by_pokemon: TObjectList<TResource>
      read Flearned_by_pokemon write SetFlearned_by_pokemon;
  end;

implementation

{ TMoveEntity.TNormal }

constructor TMoveEntity.TNormal.Create;
begin
  Fuse_after := TObjectList<TResource>.Create;
  Fuse_before := TObjectList<TResource>.Create;
end;

destructor TMoveEntity.TNormal.Destroy;
begin
  Fuse_after.Free;
  Fuse_before.Free;
  inherited;
end;

procedure TMoveEntity.TNormal.SetFuse_after(const Value
  : TObjectList<TResource>);
begin
  FreeAndNil(Fuse_after);
  Fuse_after := Value;
end;

procedure TMoveEntity.TNormal.SetFuse_before(const Value
  : TObjectList<TResource>);
begin
  FreeAndNil(Fuse_before);
  Fuse_before := Value;
end;

{ TMoveEntity.TSuper }

constructor TMoveEntity.TSuper.Create;
begin
  Fuse_after := TObjectList<TResource>.Create;
  Fuse_before := TObjectList<TResource>.Create;
end;

destructor TMoveEntity.TSuper.Destroy;
begin
  Fuse_after.Free;
  Fuse_before.Free;
  inherited;
end;

procedure TMoveEntity.TSuper.SetFuse_after(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fuse_after);
  Fuse_after := Value;
end;

procedure TMoveEntity.TSuper.SetFuse_before(const Value
  : TObjectList<TResource>);
begin
  FreeAndNil(Fuse_before);
  Fuse_before := Value;
end;

{ TMoveEntity.TContestCombos }

constructor TMoveEntity.TContestCombos.Create;
begin
  Fnormal := TNormal.Create;
  Fsuper := TSuper.Create;
end;

destructor TMoveEntity.TContestCombos.Destroy;
begin
  Fnormal.Free;
  Fsuper.Free;
  inherited;
end;

{ TMoveEntity }

constructor TMoveEntity.Create;
begin
  Fcontest_combos := TContestCombos.Create;
  Fcontest_effect := TResource.Create;
  Fcontest_type := TResource.Create;
  Fdamage_class := TResource.Create;
  Feffect_changes := TObjectList<TEffectChanges>.Create;
  Feffect_entries := TObjectList<TEffectEntries>.Create;
  Fflavor_text_entries := TObjectList<TFlavorTextEntries>.Create;
  Fgeneration := TResource.Create;
  Flearned_by_pokemon := TObjectList<TResource>.Create;
end;

destructor TMoveEntity.Destroy;
begin
  Fcontest_combos.Free;
  Fcontest_effect.Free;
  Fcontest_type.Free;
  Fdamage_class.Free;
  Feffect_changes.Free;
  Feffect_entries.Free;
  Fflavor_text_entries.Free;
  Fgeneration.Free;
  Flearned_by_pokemon.Free;
  inherited;
end;

procedure TMoveEntity.SetFeffect_changes(const Value
  : TObjectList<TEffectChanges>);
begin
  FreeAndNil(Feffect_changes);
  Feffect_changes := Value;
end;

procedure TMoveEntity.SetFeffect_entries(const Value
  : TObjectList<TEffectEntries>);
begin
  FreeAndNil(Feffect_entries);
  Feffect_entries := Value;
end;

procedure TMoveEntity.SetFflavor_text_entries(const Value
  : TObjectList<TFlavorTextEntries>);
begin
  FreeAndNil(Fflavor_text_entries);
  Fflavor_text_entries := Value;
end;

procedure TMoveEntity.SetFlearned_by_pokemon(const Value
  : TObjectList<TResource>);
begin
  FreeAndNil(Flearned_by_pokemon);
  Flearned_by_pokemon := Value;
end;

{ TMoveEntity.TEffectChanges }

constructor TMoveEntity.TEffectChanges.Create;
begin
  Feffect_entries := TObjectList<TEffectEntries>.Create;
  Fversion_group := TResource.Create;
end;

destructor TMoveEntity.TEffectChanges.Destroy;
begin
  Feffect_entries.Free;
  Fversion_group.Free;
  inherited;
end;

procedure TMoveEntity.TEffectChanges.SetFeffect_entries
  (const Value: TObjectList<TEffectEntries>);
begin
  FreeAndNil(Feffect_entries);
  Feffect_entries := Value;
end;

{ TMoveEntity.TEffectEntries }

constructor TMoveEntity.TEffectEntries.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TMoveEntity.TEffectEntries.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TMoveEntity.TFlavorTextEntries }

constructor TMoveEntity.TFlavorTextEntries.Create;
begin
  Flanguage := TResource.Create;
  Fversion_group := TResource.Create;
end;

destructor TMoveEntity.TFlavorTextEntries.Destroy;
begin
  Flanguage.Free;
  Fversion_group.Free;
  inherited;
end;

{ TMoveEntity.TMachines }

constructor TMoveEntity.TMachines.Create;
begin
  Fmachine := TMachineEntity.Create;
  Fversion_group := TResource.Create;
end;

destructor TMoveEntity.TMachines.Destroy;
begin
  Fmachine.Free;
  Fversion_group.Free;
  inherited;
end;

end.
