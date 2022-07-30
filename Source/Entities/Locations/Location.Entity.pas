unit Location.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  //
  MVCFramework.Nullables,
  //
  Commons.Entities;

type
  TLocationEntity = class
  type
    TGameIndices = class
    private
      Fgame_index: integer;
      Fgeneration: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property game_index: integer read Fgame_index write Fgame_index;
      property generation: TResource read Fgeneration write Fgeneration;
    end;
  private
    Fareas: Tobjectlist<TResource>;
    Fgame_indices: Tobjectlist<TGameIndices>;
    Fid: integer;
    Fname: string;
    Fnames: Tobjectlist<TNames>;
    Fregion: TResource;
    procedure SetFareas(const Value: Tobjectlist<TResource>);
    procedure SetFgame_indices(const Value: Tobjectlist<TGameIndices>);
    procedure SetFnames(const Value: Tobjectlist<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property areas: Tobjectlist<TResource> read Fareas write SetFareas;
    property game_indices: Tobjectlist<TGameIndices> read Fgame_indices
      write SetFgame_indices;
    property id: integer read Fid write Fid;
    property name: string read Fname write Fname;
    property names: Tobjectlist<TNames> read Fnames write SetFnames;
    property region: TResource read Fregion write Fregion;
  end;

implementation

{ TLocationEntity }

constructor TLocationEntity.Create;
begin
  Fareas := Tobjectlist<TResource>.Create;
  Fgame_indices := Tobjectlist<TGameIndices>.Create;
  Fnames := Tobjectlist<TNames>.Create;
  Fregion := TResource.Create;
end;

destructor TLocationEntity.Destroy;
begin
  Fareas.Free;
  Fgame_indices.Free;
  Fnames.Free;
  Fregion.Free;
  inherited;
end;

procedure TLocationEntity.SetFareas(const Value: Tobjectlist<TResource>);
begin
  FreeAndNil(Fareas);
  Fareas := Value;
end;

procedure TLocationEntity.SetFgame_indices(const Value
  : Tobjectlist<TGameIndices>);
begin
  Fgame_indices := Value;
end;

procedure TLocationEntity.SetFnames(const Value: Tobjectlist<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

{ TLocationEntity.TGameIndices }

constructor TLocationEntity.TGameIndices.Create;
begin
  Fgeneration := TResource.Create;
end;

destructor TLocationEntity.TGameIndices.Destroy;
begin
  Fgeneration.Free;
  inherited;
end;


end.
