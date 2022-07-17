unit EncounterMethod.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TEncounterMethodEntity = class
  type
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
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Forder: integer;
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property order: integer read Forder write Forder;
  end;

implementation

{ TEncounterMethodEntity }

constructor TEncounterMethodEntity.Create;
begin
  Fnames := TObjectList<TNames>.Create;
end;

destructor TEncounterMethodEntity.Destroy;
begin
  Fnames.Free;
  inherited;
end;

procedure TEncounterMethodEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  Fnames := Value;
end;

{ TEncounterMethodEntity.TNames }

constructor TEncounterMethodEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TEncounterMethodEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
