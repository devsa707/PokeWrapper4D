unit MoveTarget.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TMoveTargetEntity = class
  type
    TDescriptions = class
    private
      Flanguage: TResource;
      Fdescription: string;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property description: string read Fdescription write Fdescription;
      property language: TResource read Flanguage write Flanguage;
    end;
  private
    FDescriptions: TObjectList<TDescriptions>;
    Fmoves: TObjectList<TResource>;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fid: integer;
    procedure SetFDescriptions(const Value: TObjectList<TDescriptions>);
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property descriptions: TObjectList<TDescriptions> read FDescriptions
      write SetFDescriptions;
    property id: integer read Fid write Fid;
    property moves: TObjectList<TResource> read Fmoves write Fmoves;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
  end;

implementation

{ TMoveTargetEntity.TDescriptions }

constructor TMoveTargetEntity.TDescriptions.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TMoveTargetEntity.TDescriptions.Destroy;
begin
  Flanguage.free;
  inherited;
end;

{ TMoveTargetEntity }

constructor TMoveTargetEntity.Create;
begin
  FDescriptions := TObjectList<TDescriptions>.Create;
  Fmoves := TObjectList<TResource>.Create;
  Fnames := TObjectList<TNames>.Create;
end;

destructor TMoveTargetEntity.Destroy;
begin
  FDescriptions.free;
  Fmoves.free;
  Fnames.free;
  inherited;
end;

procedure TMoveTargetEntity.SetFDescriptions(const Value
  : TObjectList<TDescriptions>);
begin
  FreeAndNil(FDescriptions);
  FDescriptions := Value;
end;

procedure TMoveTargetEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

end.
