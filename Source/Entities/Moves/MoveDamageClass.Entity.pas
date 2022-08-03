unit MoveDamageClass.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TMoveDamageClassEntity = class
  type
    TDescriptions = class
    private
      Fdescription: string;
      Flanguage: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property description: string read Fdescription write Fdescription;
      property language: TResource read Flanguage write Flanguage;
    end;
  private
    Fdescriptions: TObjectList<TDescriptions>;
    Fid: integer;
    Fmoves: TObjectList<TResource>;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFdescriptions(const Value: TObjectList<TDescriptions>);
    procedure SetFmoves(const Value: TObjectList<TResource>);
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property descriptions: TObjectList<TDescriptions> read Fdescriptions
      write SetFdescriptions;
    property id: integer read Fid write Fid;
    property moves: TObjectList<TResource> read Fmoves write SetFmoves;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
  end;

implementation

{ TMoveDamageClassEntity.TDescriptions }

constructor TMoveDamageClassEntity.TDescriptions.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TMoveDamageClassEntity.TDescriptions.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TMoveDamageClassEntity }

constructor TMoveDamageClassEntity.Create;
begin
  Fdescriptions := TObjectList<TDescriptions>.Create;
  Fmoves := TObjectList<TResource>.Create;
  Fnames := TObjectList<TNames>.Create;
end;

destructor TMoveDamageClassEntity.Destroy;
begin
  Fdescriptions.Free;
  Fmoves.Free;
  Fnames.Free;
  inherited;
end;

procedure TMoveDamageClassEntity.SetFdescriptions
  (const Value: TObjectList<TDescriptions>);
begin
  FreeAndNil(Fdescriptions);
  Fdescriptions := Value;
end;

procedure TMoveDamageClassEntity.SetFmoves(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fmoves);
  Fmoves := Value;
end;

procedure TMoveDamageClassEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

end.
