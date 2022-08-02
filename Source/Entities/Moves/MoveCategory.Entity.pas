unit MoveCategory.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TMoveCategoryEntity = class
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
    procedure SetFdescriptions(const Value: TObjectList<TDescriptions>);
    procedure SetFmoves(const Value: TObjectList<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property descriptions: TObjectList<TDescriptions> read Fdescriptions
      write SetFdescriptions;
    property id: integer read Fid write Fid;
    property moves: TObjectList<TResource> read Fmoves write SetFmoves;
    property name: string read Fname write Fname;
  end;

implementation

{ TMoveCategoryEntity.TDescriptions }

constructor TMoveCategoryEntity.TDescriptions.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TMoveCategoryEntity.TDescriptions.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TMoveCategoryEntity }

constructor TMoveCategoryEntity.Create;
begin
  Fdescriptions := TObjectList<TDescriptions>.Create;
  Fmoves := TObjectList<TResource>.Create;
end;

destructor TMoveCategoryEntity.Destroy;
begin
  Fdescriptions.Free;
  Fmoves.Free;
  inherited;
end;

procedure TMoveCategoryEntity.SetFdescriptions(const Value
  : TObjectList<TDescriptions>);
begin
  FreeAndNil(Fdescriptions);
  Fdescriptions := Value;
end;

procedure TMoveCategoryEntity.SetFmoves(const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fmoves);
  Fmoves := Value;
end;

end.
