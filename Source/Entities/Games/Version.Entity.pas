unit Version.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TVersionEntity = class
  type
  private
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fversion_group: TResource;
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property version_group: TResource read Fversion_group
      write Fversion_group;
  end;

implementation

{ TVersionEntity }

constructor TVersionEntity.Create;
begin
  Fnames := TObjectList<TNames>.Create;
  Fversion_group := TResource.Create;
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


end.
