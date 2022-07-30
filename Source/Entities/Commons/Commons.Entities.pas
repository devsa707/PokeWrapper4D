unit Commons.Entities;

interface

type
  TLanguage = class
  private
    Fname: string;
    Furl: string;
  public
    property name: string read Fname write Fname;
    property url: string read Furl write Furl;
  end;

  TResource = class
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
    Fname: string;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property language: TLanguage read Flanguage write Flanguage;
    property name: string read Fname write Fname;
  end;

implementation

{ TNames }

constructor TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
