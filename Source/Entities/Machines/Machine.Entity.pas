unit Machine.Entity;

interface

type
  TMachineEntity = class
  type
    TItem = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TMove = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
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
    Fitem: TItem;
    Fmove: TMove;
    Fversion_group: TVersionGroup;
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property item: TItem read Fitem write Fitem;
    property move: TMove read Fmove write Fmove;
    property version_group: TVersionGroup read Fversion_group
      write Fversion_group;
  end;

implementation

{ TMachineEntity }

constructor TMachineEntity.Create;
begin
  Fitem := TItem.Create;
  Fmove := TMove.Create;
  Fversion_group := TVersionGroup.Create;
end;

destructor TMachineEntity.Destroy;
begin
  Fitem.Free;
  Fmove.Free;
  Fversion_group.Free;
  inherited;
end;

end.
