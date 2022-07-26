unit Location.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  MVCFramework.Nullables;

type
  TLocationEntity = class
  type
    TAreas = class
    private
      Fname: NullableString;
      Furl: NullableString;
    public
      property name: NullableString read Fname write Fname;
      property url: NullableString read Furl write Furl;
    end;

  type
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

    TNames = class
    type
      TLanguage = class
      private
        Fname: string;
        Furl: string;
      public
        property name: string read Fname write Fname;
        property url: string read Furl write Furl;
      end;
    private
      Flanguage: TLanguage;
      Fname: string;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property language: TLanguage read Flanguage write Flanguage;
      property name: string read Fname write Fname;
    end;

    TRegion = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;
  private
    Fareas: Tobjectlist<TAreas>;
    Fgame_indices: Tobjectlist<TGameIndices>;
    Fid: integer;
    Fname: string;
    Fnames: Tobjectlist<TNames>;
    Fregion: TRegion;
    procedure SetFareas(const Value: Tobjectlist<TAreas>);
    procedure SetFgame_indices(const Value: Tobjectlist<TGameIndices>);
    procedure SetFnames(const Value: Tobjectlist<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property areas: Tobjectlist<TAreas> read Fareas write SetFareas;
    property game_indices: Tobjectlist<TGameIndices> read Fgame_indices
      write SetFgame_indices;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: Tobjectlist<TNames> read Fnames write SetFnames;
    property region: TRegion read Fregion write Fregion;
  end;

implementation

{ TLocationEntity }

constructor TLocationEntity.Create;
begin
  Fareas := Tobjectlist<TAreas>.Create;
  Fgame_indices := Tobjectlist<TGameIndices>.Create;
  Fnames := Tobjectlist<TNames>.Create;
  Fregion := TRegion.Create;
end;

destructor TLocationEntity.Destroy;
begin
  Fareas.Free;
  Fgame_indices.Free;
  Fnames.Free;
  Fregion.Free;
  inherited;
end;

procedure TLocationEntity.SetFareas(const Value: Tobjectlist<TAreas>);
begin
  FreeAndNil(Fareas);
  Fareas := Value;
end;

procedure TLocationEntity.SetFgame_indices(const Value
  : Tobjectlist<TGameIndices>);
begin
  Fgame_indices := Value;
end;

procedure TLocationEntity.SetFnames(const Value: Tobjectlist<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

{ TLocationEntity.TGameIndices }

constructor TLocationEntity.TGameIndices.Create;
begin
  Fgeneration := TGeneration.Create;
end;

destructor TLocationEntity.TGameIndices.Destroy;
begin
  Fgeneration.Free;
  inherited;
end;

{ TLocationEntity.TNames }

constructor TLocationEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TLocationEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
