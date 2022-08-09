unit Ability.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TAbilityEntity = class
  type
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
    type
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

    TPokemon = class
    private
      Fis_hidden: boolean;
      Fpokemon: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property is_hidden: boolean read Fis_hidden write Fis_hidden;
      property pokemon: TResource read Fpokemon write Fpokemon;
    end;
  private
    Feffect_changes: TObjectList<TEffectChanges>;
    Feffect_entries: TObjectList<TEffectEntries>;
    Fflavor_text_entries: TObjectList<TFlavorTextEntries>;
    Fgeneration: TResource;
    Fid: integer;
    Fis_main_series: boolean;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fpokemon: TObjectList<TPokemon>;
    procedure SetFeffect_changes(const Value: TObjectList<TEffectChanges>);
    procedure SetFeffect_entries(const Value: TObjectList<TEffectEntries>);
    procedure SetFflavor_text_entries(const Value
      : TObjectList<TFlavorTextEntries>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFpokemon(const Value: TObjectList<TPokemon>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property effect_changes: TObjectList<TEffectChanges> read Feffect_changes
      write SetFeffect_changes;
    property effect_entries: TObjectList<TEffectEntries> read Feffect_entries
      write SetFeffect_entries;
    property flavor_text_entries: TObjectList<TFlavorTextEntries>
      read Fflavor_text_entries write SetFflavor_text_entries;
    property generation: TResource read Fgeneration write Fgeneration;
    property id: integer read Fid write Fid;
    property is_main_series: boolean read Fis_main_series write Fis_main_series;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property pokemon: TObjectList<TPokemon> read Fpokemon write SetFpokemon;
  end;

implementation

{ TAbilityEntity.TEffectEntries }

constructor TAbilityEntity.TEffectEntries.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TAbilityEntity.TEffectEntries.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TAbilityEntity.TEffectChanges }

constructor TAbilityEntity.TEffectChanges.Create;
begin
  Feffect_entries := TObjectList<TEffectEntries>.Create;
  Fversion_group := TResource.Create;
end;

destructor TAbilityEntity.TEffectChanges.Destroy;
begin
  Feffect_entries.Free;
  Fversion_group.Free;
  inherited;
end;

procedure TAbilityEntity.TEffectChanges.SetFeffect_entries
  (const Value: TObjectList<TEffectEntries>);
begin
  FreeAndNil(Feffect_entries);
  Feffect_entries := Value;
end;

{ TAbilityEntity }

constructor TAbilityEntity.Create;
begin
  Feffect_changes := TObjectList<TEffectChanges>.Create;
  Feffect_entries := TObjectList<TEffectEntries>.Create;
  Fflavor_text_entries := TObjectList<TFlavorTextEntries>.Create;
  Fgeneration := TResource.Create;
  Fnames := TObjectList<TNames>.Create;
  Fpokemon := TObjectList<TPokemon>.Create;
end;

destructor TAbilityEntity.Destroy;
begin
  Feffect_changes.Free;
  Feffect_entries.Free;
  Fflavor_text_entries.Free;
  Fgeneration.Free;
  Fnames.Free;
  Fpokemon.Free;
  inherited;
end;

procedure TAbilityEntity.SetFeffect_changes(const Value
  : TObjectList<TEffectChanges>);
begin
  FreeAndNil(Feffect_changes);
  Feffect_changes := Value;
end;

procedure TAbilityEntity.SetFeffect_entries(const Value
  : TObjectList<TEffectEntries>);
begin
  FreeAndNil(Feffect_entries);
  Feffect_entries := Value;
end;

procedure TAbilityEntity.SetFflavor_text_entries(const Value
  : TObjectList<TFlavorTextEntries>);
begin
  FreeAndNil(Fflavor_text_entries);
  Fflavor_text_entries := Value;
end;

procedure TAbilityEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TAbilityEntity.SetFpokemon(const Value: TObjectList<TPokemon>);
begin
  FreeAndNil(Fpokemon);
  Fpokemon := Value;
end;

{ TAbilityEntity.TFlavorTextEntries }

constructor TAbilityEntity.TFlavorTextEntries.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TAbilityEntity.TFlavorTextEntries.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TAbilityEntity.TPokemon }

constructor TAbilityEntity.TPokemon.Create;
begin
  Fpokemon := TResource.Create;
end;

destructor TAbilityEntity.TPokemon.Destroy;
begin
  Fpokemon.Free;
  inherited;
end;

end.
