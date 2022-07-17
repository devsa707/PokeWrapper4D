unit EncounterCondition.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TEncounterConditionEntity = class
  type
    TNames = class
    type
      TLanguage = class
      private
        Fname: string;
        Furl: string;
      public
        property name: string read Fname write Fname;
        property url: string read Furl write Furl;
      end;
    private
      Flanguage: TLanguage;
      Fname: string;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property language: TLanguage read Flanguage write Flanguage;
      property name: string read Fname write Fname;
    end;

    TValues = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;
  private
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fvalues: TObjectList<TValues>;
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFvalues(const Value: TObjectList<TValues>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property values: TObjectList<TValues> read Fvalues write SetFvalues;
  end;

implementation

{ TEncounterConditionEntity }

constructor TEncounterConditionEntity.Create;
begin
  Fnames := TObjectList<TNames>.Create;
  Fvalues := TObjectList<TValues>.Create;
end;

destructor TEncounterConditionEntity.Destroy;
begin
  Fnames.Free;
  Fvalues.Free;
  inherited;
end;

procedure TEncounterConditionEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TEncounterConditionEntity.SetFvalues(const Value
  : TObjectList<TValues>);
begin
  FreeAndNil(Fvalues);
  Fvalues := Value;
end;

{ TEncounterConditionEntity.TNames }

constructor TEncounterConditionEntity.TNames.Create;
begin
  Flanguage := TLanguage.Create;
end;

destructor TEncounterConditionEntity.TNames.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

end.
