unit EncounterConditionValue.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TEncounterConditionValueEntity = class
  private
    Fcondition: TResource;
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property condition: TResource read Fcondition write Fcondition;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
  end;

implementation

{ TEncounterConditionValueEntity }

constructor TEncounterConditionValueEntity.Create;
begin
  Fcondition := TResource.Create;
  Fnames := TObjectList<TNames>.Create;
end;

destructor TEncounterConditionValueEntity.Destroy;
begin
  Fcondition.Free;
  Fnames.Free;
  inherited;
end;

procedure TEncounterConditionValueEntity.SetFnames
  (const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

end.
