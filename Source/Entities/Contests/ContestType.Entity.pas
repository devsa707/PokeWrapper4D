unit ContestType.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type

  TContestTypeEntity = class
  type
    TNames = class
    type
    private
      Fcolor: string;
      Flanguage: TResource;
      Fname: string;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property color: string read Fcolor write Fcolor;
      property language: TResource read Flanguage write Flanguage;
      property name: string read Fname write Fname;
    end;
  private
    Fberry_flavor: TResource;
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property berry_flavor: TResource read Fberry_flavor write Fberry_flavor;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
  end;

implementation

{ TContestTypeEntity }

constructor TContestTypeEntity.Create;
begin
  Fberry_flavor := TResource.Create;
  Fnames := TObjectList<TNames>.Create;
end;

destructor TContestTypeEntity.Destroy;
begin
  Fberry_flavor.Free;
  Fnames.Free;
  inherited;
end;

procedure TContestTypeEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

{ TContestTypeEntity.TNames }

constructor TContestTypeEntity.TNames.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TContestTypeEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
