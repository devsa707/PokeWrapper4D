unit Machine.Entity;

interface

uses
  Commons.Entities;

type
  TMachineEntity = class
  private
    Fid: integer;
    Fitem: TResource;
    Fmove: TResource;
    Fversion_group: TResource;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property item: TResource read Fitem write Fitem;
    property move: TResource read Fmove write Fmove;
    property version_group: TResource read Fversion_group write Fversion_group;
  end;

implementation

{ TMachineEntity }

constructor TMachineEntity.Create;
begin
  Fitem := TResource.Create;
  Fmove := TResource.Create;
  Fversion_group := TResource.Create;
end;

destructor TMachineEntity.Destroy;
begin
  Fitem.Free;
  Fmove.Free;
  Fversion_group.Free;
  inherited;
end;

end.
