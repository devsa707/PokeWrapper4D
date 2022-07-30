unit BerryFirmness.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TBerryFirmnessEntity = class
  private
    Fberries: TObjectList<TResource>;
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFberries(const Value: TObjectList<TResource>);
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property berries: TObjectList<TResource> read Fberries write SetFberries;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
  end;

implementation

{ TBerryFirmnessEntity }

constructor TBerryFirmnessEntity.Create;
begin
  Fberries := TObjectList<TResource>.Create;
  Fnames := TObjectList<TNames>.Create;
end;

destructor TBerryFirmnessEntity.Destroy;
begin
  Fberries.Free;
  Fnames.Free;
  inherited;
end;

procedure TBerryFirmnessEntity.SetFberries(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fberries);
  Fberries := Value;
end;

procedure TBerryFirmnessEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

end.
