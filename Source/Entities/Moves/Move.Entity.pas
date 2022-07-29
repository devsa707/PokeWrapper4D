unit Move.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TMoveEntity = class
  type
    TLanguage = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TUseAfter = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TUseBefore = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TNormal = class
    private
      Fuse_after: TObjectList<TUseAfter>;
      Fuse_before: TObjectList<TUseBefore>;
      procedure SetFuse_after(const Value: TObjectList<TUseAfter>);
      procedure SetFuse_before(const Value: TObjectList<TUseBefore>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property use_after: TObjectList<TUseAfter> read Fuse_after
        write SetFuse_after;
      property use_before: TObjectList<TUseBefore> read Fuse_before
        write SetFuse_before;
    end;

    TSuper = class
    private
      Fuse_after: TObjectList<TUseAfter>;
      Fuse_before: TObjectList<TUseBefore>;
      procedure SetFuse_after(const Value: TObjectList<TUseAfter>);
      procedure SetFuse_before(const Value: TObjectList<TUseBefore>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property use_after: TObjectList<TUseAfter> read Fuse_after
        write SetFuse_after;
      property use_before: TObjectList<TUseBefore> read Fuse_before
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

    TContestEffect = class
    private
      Furl: string;
    public
      property url: string read Furl write Furl;
    end;

    TContestType = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TDamageClass = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TEffectEntries = class
    private
      Feffect: string;
      Flanguage: TLanguage;
      Fshort_effect: string;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property effect: string read Feffect write Feffect;
      property language: TLanguage read Flanguage write Flanguage;
      property short_effect: string read Fshort_effect write Fshort_effect;
    end;

    TEffectChanges = class
    type
      TVersionGroup = class
      private
        Fname: string;
        Furl: string;
      public
        property name: string read Fname write Fname;
        property url: string read Furl write Furl;
      end;
    private
      Feffect_entries: TObjectList<TEffectEntries>;
      Fversion_group: TVersionGroup;
      procedure SetFeffect_entries(const Value: TObjectList<TEffectEntries>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property effect_entries: TObjectList<TEffectEntries> read Feffect_entries
        write SetFeffect_entries;
      property version_group: TVersionGroup read Fversion_group
        write Fversion_group;
    end;

  private
    Faccuracy: integer;
    Fcontest_combos: TContestCombos;
    Fcontest_effect: TContestEffect;
    Fcontest_type: TContestType;
    Fdamage_class: TDamageClass;
    Feffect_chance: integer;
    Feffect_changes: TObjectList<TEffectChanges>;
    Feffect_entries: TObjectList<TEffectEntries>;
    procedure SetFeffect_changes(const Value: TObjectList<TEffectChanges>);
    procedure SetFeffect_entries(const Value: TObjectList<TEffectEntries>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property accuracy: integer read Faccuracy write Faccuracy;
    property contest_combos: TContestCombos read Fcontest_combos
      write Fcontest_combos;
    property contest_effect: TContestEffect read Fcontest_effect
      write Fcontest_effect;
    property contest_type: TContestType read Fcontest_type write Fcontest_type;
    property damage_class: TDamageClass read Fdamage_class write Fdamage_class;
    property effect_chance: integer read Feffect_chance write Feffect_chance;
    property effect_changes: TObjectList<TEffectChanges> read Feffect_changes
      write SetFeffect_changes;
    property effect_entries: TObjectList<TEffectEntries> read Feffect_entries
      write SetFeffect_entries;
  end;

implementation

{ TMoveEntity.TNormal }

constructor TMoveEntity.TNormal.Create;
begin
  Fuse_after := TObjectList<TUseAfter>.Create;
  Fuse_before := TObjectList<TUseBefore>.Create;
end;

destructor TMoveEntity.TNormal.Destroy;
begin
  Fuse_after.Free;
  Fuse_before.Free;
  inherited;
end;

procedure TMoveEntity.TNormal.SetFuse_after(const Value
  : TObjectList<TUseAfter>);
begin
  FreeAndNil(Fuse_after);
  Fuse_after := Value;
end;

procedure TMoveEntity.TNormal.SetFuse_before(const Value
  : TObjectList<TUseBefore>);
begin
  FreeAndNil(Fuse_before);
  Fuse_before := Value;
end;

{ TMoveEntity.TSuper }

constructor TMoveEntity.TSuper.Create;
begin
  Fuse_after := TObjectList<TUseAfter>.Create;
  Fuse_before := TObjectList<TUseBefore>.Create;
end;

destructor TMoveEntity.TSuper.Destroy;
begin
  Fuse_after.Free;
  Fuse_before.Free;
  inherited;
end;

procedure TMoveEntity.TSuper.SetFuse_after(const Value: TObjectList<TUseAfter>);
begin
  FreeAndNil(Fuse_after);
  Fuse_after := Value;
end;

procedure TMoveEntity.TSuper.SetFuse_before(const Value
  : TObjectList<TUseBefore>);
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
  Fcontest_effect := TContestEffect.Create;
  Fcontest_type := TContestType.Create;
  Fdamage_class := TDamageClass.Create;
  Feffect_changes := TObjectList<TEffectChanges>.Create;
  Feffect_entries := TObjectList<TEffectEntries>.Create;
end;

destructor TMoveEntity.Destroy;
begin
  Fcontest_combos.Free;
  Fcontest_effect.Free;
  Fcontest_type.Free;
  Fdamage_class.Free;
  Feffect_changes.Free;
  Feffect_entries.Free;
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

{ TMoveEntity.TEffectChanges }

constructor TMoveEntity.TEffectChanges.Create;
begin
  Feffect_entries := TObjectList<TEffectEntries>.Create;
  Fversion_group := TVersionGroup.Create;
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

end;

{ TMoveEntity.TEffectEntries }

constructor TMoveEntity.TEffectEntries.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TMoveEntity.TEffectEntries.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
