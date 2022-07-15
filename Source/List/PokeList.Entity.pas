unit PokeList.Entity;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections;

type
  TPokeListEntity = class
  type
    TResults = class
    private
      Fname: string;
      Furl: string;
    public
      property name: string read Fname write Fname;
      property url: string read Furl write Furl;
    end;
  private
    Fcount: integer;
    Fnext: string;
    Fprevious: string;
    Fresults: TObjectlist<TResults>;
    procedure SetFresults(const Value: TObjectlist<TResults>);
  public
    property count: integer read Fcount write Fcount;
    property next: string read Fnext write Fnext;
    property previous: string read Fprevious write Fprevious;
    property results: TObjectlist<TResults> read Fresults write SetFresults;
  end;

implementation

{ TPokeListEntity }

procedure TPokeListEntity.SetFresults(const Value: TObjectlist<TResults>);
begin
  FreeAndNil(Fresults);
  Fresults := Value;
end;

end.
