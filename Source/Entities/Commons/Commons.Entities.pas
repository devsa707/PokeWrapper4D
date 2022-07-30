unit Commons.Entities;

interface

type
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
    Flanguage: TResource;
    Fname: string;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property language: TResource read Flanguage write Flanguage;
    property name: string read Fname write Fname;
  end;

implementation

{ TNames }

constructor TNames.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
