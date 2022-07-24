unit ItemAttribute.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TItemAttributeEntity = class
  type
    TLanguage = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TDescriptions = class
    private
      Fdescription: string;
      Flanguage: TLanguage;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property description: string read Fdescription write Fdescription;
      property language: TLanguage read Flanguage write Flanguage;
    end;

    TItems = class
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
  private
    Fdescriptions: TObjectList<TDescriptions>;
    Fid: integer;
    Fitems: TObjectList<TItems>;
    Fname: string;
    procedure SetFdescriptions(const Value: TObjectList<TDescriptions>);
    procedure SetFitems(const Value: TObjectList<TItems>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property descriptions: TObjectList<TDescriptions> read Fdescriptions
      write SetFdescriptions;
    property id: integer read Fid write Fid;
    property items: TObjectList<TItems> read Fitems write SetFitems;
    property name: string read Fname write Fname;

  end;

implementation

{ TItemAttributeEntity.TDescriptions }

constructor TItemAttributeEntity.TDescriptions.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TItemAttributeEntity.TDescriptions.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TItemAttributeEntity }

constructor TItemAttributeEntity.Create;
begin
  Fdescriptions := TObjectList<TDescriptions>.Create;
  Fitems := TObjectList<TItems>.Create;
end;

destructor TItemAttributeEntity.Destroy;
begin
  Fdescriptions.Free;
  Fitems.Free;
  inherited;
end;

procedure TItemAttributeEntity.SetFdescriptions(const Value
  : TObjectList<TDescriptions>);
begin
  FreeAndNil(Fdescriptions);
  Fdescriptions := Value;
end;

procedure TItemAttributeEntity.SetFitems(const Value: TObjectList<TItems>);
begin
  FreeAndNil(Fitems);
  Fitems := Value;
end;

{ TItemAttributeEntity.TNames }

constructor TItemAttributeEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TItemAttributeEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
