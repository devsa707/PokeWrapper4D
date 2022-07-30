unit EncounterMethod.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TEncounterMethodEntity = class
  private
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Forder: integer;
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property order: integer read Forder write Forder;
  end;

implementation

{ TEncounterMethodEntity }

constructor TEncounterMethodEntity.Create;
begin
  Fnames := TObjectList<TNames>.Create;
end;

destructor TEncounterMethodEntity.Destroy;
begin
  Fnames.Free;
  inherited;
end;

procedure TEncounterMethodEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  Fnames := Value;
end;

end.
