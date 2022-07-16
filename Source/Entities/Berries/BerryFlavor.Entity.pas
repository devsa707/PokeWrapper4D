unit BerryFlavor.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TBerryFlavorEntity = class
  type
    TBerries = class
    type
      TBerry = class
      private
        Fname: string;
        Furl: string;
      public
        property name: string read Fname write Fname;
        property url: string read Furl write Furl;
      end;
    private
      Fberry: TBerry;
      Fpotency: integer;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property berry: TBerry read Fberry write Fberry;
      property potency: integer read Fpotency write Fpotency;
    end;

    TContestType = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
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
  private
    Fberries: TObjectList<TBerries>;
    Fcontest_type: TContestType;
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFberries(const Value: TObjectList<TBerries>);
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property berries: TObjectList<TBerries> read Fberries write SetFberries;
    property contest_type: TContestType read Fcontest_type write Fcontest_type;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
  end;

implementation

{ TBerryFlavorEntity.TBerries }

constructor TBerryFlavorEntity.TBerries.Create;
begin
  Fberry := TBerry.Create;
end;

destructor TBerryFlavorEntity.TBerries.Destroy;
begin
  Fberry.Free;
  inherited;
end;

{ TBerryFlavorEntity }

constructor TBerryFlavorEntity.Create;
begin
  Fberries := TObjectList<TBerries>.Create;
  Fcontest_type := TContestType.Create;
  Fnames := TObjectList<TNames>.Create;
end;

destructor TBerryFlavorEntity.Destroy;
begin
  Fberries.Free;
  Fcontest_type.Free;
  Fnames.Free;
  inherited;
end;

procedure TBerryFlavorEntity.SetFberries(const Value: TObjectList<TBerries>);
begin
  FreeAndNil(Fberries);
  Fberries := Value;
end;

procedure TBerryFlavorEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

{ TBerryFlavorEntity.TNames }

constructor TBerryFlavorEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TBerryFlavorEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
