unit Item.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  // MVCFramework
  MVCFramework.Nullables,
  //
  Commons.Entities;

type
  TItemEntity = class
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

    TFlavorTextEntries = class
    private
      Flanguage: TResource;
      Ftext: string;
      Fversion_group: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property language: TResource read Flanguage write Flanguage;
      property text: string read Ftext write Ftext;
      property version_group: TResource read Fversion_group
        write Fversion_group;
    end;

  type
    TFlingEffect = class
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

    THeldByPokemon = class
    type
      TVersionDetails = class
      type
        TVersion = class
        private
          Fname: NullableString;
          Furl: NullableString;
        public
          property name: NullableString read Fname write Fname;
          property url: NullableString read Furl write Furl;
        end;
      private
        Frarity: NullableInt32;
        Fversion: TVersion;
      public
        constructor Create; overload;
        destructor Destroy; override;
        property rarity: NullableInt32 read Frarity write Frarity;
        property version: TVersion read Fversion write Fversion;
      end;

      TPokemon = class
      private
        Fname: NullableString;
        Furl: NullableString;
      public
        property name: NullableString read Fname write Fname;
        property url: NullableString read Furl write Furl;
      end;
    private
      FversionDetails: TObjectList<TVersionDetails>;
      Fpokemon: TPokemon;
      procedure SetFversionDetails(const Value: TObjectList<TVersionDetails>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property pokemon: TPokemon read Fpokemon write Fpokemon;
      property version_details: TObjectList<TVersionDetails>
        read FversionDetails write SetFversionDetails;
    end;

    TSprites = class
    private
      Fdefault: string;
    public
      property default: string read Fdefault write Fdefault;
    end;

    TMachines = class
    private
      Fmachine: NullableString;
      Fversion_group: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property machine: NullableString read Fmachine write Fmachine;
      property version_group: TResource read Fversion_group
        write Fversion_group;
    end;
  private
    Fattributes: TObjectList<TResource>;
    Fcategory: TResource;
    Fcost: integer;
    Feffect_entries: TObjectList<TEffectEntries>;
    Ffling_effect: TFlingEffect;
    Ffling_power: NullableInt32;
    Fgame_indices: TObjectList<TGameIndices>;
    Fheld_by_pokemon: TObjectList<THeldByPokemon>;
    Fid: integer;
    Fmachines: TObjectList<TMachines>;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fsprites: TSprites;
    procedure SetFattibutes(const Value: TObjectList<TResource>);
    procedure SetFeffect_entries(const Value: TObjectList<TEffectEntries>);
    procedure SetFgame_indices(const Value: TObjectList<TGameIndices>);
    procedure SetFheld_by_pokemon(const Value: TObjectList<THeldByPokemon>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFmachines(const Value: TObjectList<TMachines>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property attributes: TObjectList<TResource> read Fattributes
      write SetFattibutes;
    property category: TResource read Fcategory write Fcategory;
    property cost: integer read Fcost write Fcost;
    property effect_entries: TObjectList<TEffectEntries> read Feffect_entries
      write SetFeffect_entries;
    property fling_effect: TFlingEffect read Ffling_effect write Ffling_effect;
    property fling_power: NullableInt32 read Ffling_power write Ffling_power;
    property game_indices: TObjectList<TGameIndices> read Fgame_indices
      write SetFgame_indices;
    property held_by_pokemon: TObjectList<THeldByPokemon> read Fheld_by_pokemon
      write SetFheld_by_pokemon;
    property id: integer read Fid write Fid;
    property machines: TObjectList<TMachines> read Fmachines write SetFmachines;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property sprites: TSprites read Fsprites write Fsprites;
  end;

implementation

{ TItemEntity }

constructor TItemEntity.Create;
begin
  Fattributes := TObjectList<TResource>.Create;
  Fcategory := TResource.Create;
  Feffect_entries := TObjectList<TEffectEntries>.Create;
  Ffling_effect := TFlingEffect.Create;
  Fgame_indices := TObjectList<TGameIndices>.Create;
  Fheld_by_pokemon := TObjectList<THeldByPokemon>.Create;
  Fnames := TObjectList<TNames>.Create;
  Fsprites := TSprites.Create;
  Fmachines := TObjectList<TMachines>.Create;
end;

destructor TItemEntity.Destroy;
begin
  Fattributes.Free;
  Fcategory.Free;
  Feffect_entries.Free;
  Ffling_effect.Free;
  Fgame_indices.Free;
  Fheld_by_pokemon.Free;
  Fnames.Free;
  Fsprites.Free;
  Fmachines.Free;
  inherited;
end;

procedure TItemEntity.SetFattibutes(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fattributes);
  Fattributes := Value;
end;

procedure TItemEntity.SetFeffect_entries(const Value
  : TObjectList<TEffectEntries>);
begin
  FreeAndNil(Feffect_entries);
  Feffect_entries := Value;
end;

procedure TItemEntity.SetFgame_indices(const Value: TObjectList<TGameIndices>);
begin
  FreeAndNil(Fgame_indices);
  Fgame_indices := Value;
end;

procedure TItemEntity.SetFheld_by_pokemon(const Value
  : TObjectList<THeldByPokemon>);
begin
  FreeAndNil(Fheld_by_pokemon);
  Fheld_by_pokemon := Value;
end;

procedure TItemEntity.SetFmachines(const Value: TObjectList<TMachines>);
begin
  FreeAndNil(Fmachines);
  Fmachines := Value;
end;

procedure TItemEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

{ TItemEntity.TEffectEntries }

constructor TItemEntity.TEffectEntries.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TItemEntity.TEffectEntries.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TItemEntity.TFlavorTextEntries }

constructor TItemEntity.TFlavorTextEntries.Create;
begin
  Flanguage := TResource.Create;
  Fversion_group := TResource.Create;
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

{ TItemEntity.THeldByPokemon }

constructor TItemEntity.THeldByPokemon.Create;
begin
  Fpokemon := TPokemon.Create;
  FversionDetails := TObjectList<TVersionDetails>.Create;
end;

destructor TItemEntity.THeldByPokemon.Destroy;
begin
  Fpokemon.Free;
  FversionDetails.Free;
  inherited;
end;

procedure TItemEntity.THeldByPokemon.SetFversionDetails
  (const Value: TObjectList<TVersionDetails>);
begin
  FreeAndNil(FversionDetails);
  FversionDetails := Value;
end;

{ TItemEntity.TMachines }

constructor TItemEntity.TMachines.Create;
begin
  Fversion_group := TResource.Create;
end;

destructor TItemEntity.TMachines.Destroy;
begin
  Fversion_group.Free;
  inherited;
end;

{ TItemEntity.THeldByPokemon.TVersionDetails }

constructor TItemEntity.THeldByPokemon.TVersionDetails.Create;
begin
  Fversion := TVersion.Create;
end;

destructor TItemEntity.THeldByPokemon.TVersionDetails.Destroy;
begin
  Fversion.Free;
  inherited;
end;

end.
