unit PokeList.Entity;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  //
  Commons.Entities;

type
  TPokeListEntity = class
  private
    Fcount: integer;
    Fnext: string;
    Fprevious: string;
    Fresults: TObjectlist<TResource>;
    procedure SetFresults(const Value: TObjectlist<TResource>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property count: integer read Fcount write Fcount;
    property next: string read Fnext write Fnext;
    property previous: string read Fprevious write Fprevious;
    property results: TObjectlist<TResource> read Fresults write SetFresults;
  end;

implementation

{ TPokeListEntity }

constructor TPokeListEntity.Create;
begin
  Fresults := TObjectlist<TResource>.Create;
end;

destructor TPokeListEntity.Destroy;
begin
  Fresults.Free;
  inherited;
end;

procedure TPokeListEntity.SetFresults(const Value: TObjectlist<TResource>);
begin
  FreeAndNil(Fresults);
  Fresults := Value;
end;

end.
