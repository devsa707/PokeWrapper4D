unit MoveBattleStyle.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TMoveBattleStyleEntity = class
  private
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
  end;

implementation

{ TMoveBattleStyleEntity }

constructor TMoveBattleStyleEntity.Create;
begin
  Fnames := TObjectList<TNames>.Create;
end;

destructor TMoveBattleStyleEntity.Destroy;
begin
  Fnames.free;
  inherited;
end;

procedure TMoveBattleStyleEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

end.
