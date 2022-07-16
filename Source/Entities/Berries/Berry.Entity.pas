unit Berry.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TBerryEntity = class
  type
    TFirmness = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TFlavors = class
    type
      TFlavor = class
      private
        Fname: string;
        Furl: string;
        Fpotency: integer;
      public
        property name: string read Fname write Fname;
        property url: string read Furl write Furl;
        property potency: integer read Fpotency write Fpotency;
      end;
    private
      Fflavor: TFlavor;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property flavor: TFlavor read Fflavor write Fflavor;
    end;

    TItem = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;

    TNaturalGiftType = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;
  private
    Ffirmness: TFirmness;
    Fflavors: TObjectList<TFlavors>;
    Fgrowth_time: integer;
    Fid: integer;
    Fitem: TItem;
    Fmax_harvest: integer;
    Fname: string;
    Fnatural_gift_power: integer;
    Fnatural_gift_type: TNaturalGiftType;
    Fsize: integer;
    Fsmoothness: integer;
    Fsoil_dryness: integer;
    procedure SetFflavors(const Value: TObjectList<TFlavors>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property firmness: TFirmness read Ffirmness write Ffirmness;
    property flavors: TObjectList<TFlavors> read Fflavors write SetFflavors;
    property growth_time: integer read Fgrowth_time write Fgrowth_time;
    property id: integer read Fid write Fid;
    property item: TItem read Fitem write Fitem;
    property max_harvest: integer read Fmax_harvest write Fmax_harvest;
    property name: string read Fname write Fname;
    property natural_gift_power: integer read Fnatural_gift_power
      write Fnatural_gift_power;
    property natural_gift_type: TNaturalGiftType read Fnatural_gift_type
      write Fnatural_gift_type;
    property size: integer read Fsize write Fsize;
    property smoothness: integer read Fsmoothness write Fsmoothness;
    property soil_dryness: integer read Fsoil_dryness write Fsoil_dryness;
  end;

implementation

{ TBerryEntity }

constructor TBerryEntity.Create;
begin
  Ffirmness := TFirmness.Create;
  Fflavors := TObjectList<TFlavors>.Create;
  Fitem := TItem.Create;
  Fnatural_gift_type := TNaturalGiftType.Create;
end;

destructor TBerryEntity.Destroy;
begin
  Ffirmness.Free;
  Fflavors.Free;
  Fitem.Free;
  Fnatural_gift_type.Free;
  inherited;
end;

procedure TBerryEntity.SetFflavors(const Value: TObjectList<TFlavors>);
begin
  FreeAndNil(Fflavors);
  Fflavors := Value;
end;

{ TBerryEntity.TFlavors }

constructor TBerryEntity.TFlavors.Create;
begin
  Fflavor := TFlavor.Create;
end;

destructor TBerryEntity.TFlavors.Destroy;
begin
  Fflavor.Free;
  inherited;
end;

end.
