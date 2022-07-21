unit Item.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  // MVCFramework
  MVCFramework.Nullables;

type
  TItemEntity = class
  type
    TLanguage = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TVersionGroup = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TAttributes = class
    private
      Fname: NullableString;
      Furl: NullableString;
    public
      property name: NullableString read Fname write Fname;
      property url: NullableString read Furl write Furl;
    end;

    TCategory = class
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

    TFlavorTextEntries = class
    private
      Flanguage: TLanguage;
      Ftext: string;
      Fversion_group: TVersionGroup;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property language: TLanguage read Flanguage write Flanguage;
      property text: string read Ftext write Ftext;
      property version_group: TVersionGroup read Fversion_group
        write Fversion_group;
    end;

  type
    TFlingPower = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TGameIndices = class
    type
      TGeneration = class
      private
        Fname: string;
        Furl: string;
      public
        property name: string read Fname write Fname;
        property url: string read Furl write Furl;
      end;
    private
      Fgame_index: integer;
      Fgeneration: TGeneration;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property game_index: integer read Fgame_index write Fgame_index;
      property generation: TGeneration read Fgeneration write Fgeneration;
    end;
  private
    Fattibutes: TObjectList<TAttributes>;
    Fcategory: TCategory;
    Fcost: integer;
    Feffect_entries: TEffectEntries;
    Ffling_effect: NullableInt32;
    Ffling_power: TFlingPower;
    Fgame_indices: TObjectList<TGameIndices>;
    procedure SetFattibutes(const Value: TObjectList<TAttributes>);
    procedure SetFeffect_entries(const Value: TEffectEntries);
    procedure SetFgame_indices(const Value: TObjectList<TGameIndices>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property attibutes: TObjectList<TAttributes> read Fattibutes
      write SetFattibutes;
    property category: TCategory read Fcategory write Fcategory;
    property cost: integer read Fcost write Fcost;
    property effect_entries: TEffectEntries read Feffect_entries
      write SetFeffect_entries;
    property fling_effect: NullableInt32 read Ffling_effect write Ffling_effect;
    property fling_power: TFlingPower read Ffling_power write Ffling_power;
    property game_indices: TObjectList<TGameIndices> read Fgame_indices
      write SetFgame_indices;
  end;

implementation

{ TItemEntity }

constructor TItemEntity.Create;
begin
  Fattibutes := TObjectList<TAttributes>.Create;
  Fcategory := TCategory.Create;
  Feffect_entries := TObjectList<TEffectEntries>.Create;
  Ffling_power := TFlingPower.Create;
  Fgame_indices := TObjectList<TGameIndices>.Create;
end;

destructor TItemEntity.Destroy;
begin
  Fattibutes.Free;
  Fcategory.Free;
  Feffect_entries.Free;
  Ffling_power.Free;
  Fgame_indices.Free;
  inherited;
end;

procedure TItemEntity.SetFattibutes(const Value: TObjectList<TAttributes>);
begin
  FreeAndNil(Fattibutes);
  Fattibutes := Value;
end;

procedure TItemEntity.SetFeffect_entries(const Value: TEffectEntries);
begin
  FreeAndNil(Feffect_entries);
  Feffect_entries := Value;
end;

procedure TItemEntity.SetFgame_indices(const Value: TObjectList<TGameIndices>);
begin
  FreeAndNil(Fgame_indices);
  Fgame_indices := Value;
end;

{ TItemEntity.TEffectEntries }

constructor TItemEntity.TEffectEntries.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TItemEntity.TEffectEntries.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TItemEntity.TFlavorTextEntries }

constructor TItemEntity.TFlavorTextEntries.Create;
begin
  Flanguage := TLanguage.Create;
  Fversion_group := TVersionGroup.Create;
end;

destructor TItemEntity.TFlavorTextEntries.Destroy;
begin
  Flanguage.Free;
  Fversion_group.Free;
  inherited;
end;

{ TItemEntity.TGameIndices }

constructor TItemEntity.TGameIndices.Create;
begin
  Fgeneration := TGeneration.Create;
end;

destructor TItemEntity.TGameIndices.Destroy;
begin
  Fgeneration.Free;
  inherited;
end;

end.
