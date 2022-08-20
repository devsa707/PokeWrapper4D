unit Pokemon.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities,
  PokeWrapper.types,
  Pokemon.Generation.Node.Entity,
  // MVC
  MVCFramework.Serializer.Commons;

type
  TPokemonEntity = class
  type
    TTypes = class
    private
      Fslot: integer;
      Ftype: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property slot: integer read Fslot write Fslot;
      [MVCNameAsAttribute('type')]
      property type_: TResource read Ftype write Ftype;
    end;

    TAbilities = class
    private
      Fability  : TResource;
      Fis_hidden: boolean;
      Fslot     : integer;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property ability: TResource read Fability write Fability;
      property is_hidden: boolean read Fis_hidden write Fis_hidden;
      property slot: integer read Fslot write Fslot;
    end;

    TGameIndices = class
    private
      Fgame_index: integer;
      Fversion   : TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property game_index: integer read Fgame_index write Fgame_index;
      property version: TResource read Fversion write Fversion;
    end;

    THeldItems = class
    type
      TVersionDetails = class
      private
        Fversion: TResource;
        Frarity : integer;
      public
        constructor Create; overload;
        destructor Destroy; override;
        property version: TResource read Fversion write Fversion;
        property rarity: integer read Frarity write Frarity;
      end;
    private
      Fitem           : TResource;
      Fversion_details: TObjectList<TVersionDetails>;
      procedure SetFversion_details(const Value: TObjectList<TVersionDetails>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property item: TResource read Fitem write Fitem;
      property version_details: TObjectList<TVersionDetails> read Fversion_details write SetFversion_details;
    end;

    TMoves = class
    type
      TVersionGroupDetails = class
      private
        Flevel_learned_at : integer;
        Fmove_learn_method: TResource;
        Fversion_group    : TResource;
      public
        constructor Create; overload;
        destructor Destroy; override;
        property level_learned_at: integer read Flevel_learned_at write Flevel_learned_at;
        property move_learn_method: TResource read Fmove_learn_method write Fmove_learn_method;
        property version_group: TResource read Fversion_group write Fversion_group;
      end;
    private
      Fmove                 : TResource;
      Fversion_group_details: TObjectList<TVersionGroupDetails>;
      procedure SetFversion_group_details(const Value: TObjectList<TVersionGroupDetails>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property move: TResource read Fmove write Fmove;
      property version_group_details: TObjectList<TVersionGroupDetails> read Fversion_group_details write SetFversion_group_details;
    end;

    TPastTypes = class
    private
      Fgeneration: TResource;
      Ftypes     : TObjectList<TTypes>;
      procedure SetFtypes(const Value: TObjectList<TTypes>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property Generation: TResource read Fgeneration write Fgeneration;
      property types: TObjectList<TTypes> read Ftypes write SetFtypes;
    end;

    TSprites = class
    type
      TOther = class
      type
        TDreamWorld = class
        private
          Ffront_default: string;
          Ffront_female : string;
        public
          property front_default: string read Ffront_default write Ffront_default;
          property front_female : string read Ffront_female write Ffront_female;
        end;

        THome = class
        private
          Ffront_default     : string;
          Ffront_female      : string;
          Ffront_shiny       : string;
          Ffront_shiny_female: string;
        public
          property front_default     : string read Ffront_default write Ffront_default;
          property front_female      : string read Ffront_female write Ffront_female;
          property front_shiny       : string read Ffront_shiny write Ffront_shiny;
          property front_shiny_female: string read Ffront_shiny_female write Ffront_shiny_female;
        end;

        TOfficialArtwork = class
        private
          Ffront_default: string;
        public
          property front_default: string read Ffront_default write Ffront_default;
        end;

      private
        Fdream_world     : TDreamWorld;
        Fhome            : THome;
        Fofficial_artwork: TOfficialArtwork;
      public
        constructor Create; overload;
        destructor Destroy; override;
        property dream_world: TDreamWorld read Fdream_world write Fdream_world;
        property home: THome read Fhome write Fhome;
        [MVCNameAsAttribute('official-artwork')]
        property official_artwork: TOfficialArtwork read Fofficial_artwork write Fofficial_artwork;
      end;

      TVersions = class
      private
        Fgeneration_i   : TGenerationI;
        Fgeneration_ii  : TGenerationII;
        Fgeneration_iii : TGenerationIII;
        Fgeneration_iv  : TGenerationIV;
        Fgeneration_v   : TGenerationV;
        Fgeneration_vi  : TGenerationVI;
        Fgeneration_vii : TGenerationVII;
        Fgeneration_viii: TGenerationVIII;
      public
        constructor Create; overload;
        destructor Destroy; override;
        [MVCNameAsAttribute('generation-i')]
        property generation_i: TGenerationI read Fgeneration_i write Fgeneration_i;
        [MVCNameAsAttribute('generation-ii')]
        property generation_ii: TGenerationII read Fgeneration_ii write Fgeneration_ii;
        [MVCNameAsAttribute('generation-iii')]
        property generation_iii: TGenerationIII read Fgeneration_iii write Fgeneration_iii;
        [MVCNameAsAttribute('generation-iv')]
        property generation_iv: TGenerationIV read Fgeneration_iv write Fgeneration_iv;
        [MVCNameAsAttribute('generation-v')]
        property generation_v: TGenerationV read Fgeneration_v write Fgeneration_v;
        [MVCNameAsAttribute('generation-vi')]
        property generation_vi: TGenerationVI read Fgeneration_vi write Fgeneration_vi;
        [MVCNameAsAttribute('generation-vii')]
        property generation_vii: TGenerationVII read Fgeneration_vii write Fgeneration_vii;
        [MVCNameAsAttribute('generation-viii')]
        property generation_viii: TGenerationVIII read Fgeneration_viii write Fgeneration_viii;
      end;
    private
      Fback_default      : string;
      Fback_female       : string;
      Fback_shiny        : string;
      Fback_shiny_female : string;
      Ffront_default     : string;
      Ffront_female      : string;
      Ffront_shiny       : string;
      Ffront_shiny_female: string;
      Fother             : TOther;
      Fversions          : TVersions;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property back_default: string read Fback_default write Fback_default;
      property back_female: string read Fback_female write Fback_female;
      property back_shiny: string read Fback_shiny write Fback_shiny;
      property back_shiny_female: string read Fback_shiny_female write Fback_shiny_female;
      property front_default: string read Ffront_default write Ffront_default;
      property front_female: string read Ffront_female write Ffront_female;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
      property front_shiny_female: string read Ffront_shiny_female write Ffront_shiny_female;
      property other: TOther read Fother write Fother;
      property versions: TVersions read Fversions write Fversions;
    end;

    TStats = class
    private
      Fbase_stat: integer;
      Feffort   : integer;
      Fstat     : TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property base_stat: integer read Fbase_stat write Fbase_stat;
      property effort: integer read Feffort write Feffort;
      property stat: TResource read Fstat write Fstat;
    end;
  private
    Fabilites                : TObjectList<TAbilities>;
    Fbase_experience         : integer;
    Fforms                   : TObjectList<TResource>;
    Fgame_indices            : TObjectList<TGameIndices>;
    Fheight                  : integer;
    Fheld_items              : TObjectList<THeldItems>;
    Fid                      : integer;
    Fis_default              : boolean;
    Flocation_area_encounters: string;
    Fmoves                   : TObjectList<TMoves>;
    Fname                    : string;
    Forder                   : integer;
    Fpast_types              : TObjectList<TPastTypes>;
    Fspecies                 : TResource;
    Fsprites                 : TSprites;
    Fstats                   : TObjectList<TStats>;
    Ftypes                   : TObjectList<TTypes>;
    Fweight                  : integer;
    procedure SetFabilites(const Value: TObjectList<TAbilities>);
    procedure SetFgame_indices(const Value: TObjectList<TGameIndices>);
    procedure SetFheld_items(const Value: TObjectList<THeldItems>);
    procedure SetFmoves(const Value: TObjectList<TMoves>);
    procedure SetFpast_types(const Value: TObjectList<TPastTypes>);
    procedure SetFstats(const Value: TObjectList<TStats>);
    procedure SetFtypes(const Value: TObjectList<TTypes>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property abilities: TObjectList<TAbilities> read Fabilites write SetFabilites;
    property base_experience: integer read Fbase_experience write Fbase_experience;
    property forms: TObjectList<TResource> read Fforms write Fforms;
    property game_indices: TObjectList<TGameIndices> read Fgame_indices write SetFgame_indices;
    property height: integer read Fheight write Fheight;
    property held_items: TObjectList<THeldItems> read Fheld_items write SetFheld_items;
    property id: integer read Fid write Fid;
    property is_default: boolean read Fis_default write Fis_default;
    property location_area_encounters: string read Flocation_area_encounters write Flocation_area_encounters;
    property moves: TObjectList<TMoves> read Fmoves write SetFmoves;
    property name: string read Fname write Fname;
    property order: integer read Forder write Forder;
    property past_types: TObjectList<TPastTypes> read Fpast_types write SetFpast_types;
    property species: TResource read Fspecies write Fspecies;
    property sprites: TSprites read Fsprites write Fsprites;
    property stats: TObjectList<TStats> read Fstats write SetFstats;
    property types: TObjectList<TTypes> read Ftypes write SetFtypes;
    property weight: integer read Fweight write Fweight;
  end;

implementation

{ TPokemonEntity.TAbilities }

constructor TPokemonEntity.TAbilities.Create;
begin
  Fability := TResource.Create;
end;

destructor TPokemonEntity.TAbilities.Destroy;
begin
  Fability.Free;
  inherited;
end;

{ TPokemonEntity }

constructor TPokemonEntity.Create;
begin
  Fabilites     := TObjectList<TAbilities>.Create;
  Fforms        := TObjectList<TResource>.Create;
  Fgame_indices := TObjectList<TGameIndices>.Create;
  Fheld_items   := TObjectList<THeldItems>.Create;
  Fmoves        := TObjectList<TMoves>.Create;
  Fpast_types   := TObjectList<TPastTypes>.Create;
  Fspecies      := TResource.Create;
  Fsprites      := TSprites.Create;
  Fstats        := TObjectList<TStats>.Create;
  Ftypes        := TObjectList<TTypes>.Create;

end;

destructor TPokemonEntity.Destroy;
begin
  Fabilites.Free;
  Fforms.Free;
  Fgame_indices.Free;
  Fheld_items.Free;
  Fmoves.Free;
  Fpast_types.Free;
  Fspecies.Free;
  Fsprites.Free;
  Fstats.Free;
  Ftypes.Free;
  inherited;
end;

procedure TPokemonEntity.SetFabilites(const Value: TObjectList<TAbilities>);
begin
  FreeAndNil(Fabilites);
  Fabilites := Value;
end;

procedure TPokemonEntity.SetFgame_indices(const Value: TObjectList<TGameIndices>);
begin
  FreeAndNil(Fgame_indices);
  Fgame_indices := Value;
end;

procedure TPokemonEntity.SetFheld_items(const Value: TObjectList<THeldItems>);
begin
  FreeAndNil(Fheld_items);
  Fheld_items := Value;
end;

procedure TPokemonEntity.SetFmoves(const Value: TObjectList<TMoves>);
begin
  FreeAndNil(Fmoves);
  Fmoves := Value;
end;

procedure TPokemonEntity.SetFpast_types(const Value: TObjectList<TPastTypes>);
begin
  FreeAndNil(Fpast_types);
  Fpast_types := Value;
end;

procedure TPokemonEntity.SetFstats(const Value: TObjectList<TStats>);
begin
  FreeAndNil(Fstats);
  Fstats := Value;
end;

procedure TPokemonEntity.SetFtypes(const Value: TObjectList<TTypes>);
begin
  FreeAndNil(Ftypes);
  Ftypes := Value;
end;

{ TPokemonEntity.TGameIndices }

constructor TPokemonEntity.TGameIndices.Create;
begin
  Fversion := TResource.Create;
end;

destructor TPokemonEntity.TGameIndices.Destroy;
begin
  Fversion.Free;
  inherited;
end;

{ TPokemonEntity.THeldItems.TVersionDetails }

constructor TPokemonEntity.THeldItems.TVersionDetails.Create;
begin
  Fversion := TResource.Create;
end;

destructor TPokemonEntity.THeldItems.TVersionDetails.Destroy;
begin
  Fversion.Free;
  inherited;
end;

{ TPokemonEntity.THeldItems }

constructor TPokemonEntity.THeldItems.Create;
begin
  Fitem            := TResource.Create;
  Fversion_details := TObjectList<TVersionDetails>.Create;
end;

destructor TPokemonEntity.THeldItems.Destroy;
begin
  Fitem.Free;
  Fversion_details.Free;
  inherited;
end;

procedure TPokemonEntity.THeldItems.SetFversion_details(const Value: TObjectList<TVersionDetails>);
begin
  FreeAndNil(Fversion_details);
  Fversion_details := Value;
end;

{ TPokemonEntity.TMoves }

constructor TPokemonEntity.TMoves.Create;
begin
  Fmove                  := TResource.Create;
  Fversion_group_details := TObjectList<TVersionGroupDetails>.Create;
end;

destructor TPokemonEntity.TMoves.Destroy;
begin
  Fmove.Free;
  Fversion_group_details.Free;
  inherited;
end;

procedure TPokemonEntity.TMoves.SetFversion_group_details(const Value: TObjectList<TVersionGroupDetails>);
begin
  FreeAndNil(Fversion_group_details);
  Fversion_group_details := Value;
end;

{ TPokemonEntity.TMoves.TVersionGroupDetails }

constructor TPokemonEntity.TMoves.TVersionGroupDetails.Create;
begin
  Fmove_learn_method := TResource.Create;
  Fversion_group     := TResource.Create;
end;

destructor TPokemonEntity.TMoves.TVersionGroupDetails.Destroy;
begin
  Fmove_learn_method.Free;
  Fversion_group.Free;
  inherited;
end;

{ TPokemonEntity.TPastTypes }

constructor TPokemonEntity.TPastTypes.Create;
begin
  Fgeneration := TResource.Create;
  Ftypes      := TObjectList<TTypes>.Create;
end;

destructor TPokemonEntity.TPastTypes.Destroy;
begin
  Fgeneration.Free;
  Ftypes.Free;
  inherited;
end;

procedure TPokemonEntity.TPastTypes.SetFtypes(const Value: TObjectList<TTypes>);
begin
  FreeAndNil(Ftypes);
  Ftypes := Value;
end;

{ TPokemonEntity.TPastTypes.TTypes }

constructor TPokemonEntity.TTypes.Create;
begin
  Ftype := TResource.Create;
end;

destructor TPokemonEntity.TTypes.Destroy;
begin
  Ftype.Free;
  inherited;
end;

{ TPokemonEntity.TSprites.TOther }

constructor TPokemonEntity.TSprites.TOther.Create;
begin
  Fdream_world      := TDreamWorld.Create;
  Fhome             := THome.Create;
  Fofficial_artwork := TOfficialArtwork.Create;
end;

destructor TPokemonEntity.TSprites.TOther.Destroy;
begin
  Fdream_world.Free;
  Fhome.Free;
  Fofficial_artwork.Free;
  inherited;
end;

{ TPokemonEntity.TSprites }

constructor TPokemonEntity.TSprites.Create;
begin
  Fother    := TOther.Create;
  Fversions := TVersions.Create;
end;

destructor TPokemonEntity.TSprites.Destroy;
begin
  Fother.Free;
  Fversions.Free;
  inherited;
end;

{ TPokemonEntity.TSprites.TOther.TVersions }

constructor TPokemonEntity.TSprites.TVersions.Create;
begin
  Fgeneration_i    := TGenerationI.Create;
  Fgeneration_ii   := TGenerationII.Create;
  Fgeneration_iii  := TGenerationIII.Create;
  Fgeneration_iv   := TGenerationIV.Create;
  Fgeneration_v    := TGenerationV.Create;
  Fgeneration_vi   := TGenerationVI.Create;
  Fgeneration_vii  := TGenerationVII.Create;
  Fgeneration_viii := TGenerationVIII.Create;
end;

destructor TPokemonEntity.TSprites.TVersions.Destroy;
begin
  Fgeneration_i.Free;
  Fgeneration_ii.Free;
  Fgeneration_iii.Free;
  Fgeneration_iv.Free;
  Fgeneration_v.Free;
  Fgeneration_vi.Free;
  Fgeneration_vii.Free;
  Fgeneration_viii.Free;
  inherited;
end;

{ TPokemonEntity.TStats }

constructor TPokemonEntity.TStats.Create;
begin
  Fstat := TResource.Create;
end;

destructor TPokemonEntity.TStats.Destroy;
begin
  Fstat.Free;
  inherited;
end;

end.
