unit ItemAttribute.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  // MVC Framework
  MVCFramework.Nullables,
  //
  Commons.Entities;

type
  TItemAttributeEntity = class
  type
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
      Fname: nullablestring;
      Furl: nullablestring;
    public
      property name: nullablestring read Fname write Fname;
      property url: nullablestring read Furl write Furl;
    end;
  private
    Fdescriptions: TObjectList<TDescriptions>;
    Fid: integer;
    Fitems: TObjectList<TItems>;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFdescriptions(const Value: TObjectList<TDescriptions>);
    procedure SetFitems(const Value: TObjectList<TItems>);
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property descriptions: TObjectList<TDescriptions> read Fdescriptions
      write SetFdescriptions;
    property id: integer read Fid write Fid;
    property items: TObjectList<TItems> read Fitems write SetFitems;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
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
  Fnames := TObjectList<TNames>.Create;
end;

destructor TItemAttributeEntity.Destroy;
begin
  Fdescriptions.Free;
  Fitems.Free;
  Fnames.Free;
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

procedure TItemAttributeEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

end.
