unit BerryFlavor.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TBerryFlavorEntity = class
  type
    TBerries = class
    type
    private
      Fberry: TResource;
      Fpotency: integer;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property berry: TResource read Fberry write Fberry;
      property potency: integer read Fpotency write Fpotency;
    end;
  private
    Fberries: TObjectList<TBerries>;
    Fcontest_type: TResource;
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFberries(const Value: TObjectList<TBerries>);
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property berries: TObjectList<TBerries> read Fberries write SetFberries;
    property contest_type: TResource read Fcontest_type write Fcontest_type;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
  end;

implementation

{ TBerryFlavorEntity.TBerries }

constructor TBerryFlavorEntity.TBerries.Create;
begin
  Fberry := TResource.Create;
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
  Fcontest_type := TResource.Create;
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

end.
