unit ContestEffect.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TContestEffectEntity = class
  type
    TEffectEntries = class
    private
      Feffect: string;
      Flanguage: TLanguage;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property effect: string read Feffect write Feffect;
      property language: TLanguage read Flanguage write Flanguage;
    end;

  type
    TFlavorTextEntries = class
    private
      Fflavor_text: string;
      Flanguage: TLanguage;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property flavor_text: string read Fflavor_text write Fflavor_text;
      property language: TLanguage read Flanguage write Flanguage;
    end;
  private
    Fappeal: integer;
    Feffect_entries: TObjectList<TEffectEntries>;
    Fflavor_text_entries: TObjectList<TFlavorTextEntries>;
    Fid: integer;
    Fjam: integer;
    procedure SetFeffect_entries(const Value: TObjectList<TEffectEntries>);
    procedure SetFflavor_text_entries(const Value
      : TObjectList<TFlavorTextEntries>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property appeal: integer read Fappeal write Fappeal;
    property effect_entries: TObjectList<TEffectEntries> read Feffect_entries
      write SetFeffect_entries;
    property flavor_text_entries: TObjectList<TFlavorTextEntries>
      read Fflavor_text_entries write SetFflavor_text_entries;
    property id: integer read Fid write Fid;
    property jam: integer read Fjam write Fjam;
  end;

implementation

{ TContestEffectEntity }

constructor TContestEffectEntity.Create;
begin
  Feffect_entries := TObjectList<TEffectEntries>.Create;
  Fflavor_text_entries := TObjectList<TFlavorTextEntries>.Create;
end;

destructor TContestEffectEntity.Destroy;
begin
  Feffect_entries.Free;
  Fflavor_text_entries.Free;
  inherited;
end;

procedure TContestEffectEntity.SetFeffect_entries
  (const Value: TObjectList<TEffectEntries>);
begin
  FreeAndNil(Feffect_entries);
  Feffect_entries := Value;
end;

procedure TContestEffectEntity.SetFflavor_text_entries
  (const Value: TObjectList<TFlavorTextEntries>);
begin
  FreeAndNil(Fflavor_text_entries);
  Fflavor_text_entries := Value;
end;

{ TContestEffectEntity.TEffectEntries }

constructor TContestEffectEntity.TEffectEntries.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TContestEffectEntity.TEffectEntries.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TContestEffectEntity.TFlavorTextEntries }

constructor TContestEffectEntity.TFlavorTextEntries.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TContestEffectEntity.TFlavorTextEntries.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
