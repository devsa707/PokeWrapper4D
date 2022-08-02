unit MoveAilment.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TMoveAilmentEntity = class
  private
    Fid: integer;
    Fmoves: TObjectList<TResource>;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFmoves(const Value: TObjectList<TResource>);
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property id: integer read Fid write Fid;
    property moves: TObjectList<TResource> read Fmoves write SetFmoves;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
  end;

implementation

{ TMoveAilmentEntity }

constructor TMoveAilmentEntity.Create;
begin
  Fmoves := TObjectList<TResource>.Create;
end;

destructor TMoveAilmentEntity.Destroy;
begin
  Fmoves.Free;
  inherited;
end;

procedure TMoveAilmentEntity.SetFmoves(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fmoves);
  Fmoves := Value;
end;

procedure TMoveAilmentEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

end.
