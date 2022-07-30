unit EncounterCondition.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TEncounterConditionEntity = class
  type
  private
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fvalues: TObjectList<TResource>;
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFvalues(const Value: TObjectList<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property values: TObjectList<TResource> read Fvalues write SetFvalues;
  end;

implementation

{ TEncounterConditionEntity }

constructor TEncounterConditionEntity.Create;
begin
  Fnames := TObjectList<TNames>.Create;
  Fvalues := TObjectList<TResource>.Create;
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
  : TObjectList<TResource>);
begin
  FreeAndNil(Fvalues);
  Fvalues := Value;
end;

end.
