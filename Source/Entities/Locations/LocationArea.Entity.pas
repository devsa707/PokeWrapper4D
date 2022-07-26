unit LocationArea.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  // MVC Framework
  MVCFramework.Nullables;

type
  TLocationAreaEntity = class
  type
    TLanguage = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TVersion = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TEncounterMethodRates = class
    type
      TEncounterMethod = class
      private
        Fname: string;
        Furl: string;
      public
        property name: string read Fname write Fname;
        property url: string read Furl write Furl;
      end;

      TVersionDetails = class
      private
        Frate: integer;
        Fversion: TObjectList<TVersion>;
        procedure SetFversion(const Value: TObjectList<TVersion>);
      public
        constructor Create; overload;
        destructor Destroy; override;
        property rate: integer read Frate write Frate;
        property version: TObjectList<TVersion> read Fversion write SetFversion;
      end;
    private
      Fencounter_method: TEncounterMethod;
      Fversion_details: TObjectList<TVersionDetails>;
      procedure SetFversion_details(const Value: TObjectList<TVersionDetails>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property encounter_method: TEncounterMethod read Fencounter_method
        write Fencounter_method;
      property version_details: TObjectList<TVersionDetails>
        read Fversion_details write SetFversion_details;
    end;

    TLocation = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TNames = class
    private
      Flanguage: TLanguage;
      Fname: NullableString;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property language: TLanguage read Flanguage write Flanguage;
      property name: NullableString read Fname write Fname;
    end;

    TPokemonEncounters = class
    type
      TPokemon = class
      private
        Fname: string;
        Furl: string;
      public
        property name: string read Fname write Fname;
        property url: string read Furl write Furl;
      end;

      TVersionDetails = class
      type
        TEncounterDetails = class
        type
          TConditionValues = class
          private
            Fname: NullableString;
            Furl: NullableString;
          public
            property name: NullableString read Fname write Fname;
            property url: NullableString read Furl write Furl;
          end;

          TMethod = class
          private
            Fname: NullableString;
            Furl: NullableString;
          public
            property name: NullableString read Fname write Fname;
            property url: NullableString read Furl write Furl;
          end;
        private
          Fchance: integer;
          Fcondition_values: TObjectList<TConditionValues>;
          Fmax_level: integer;
          Fmethod: TMethod;
          Fmin_level: integer;
          procedure SetFcondition_values(const Value
            : TObjectList<TConditionValues>);
        public
          constructor Create; overload;
          destructor Destroy; override;
          property chance: integer read Fchance write Fchance;
          property condition_values: TObjectList<TConditionValues>
            read Fcondition_values write SetFcondition_values;
          property max_level: integer read Fmax_level write Fmax_level;
          property method: TMethod read Fmethod write Fmethod;
          property min_level: integer read Fmin_level write Fmin_level;
        end;
      private
        Fencounter_details: TObjectList<TEncounterDetails>;
        Fmax_chance: integer;
        Fversion: TVersion;
        procedure SetFencounter_details(const Value
          : TObjectList<TEncounterDetails>);
      public
        constructor Create; overload;
        destructor Destroy; override;
        property encounter_details: TObjectList<TEncounterDetails>
          read Fencounter_details write SetFencounter_details;
        property max_chance: integer read Fmax_chance write Fmax_chance;
        property version: TVersion read Fversion write Fversion;
      end;
    private
      Fpokemon: TPokemon;
      Fversion_details: TObjectList<TVersionDetails>;
      procedure SetFversion_details(const Value: TObjectList<TVersionDetails>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property pokemon: TPokemon read Fpokemon write Fpokemon;
      property version_details: TObjectList<TVersionDetails>
        read Fversion_details write SetFversion_details;
    end;
  private
    Fencounter_method_rates: TObjectList<TEncounterMethodRates>;
    Fgame_index: integer;
    Fid: integer;
    Flocation: TLocation;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFencounter_method_rates(const Value
      : TObjectList<TEncounterMethodRates>);
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property encounter_method_rates: TObjectList<TEncounterMethodRates>
      read Fencounter_method_rates write SetFencounter_method_rates;
    property game_index: integer read Fgame_index write Fgame_index;
    property id: integer read Fid write Fid;
    property location: TLocation read Flocation write Flocation;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;

  end;

implementation

{ TLocationAreaEntity.TEncounterMethodRates }

constructor TLocationAreaEntity.TEncounterMethodRates.Create;
begin
  Fencounter_method := TEncounterMethod.Create;
  Fversion_details := TObjectList<TVersionDetails>.Create;
end;

destructor TLocationAreaEntity.TEncounterMethodRates.Destroy;
begin
  Fencounter_method.Free;
  Fversion_details.Free;
  inherited;
end;

procedure TLocationAreaEntity.TEncounterMethodRates.SetFversion_details
  (const Value: TObjectList<TVersionDetails>);
begin
  FreeAndNil(Fversion_details);
  Fversion_details := Value;
end;

{ TLocationAreaEntity.TEncounterMethodRates.TVersionDetails }

constructor TLocationAreaEntity.TEncounterMethodRates.TVersionDetails.Create;
begin
  Fversion := TObjectList<TVersion>.Create;
end;

destructor TLocationAreaEntity.TEncounterMethodRates.TVersionDetails.Destroy;
begin
  Fversion.Free;
  inherited;
end;

procedure TLocationAreaEntity.TEncounterMethodRates.TVersionDetails.SetFversion
  (const Value: TObjectList<TVersion>);
begin
  FreeAndNil(Fversion);
  Fversion := Value;
end;

{ TLocationAreaEntity }

constructor TLocationAreaEntity.Create;
begin
  Fencounter_method_rates := TObjectList<TEncounterMethodRates>.Create;
  Flocation := TLocation.Create;
  Fnames := TObjectList<TNames>.Create;
end;

destructor TLocationAreaEntity.Destroy;
begin
  Fencounter_method_rates.Free;
  Flocation.Free;
  Fnames.Free;
  inherited;
end;

procedure TLocationAreaEntity.SetFencounter_method_rates
  (const Value: TObjectList<TEncounterMethodRates>);
begin
  FreeAndNil(Fencounter_method_rates);
  Fencounter_method_rates := Value;
end;

procedure TLocationAreaEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

{ TLocationAreaEntity.TNames }

constructor TLocationAreaEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TLocationAreaEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TLocationAreaEntity.TPokemonEncounters }

constructor TLocationAreaEntity.TPokemonEncounters.Create;
begin
  Fpokemon := TPokemon.Create;
  Fversion_details := TObjectList<TVersionDetails>.Create;
end;

destructor TLocationAreaEntity.TPokemonEncounters.Destroy;
begin
  Fpokemon.Free;
  Fversion_details.Free;
  inherited;
end;

procedure TLocationAreaEntity.TPokemonEncounters.SetFversion_details
  (const Value: TObjectList<TVersionDetails>);
begin
  FreeAndNil(Fversion_details);
  Fversion_details := Value;
end;

{ TLocationAreaEntity.TPokemonEncounters.TVersionDetails }

constructor TLocationAreaEntity.TPokemonEncounters.TVersionDetails.Create;
begin
  Fencounter_details := TObjectList<TEncounterDetails>.Create;
  Fversion := TVersion.Create;
end;

destructor TLocationAreaEntity.TPokemonEncounters.TVersionDetails.Destroy;
begin
  Fencounter_details.Free;
  Fversion.Free;
  inherited;
end;

procedure TLocationAreaEntity.TPokemonEncounters.TVersionDetails.
  SetFencounter_details(const Value: TObjectList<TEncounterDetails>);
begin
  FreeAndNil(Fencounter_details);
  Fencounter_details := Value;
end;

{ TLocationAreaEntity.TPokemonEncounters.TVersionDetails.TEncounterDetails }

constructor TLocationAreaEntity.TPokemonEncounters.TVersionDetails.
  TEncounterDetails.Create;
begin
  Fcondition_values := TObjectList<TConditionValues>.Create;
  Fmethod := TMethod.Create;
end;

destructor TLocationAreaEntity.TPokemonEncounters.TVersionDetails.
  TEncounterDetails.Destroy;
begin
  Fcondition_values.Free;
  Fmethod.Free;
  inherited;
end;

procedure TLocationAreaEntity.TPokemonEncounters.TVersionDetails.
  TEncounterDetails.SetFcondition_values(const Value
  : TObjectList<TConditionValues>);
begin
  FreeAndNil(Fcondition_values);
  Fcondition_values := Value;
end;

end.
