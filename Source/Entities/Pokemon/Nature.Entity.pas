unit Nature.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TNatureEntity = class
  type
    TMoveBattleStylePreferences = class
    private
      Fhigh_hp_preference: integer;
      Flow_hp_preference: integer;
      Fmove_battle_style: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property high_hp_preference: integer read Fhigh_hp_preference
        write Fhigh_hp_preference;
      property low_hp_preference: integer read Flow_hp_preference
        write Flow_hp_preference;
      property move_battle_style: TResource read Fmove_battle_style
        write Fmove_battle_style;
    end;

    TPokeathlonStatChanges = class
    private
      Fmax_change: integer;
      Fpokeathlon_stat: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property max_change: integer read Fmax_change write Fmax_change;
      property pokeathlon_stat: TResource read Fpokeathlon_stat
        write Fpokeathlon_stat;
    end;
  private
    Fdecreased_stat: TResource;
    Fhates_flavor: TResource;
    Fid: integer;
    Fincreased_stat: TResource;
    Flikes_flavor: TResource;
    Fmove_battle_style_preferences: TObjectList<TMoveBattleStylePreferences>;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpokeathlon_stat_changes: TObjectList<TPokeathlonStatChanges>;
    procedure SetFmove_battle_style_preferences(const Value
      : TObjectList<TMoveBattleStylePreferences>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpokeathlon_stat_changes(const Value
      : TObjectList<TPokeathlonStatChanges>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property decreased_stat: TResource read Fdecreased_stat
      write Fdecreased_stat;
    property hates_flavor: TResource read Fhates_flavor write Fhates_flavor;
    property id: integer read Fid write Fid;
    property increased_stat: TResource read Fincreased_stat
      write Fincreased_stat;
    property likes_flavor: TResource read Flikes_flavor write Flikes_flavor;
    property move_battle_style_preferences
      : TObjectList<TMoveBattleStylePreferences>
      read Fmove_battle_style_preferences
      write SetFmove_battle_style_preferences;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property pokeathlon_stat_changes: TObjectList<TPokeathlonStatChanges>
      read Fpokeathlon_stat_changes write SetFpokeathlon_stat_changes;
  end;

implementation

{ TNatureEntity }

constructor TNatureEntity.Create;
begin
  Fdecreased_stat := TResource.Create;
  Fhates_flavor := TResource.Create;
  Fincreased_stat := TResource.Create;
  Flikes_flavor := TResource.Create;
  Fmove_battle_style_preferences :=
    TObjectList<TMoveBattleStylePreferences>.Create;
  Fnames := TObjectList<TNames>.Create;
  Fpokeathlon_stat_changes := TObjectList<TPokeathlonStatChanges>.Create;
end;

destructor TNatureEntity.Destroy;
begin
  Fdecreased_stat.Free;
  Fhates_flavor.Free;
  Fincreased_stat.Free;
  Flikes_flavor.Free;
  Fmove_battle_style_preferences.Free;
  Fnames.Free;
  Fpokeathlon_stat_changes.Free;
  inherited;
end;

procedure TNatureEntity.SetFmove_battle_style_preferences
  (const Value: TObjectList<TMoveBattleStylePreferences>);
begin
  FreeAndNil(Fmove_battle_style_preferences);
  Fmove_battle_style_preferences := Value;
end;

procedure TNatureEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TNatureEntity.SetFpokeathlon_stat_changes
  (const Value: TObjectList<TPokeathlonStatChanges>);
begin
  FreeAndNil(Fpokeathlon_stat_changes);
  Fpokeathlon_stat_changes := Value;
end;

{ TNatureEntity.TMoveBattleStylePreferences }

constructor TNatureEntity.TMoveBattleStylePreferences.Create;
begin
  Fmove_battle_style := TResource.Create;
end;

destructor TNatureEntity.TMoveBattleStylePreferences.Destroy;
begin
  Fmove_battle_style.Free;
  inherited;
end;

{ TNatureEntity.TPokeathlonStatChanges }

constructor TNatureEntity.TPokeathlonStatChanges.Create;
begin
  Fpokeathlon_stat := TResource.Create;
end;

destructor TNatureEntity.TPokeathlonStatChanges.Destroy;
begin
  Fpokeathlon_stat.Free;
  inherited;
end;

end.
