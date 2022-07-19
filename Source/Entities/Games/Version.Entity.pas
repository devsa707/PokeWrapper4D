unit Version.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TVersionEntity = class
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

    TVersionGroup = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;
  private
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fversion_group: TVersionGroup;
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property version_group: TVersionGroup read Fversion_group
      write Fversion_group;
  end;

implementation

{ TVersionEntity }

constructor TVersionEntity.Create;
begin
  Fnames := TObjectList<TNames>.Create;
  Fversion_group := TVersionGroup.Create;
end;

destructor TVersionEntity.Destroy;
begin
  Fnames.Free;
  Fversion_group.Free;
  inherited;
end;

procedure TVersionEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

{ TVersionEntity.TNames }

constructor TVersionEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TVersionEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
