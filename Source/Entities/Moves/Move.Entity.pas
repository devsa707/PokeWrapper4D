unit Move.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  MVCFramework.Nullables,
  //
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

    TMachine = class
    private
      Furl: string;
    public
      property url: string read Furl write Furl;
    end;

    TMachines = class
    private
      Fmachine: TMachine;
      Fversion_group: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property machine: TMachine read Fmachine write Fmachine;
      property version_group: TResource read Fversion_group
        write Fversion_group;
    end;

    TMeta = class
    private
      Failment: TResource;
      Failment_chance: integer;
      Fcategory: TResource;
      Fcrit_rate: integer;
      Fdrain: integer;
      Fflinch_chance: integer;
      Fhealing: integer;
      Fmax_hits: NullableInt32;
      Fmax_turns: NullableInt32;
      Fmin_hits: NullableInt32;
      Fmin_turns: NullableInt32;
      Fstat_chance: integer;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property ailment: TResource read Failment write Failment;
      property ailment_chance: integer read Failment_chance
        write Failment_chance;
      property category: TResource read Fcategory write Fcategory;
      property crit_rate: integer read Fcrit_rate write Fcrit_rate;
      property drain: integer read Fdrain write Fdrain;
      property flinch_chance: integer read Fflinch_chance write Fflinch_chance;
      property healing: integer read Fhealing write Fhealing;
      property max_hits: NullableInt32 read Fmax_hits write Fmax_hits;
      property max_turns: NullableInt32 read Fmax_turns write Fmax_turns;
      property min_hits: NullableInt32 read Fmin_hits write Fmin_hits;
      property min_turns: NullableInt32 read Fmin_turns write Fmin_turns;
      property stat_chance: integer read Fstat_chance write Fstat_chance;
    end;

  type
    TPastValues = class
    type
      TEffectEntries = class
      private
        Feffect: string;
        Fshort_effect: string;
        Flanguage: TResource;
      public
        constructor Create; overload;
        destructor Destroy; override;
        property effect: string read Feffect write Feffect;
        property short_effect: string read Fshort_effect write Fshort_effect;
        property language: TResource read Flanguage write Flanguage;
      end;
    private
      Faccuracy: integer;
      Feffect_chance: integer;
      Fpower: integer;
      Fpp: integer;
    public
      property accuracy: integer read Faccuracy write Faccuracy;
      property effect_chance: integer read Feffect_chance write Feffect_chance;
      property power: integer read Fpower write Fpower;
      property pp: integer read Fpp write Fpp;
    end;

    TStatChanges = class
    private
      Fchange: integer;
      Fstat: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property change: integer read Fchange write Fchange;
      property stat: TResource read Fstat write Fstat;
    end;

    TSuperContestEffect = class
    private
      Furl: string;
    public
      property url: string read Furl write Furl;
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
    Fmachines: TObjectList<TMachines>;
    Fmeta: TMeta;
    Fnames: TObjectList<TNames>;
    Fpast_values: TObjectList<TPastValues>;
    Ftype: TResource;
    Fpower: integer;
    Fpp: integer;
    Fpriority: integer;
    Fstat_changes: TObjectList<TStatChanges>;
    Fsuper_contest_effect: TSuperContestEffect;
    Ftarget: TResource;
    procedure SetFeffect_changes(const Value: TObjectList<TEffectChanges>);
    procedure SetFeffect_entries(const Value: TObjectList<TEffectEntries>);
    procedure SetFflavor_text_entries(const Value
      : TObjectList<TFlavorTextEntries>);
    procedure SetFlearned_by_pokemon(const Value: TObjectList<TResource>);
    procedure SetFmachines(const Value: TObjectList<TMachines>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpast_values(const Value: TObjectList<TPastValues>);
    procedure SetFstat_changes(const Value: TObjectList<TStatChanges>);
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
    property learned_by_pokemon: TObjectList<TResource> read Flearned_by_pokemon
      write SetFlearned_by_pokemon;
    property machines: TObjectList<TMachines> read Fmachines write SetFmachines;
    property meta: TMeta read Fmeta write Fmeta;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property past_values: TObjectList<TPastValues> read Fpast_values
      write SetFpast_values;
    property power: integer read Fpower write Fpower;
    property pp: integer read Fpp write Fpp;
    property priority: integer read Fpriority write Fpriority;
    property stat_changes: TObjectList<TStatChanges> read Fstat_changes
      write SetFstat_changes;
    property super_contest_effect: TSuperContestEffect
      read Fsuper_contest_effect write Fsuper_contest_effect;
    property target: TResource read Ftarget write Ftarget;
    property type_: TResource read Ftype write Ftype;
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
  Fmachines := TObjectList<TMachines>.Create;
  Fmeta := TMeta.Create;
  Fnames := TObjectList<TNames>.Create;
  Fpast_values := TObjectList<TPastValues>.Create;
  Ftype := TResource.Create;
  Fstat_changes := TObjectList<TStatChanges>.Create;
  Fsuper_contest_effect := TSuperContestEffect.Create;
  Ftarget := TResource.Create;
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
  Fmachines.Free;
  Fmeta.Free;
  Fnames.Free;
  Fpast_values.Free;
  Ftype.Free;
  Fstat_changes.Free;
  Fsuper_contest_effect.Free;
  Ftarget.Free;
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

procedure TMoveEntity.SetFmachines(const Value: TObjectList<TMachines>);
begin
  FreeAndNil(Fmachines);
  Fmachines := Value;
end;

procedure TMoveEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TMoveEntity.SetFpast_values(const Value: TObjectList<TPastValues>);
begin
  FreeAndNil(Fpast_values);
  Fpast_values := Value;
end;

procedure TMoveEntity.SetFstat_changes(const Value: TObjectList<TStatChanges>);
begin
  FreeAndNil(Fstat_changes);
  Fstat_changes := Value;
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
  Fmachine := TMachine.Create;
  Fversion_group := TResource.Create;
end;

destructor TMoveEntity.TMachines.Destroy;
begin
  Fmachine.Free;
  Fversion_group.Free;
  inherited;
end;

{ TMoveEntity.TMeta }

constructor TMoveEntity.TMeta.Create;
begin
  Failment := TResource.Create;
  Fcategory := TResource.Create;
end;

destructor TMoveEntity.TMeta.Destroy;
begin
  Failment.Free;
  Fcategory.Free;
  inherited;
end;

{ TMoveEntity.TPastValues.TEffectEntries }

constructor TMoveEntity.TPastValues.TEffectEntries.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TMoveEntity.TPastValues.TEffectEntries.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TMoveEntity.TStatChanges }

constructor TMoveEntity.TStatChanges.Create;
begin
  Fstat := TResource.Create;
end;

destructor TMoveEntity.TStatChanges.Destroy;
begin
  Fstat.Free;
  inherited;
end;

end.
