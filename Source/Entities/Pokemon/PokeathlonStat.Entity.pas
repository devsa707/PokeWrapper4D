unit PokeathlonStat.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TPokeathlonStatEntity = class
  type
    TAffectingNatures = class
    type
      TStatus = class
      private
        Fmax_change: integer;
        Fnature: TResource;
      public
        constructor Create; overload;
        destructor Destroy; override;
        property max_change: integer read Fmax_change write Fmax_change;
        property nature: TResource read Fnature write Fnature;
      end;
    private
      Fdecrease: TObjectList<TStatus>;
      Fincrease: TObjectList<TStatus>;
      procedure SetFdecrease(const Value: TObjectList<TStatus>);
      procedure SetFincrease(const Value: TObjectList<TStatus>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property decrease: TObjectList<TStatus> read Fdecrease write SetFdecrease;
      property increase: TObjectList<TStatus> read Fincrease write SetFincrease;
    end;
  private
    Faffecting_natures: TAffectingNatures;
    Fid: integer;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property affecting_natures: TAffectingNatures read Faffecting_natures
      write Faffecting_natures;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
  end;

implementation

{ TPokeathlonStatEntity.TAffectingNatures.TStatus }

constructor TPokeathlonStatEntity.TAffectingNatures.TStatus.Create;
begin
  Fnature := TResource.Create;
end;

destructor TPokeathlonStatEntity.TAffectingNatures.TStatus.Destroy;
begin
  Fnature.Free;
  inherited;
end;

{ TPokeathlonStatEntity.TAffectingNatures }

constructor TPokeathlonStatEntity.TAffectingNatures.Create;
begin
  Fdecrease := TObjectList<TStatus>.Create;
  Fincrease := TObjectList<TStatus>.Create;
end;

destructor TPokeathlonStatEntity.TAffectingNatures.Destroy;
begin
  Fdecrease.Free;
  Fincrease.Free;
  inherited;
end;

procedure TPokeathlonStatEntity.TAffectingNatures.SetFdecrease
  (const Value: TObjectList<TStatus>);
begin
  FreeAndNil(Fdecrease);
  Fdecrease := Value;
end;

procedure TPokeathlonStatEntity.TAffectingNatures.SetFincrease
  (const Value: TObjectList<TStatus>);
begin
  FreeAndNil(Fincrease);
  Fincrease := Value;
end;

{ TPokeathlonStatEntity }

constructor TPokeathlonStatEntity.Create;
begin
  Faffecting_natures := TAffectingNatures.Create;
  Fnames := TObjectList<TNames>.Create;
end;

destructor TPokeathlonStatEntity.Destroy;
begin
  Faffecting_natures.Free;
  Fnames.Free;
  inherited;
end;

procedure TPokeathlonStatEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

end.
