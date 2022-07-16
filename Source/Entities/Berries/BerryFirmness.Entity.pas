unit BerryFirmness.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TBerryFirmnessEntity = class
  type
    TBerries = class
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
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFberries(const Value: TObjectList<TBerries>);
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property berries: TObjectList<TBerries> read Fberries write SetFberries;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
  end;

implementation

{ TBerryFirmnessEntity }

constructor TBerryFirmnessEntity.Create;
begin
  Fberries := TObjectList<TBerries>.Create;
  Fnames := TObjectList<TNames>.Create;
end;

destructor TBerryFirmnessEntity.Destroy;
begin
  Fberries.Free;
  Fnames.Free;
  inherited;
end;

procedure TBerryFirmnessEntity.SetFberries(const Value: TObjectList<TBerries>);
begin
  FreeAndNil(Fberries);
  Fberries := Value;
end;

procedure TBerryFirmnessEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

{ TBerryFirmnessEntity.TNames }

constructor TBerryFirmnessEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TBerryFirmnessEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
