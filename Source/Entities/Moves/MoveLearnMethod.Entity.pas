unit MoveLearnMethod.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TMoveLearnMethodEntity = class
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
    Fname: string;
    Fnames: TObjectList<TNames>;
    Fversion_groups: TObjectList<TResource>;
    procedure SetFdescriptions(const Value: TObjectList<TDescriptions>);
    procedure SetFnames(const Value: TObjectList<TNames>);
    procedure SetFversion_groups(const Value: TObjectList<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property descriptions: TObjectList<TDescriptions> read Fdescriptions
      write SetFdescriptions;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property version_groups: TObjectList<TResource> read Fversion_groups
      write SetFversion_groups;
  end;

implementation

{ TMoveLearnMethodEntity.TDescriptions }

constructor TMoveLearnMethodEntity.TDescriptions.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TMoveLearnMethodEntity.TDescriptions.Destroy;
begin
  Flanguage.Free;
  inherited;
end;

{ TMoveLearnMethodEntity }

constructor TMoveLearnMethodEntity.Create;
begin
  Fdescriptions := TObjectList<TDescriptions>.Create;
  Fnames := TObjectList<TNames>.Create;
  Fversion_groups := TObjectList<TResource>.Create;
end;

destructor TMoveLearnMethodEntity.Destroy;
begin
  Fdescriptions.Free;
  Fnames.Free;
  Fversion_groups.Free;
  inherited;
end;

procedure TMoveLearnMethodEntity.SetFdescriptions
  (const Value: TObjectList<TDescriptions>);
begin
  FreeAndNil(Fdescriptions);
  Fdescriptions := Value;
end;

procedure TMoveLearnMethodEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

procedure TMoveLearnMethodEntity.SetFversion_groups
  (const Value: TObjectList<TResource>);
begin
  FreeAndNil(Fversion_groups);
  Fversion_groups := Value;
end;

end.
