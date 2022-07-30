unit ItemFlingEffect.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TItemFlingEffectEntity = class
  type
    TEffectEntries = class
    type
    private
      Feffect: string;
      Flanguage: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property effect: string read Feffect write Feffect;
      property language: TResource read Flanguage write Flanguage;
    end;

    TItems = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;
  private
    Feffect_entries: TObjectList<TEffectEntries>;
    Fid: integer;
    Fitems: TObjectList<TItems>;
    Fname: string;
    procedure SetFeffect_entries(const Value: TObjectList<TEffectEntries>);
    procedure SetFitems(const Value: TObjectList<TItems>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property effect_entries: TObjectList<TEffectEntries> read Feffect_entries
      write SetFeffect_entries;
    property id: integer read Fid write Fid;
    property items: TObjectList<TItems> read Fitems write SetFitems;
    property name: string read Fname write Fname;
  end;

implementation

{ TItemFlingEffectEntity.TEffectEntries }

constructor TItemFlingEffectEntity.TEffectEntries.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TItemFlingEffectEntity.TEffectEntries.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TItemFlingEffectEntity }

constructor TItemFlingEffectEntity.Create;
begin
  Feffect_entries := TObjectList<TEffectEntries>.Create;
  Fitems := TObjectList<TItems>.Create;
end;

destructor TItemFlingEffectEntity.Destroy;
begin
  Feffect_entries.Free;
  Fitems.Free;
  inherited;
end;

procedure TItemFlingEffectEntity.SetFeffect_entries
  (const Value: TObjectList<TEffectEntries>);
begin
  FreeAndNil(Feffect_entries);
  Feffect_entries := Value;
end;

procedure TItemFlingEffectEntity.SetFitems(const Value: TObjectList<TItems>);
begin
  FreeAndNil(Fitems);
  Fitems := Value;
end;

end.
