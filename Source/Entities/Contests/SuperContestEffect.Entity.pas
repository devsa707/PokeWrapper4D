unit SuperContestEffect.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TSuperContestEffectEntity = class
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
    Fflavor_text_entries: TObjectList<TFlavorTextEntries>;
    Fid: integer;
    Fmoves: TObjectList<TResource>;
    procedure SetFmoves(const Value: TObjectList<TResource>);
    procedure SetFflavor_text_entries(const Value
      : TObjectList<TFlavorTextEntries>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property appeal: integer read Fappeal write Fappeal;
    property flavor_text_entries: TObjectList<TFlavorTextEntries>
      read Fflavor_text_entries write SetFflavor_text_entries;
    property id: integer read Fid write Fid;
    property moves: TObjectList<TResource> read Fmoves write SetFmoves;
  end;

implementation

{ TSuperContestEffectEntity }

constructor TSuperContestEffectEntity.Create;
begin
  Fflavor_text_entries := TObjectList<TFlavorTextEntries>.Create;
  Fmoves := TObjectList<TResource>.Create;
end;

destructor TSuperContestEffectEntity.Destroy;
begin
  Fflavor_text_entries.Free;
  Fmoves.Free;
  inherited;
end;

procedure TSuperContestEffectEntity.SetFflavor_text_entries
  (const Value: TObjectList<TFlavorTextEntries>);
begin
  FreeAndNil(Fflavor_text_entries);
  Fflavor_text_entries := Value;
end;

procedure TSuperContestEffectEntity.SetFmoves(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fmoves);
  Fmoves := Value;
end;

{ TSuperContestEffectEntity.TFlavorTextEntries }

constructor TSuperContestEffectEntity.TFlavorTextEntries.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TSuperContestEffectEntity.TFlavorTextEntries.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
