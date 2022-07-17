unit EvolutionChain.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  // MVC Framework
  MVCFramework.Nullables;

type
  TEvolutionChainEntity = class
  type
    TBabyTriggerItem = class
    private
      Fname: NullableString;
      Furl: NullableString;
    public
      property name: NullableString read Fname write Fname;
      property url: NullableString read Furl write Furl;
    end;

    TEvolutionDetails = class
    type
      TItem = class
      private
        Fname: NullableString;
        Furl: NullableString;
      public
        property name: NullableString read Fname write Fname;
        property url: NullableString read Furl write Furl;
      end;

      TTrigger = class
      private
        Fname: NullableString;
        Furl: NullableString;
      public
        property name: NullableString read Fname write Fname;
        property url: NullableString read Furl write Furl;
      end;

      THeldItem = class
      private
        Fname: NullableString;
        Furl: NullableString;
      public
        property name: NullableString read Fname write Fname;
        property url: NullableString read Furl write Furl;
      end;

      TKnownMove = class
      private
        Fname: NullableString;
        Furl: NullableString;
      public
        property name: NullableString read Fname write Fname;
        property url: NullableString read Furl write Furl;
      end;

      TKnownMoveType = class
      private
        Fname: NullableString;
        Furl: NullableString;
      public
        property name: NullableString read Fname write Fname;
        property url: NullableString read Furl write Furl;
      end;

      TLocation = class
      private
        Fname: NullableString;
        Furl: NullableString;
      public
        property name: NullableString read Fname write Fname;
        property url: NullableString read Furl write Furl;
      end;

      TPartySpecies = class
      private
        Fname: NullableString;
        Furl: NullableString;
      public
        property name: NullableString read Fname write Fname;
        property url: NullableString read Furl write Furl;
      end;

      TPartyType = class
      private
        Fname: NullableString;
        Furl: NullableString;
      public
        property name: NullableString read Fname write Fname;
        property url: NullableString read Furl write Furl;
      end;

      TTradeSpecies = class
      private
        Fname: NullableString;
        Furl: NullableString;
      public
        property name: NullableString read Fname write Fname;
        property url: NullableString read Furl write Furl;
      end;

    private
      Fitem: TItem;
      Ftrigger: TTrigger;
      Fgender: NullableInt32;
      Fheld_item: THeldItem;
      Fknown_move: TKnownMove;
      Fknown_move_type: TKnownMoveType;
      Flocation: TLocation;
      Fmin_level: NullableInt32;
      Fmin_happiness: NullableInt32;
      Fmin_beauty: NullableInt32;
      Fmin_affection: NullableInt32;
      Fneeds_overworld_rain: NullableBoolean;
      Fparty_species: TPartySpecies;
      Fparty_type: TPartyType;
      Frelative_physical_stats: NullableInt32;
      Ftime_of_day: NullableString;
      Ftrade_species: TTradeSpecies;
      Fturn_upside_down: NullableBoolean;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property item: TItem read Fitem write Fitem;
      property trigger: TTrigger read Ftrigger write Ftrigger;
      property gender: NullableInt32 read Fgender write Fgender;
      property held_item: THeldItem read Fheld_item write Fheld_item;
      property known_move: TKnownMove read Fknown_move write Fknown_move;
      property known_move_type: TKnownMoveType read Fknown_move_type
        write Fknown_move_type;
      property location: TLocation read Flocation write Flocation;
      property min_level: NullableInt32 read Fmin_level write Fmin_level;
      property min_happiness: NullableInt32 read Fmin_happiness
        write Fmin_happiness;
      property min_beauty: NullableInt32 read Fmin_beauty write Fmin_beauty;
      property min_affection: NullableInt32 read Fmin_affection
        write Fmin_affection;
      property needs_overworld_rain: NullableBoolean read Fneeds_overworld_rain
        write Fneeds_overworld_rain;
      property party_species: TPartySpecies read Fparty_species
        write Fparty_species;
      property party_type: TPartyType read Fparty_type write Fparty_type;
      property relative_physical_stats: NullableInt32
        read Frelative_physical_stats write Frelative_physical_stats;
      property time_of_day: NullableString read Ftime_of_day write Ftime_of_day;
      property trade_species: TTradeSpecies read Ftrade_species
        write Ftrade_species;
      property turn_upside_down: NullableBoolean read Fturn_upside_down
        write Fturn_upside_down;
    end;

    TChain = class
    type
      TSpecies = class
      private
        Fname: NullableString;
        Furl: NullableString;
      public
        property name: NullableString read Fname write Fname;
        property url: NullableString read Furl write Furl;
      end;

      TEvolvesTo = class
      private
        Fevolution_details: TObjectList<TEvolutionDetails>;
        Fis_baby: boolean;
        Fspecies: TSpecies;
        procedure SetFevolution_details(const Value
          : TObjectList<TEvolutionDetails>);
      public
        constructor Create; overload;
        destructor Destroy; override;
        property evolution_details: TObjectList<TEvolutionDetails>
          read Fevolution_details write SetFevolution_details;
        property is_baby: boolean read Fis_baby write Fis_baby;
        property species: TSpecies read Fspecies write Fspecies;
      end;
    private
      Fevolution_details: TObjectList<TEvolutionDetails>;
      Fevolves_to: TObjectList<TEvolvesTo>;
      Fis_baby: NullableBoolean;
      Fspecies: TSpecies;
      Fid: integer;
      procedure SetFevolution_details(const Value
        : TObjectList<TEvolutionDetails>);
      procedure SetFevolves_to(const Value: TObjectList<TEvolvesTo>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property evolution_details: TObjectList<TEvolutionDetails>
        read Fevolution_details write SetFevolution_details;
      property evolves_to: TObjectList<TEvolvesTo> read Fevolves_to
        write SetFevolves_to;
      property is_baby: NullableBoolean read Fis_baby write Fis_baby;
      property species: TSpecies read Fspecies write Fspecies;
      property id: integer read Fid write Fid;
    end;
  private
    Fbaby_trigger_item: TBabyTriggerItem;
    Fchain: TChain;
    Fid: integer;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property baby_trigger_item: TBabyTriggerItem read Fbaby_trigger_item
      write Fbaby_trigger_item;
    property chain: TChain read Fchain write Fchain;
    property id: integer read Fid write Fid;
  end;

implementation

{ TEvolutionChainEntity }

constructor TEvolutionChainEntity.Create;
begin
  Fbaby_trigger_item := TBabyTriggerItem.Create;
  Fchain := TChain.Create;
end;

destructor TEvolutionChainEntity.Destroy;
begin
  Fbaby_trigger_item.Free;
  Fchain.Free;
  inherited;
end;

{ TEvolutionChainEntity.TChain }

constructor TEvolutionChainEntity.TChain.Create;
begin
  Fevolution_details := TObjectList<TEvolutionDetails>.Create;
  Fevolves_to := TObjectList<TEvolvesTo>.Create;
  Fspecies := TSpecies.Create;
end;

destructor TEvolutionChainEntity.TChain.Destroy;
begin
  Fevolution_details.Free;
  Fevolves_to.Free;
  Fspecies.Free;
  inherited;
end;

procedure TEvolutionChainEntity.TChain.SetFevolution_details
  (const Value: TObjectList<TEvolutionDetails>);
begin
  FreeAndNil(Fevolution_details);
  Fevolution_details := Value;
end;

procedure TEvolutionChainEntity.TChain.SetFevolves_to
  (const Value: TObjectList<TEvolvesTo>);
begin
  FreeAndNil(Fevolves_to);
  Fevolves_to := Value;
end;

{ TEvolutionChainEntity.TEvolutionDetails }

constructor TEvolutionChainEntity.TEvolutionDetails.Create;
begin
  Fitem := TItem.Create;
  Ftrigger := TTrigger.Create;
  Fheld_item := THeldItem.Create;
  Fknown_move := TKnownMove.Create;
  Fknown_move_type := TKnownMoveType.Create;
  Flocation := TLocation.Create;
  Fparty_species := TPartySpecies.Create;
  Fparty_type := TPartyType.Create;
  Ftrade_species := TTradeSpecies.Create;
end;

destructor TEvolutionChainEntity.TEvolutionDetails.Destroy;
begin
  Fitem.Free;
  Ftrigger.Free;
  Fheld_item.Free;
  Fknown_move.Free;
  Fknown_move_type.Free;
  Flocation.Free;
  Fparty_species.Free;
  Fparty_type.Free;
  Ftrade_species.Free;
  inherited;
end;

{ TEvolutionChainEntity.TChain.TEvolvesTo }

constructor TEvolutionChainEntity.TChain.TEvolvesTo.Create;
begin
  Fevolution_details := TObjectList<TEvolutionDetails>.Create;
  Fspecies := TSpecies.Create;
end;

destructor TEvolutionChainEntity.TChain.TEvolvesTo.Destroy;
begin
  Fevolution_details.Free;
  Fspecies.Free;
  inherited;
end;

procedure TEvolutionChainEntity.TChain.TEvolvesTo.SetFevolution_details
  (const Value: TObjectList<TEvolutionDetails>);
begin
  FreeAndNil(Fevolution_details);
  Fevolution_details := Value;
end;

end.
