unit PokeAPI;

interface

uses System.Generics.Collections;

type
  IPokeAPI = interface

  end;

  TPokeAPIEntity = class(TInterfacedObject, IPokeAPI)
  private
  public
    constructor Create; overload;
    function Get<T: class>(): T;
    function GetList<T: class>(): TObjectList<T>;
  end;

  TPokeAPIJson = class(TInterfacedObject, IPokeAPI)
  private
  public
    constructor Create; overload;
    function Get<T: class>(): T;
    function GetList<T: class>(): TObjectList<T>;
  end;

implementation

{ TPokeAPIClass }

constructor TPokeAPIEntity.Create;
begin
end;

function TPokeAPIEntity.Get<T>: T;
begin

end;

function TPokeAPIClass<T>.GetList<T>: TObjectList<T>;
begin

end;

end.
