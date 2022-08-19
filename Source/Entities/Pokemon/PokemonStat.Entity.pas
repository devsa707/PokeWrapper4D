unit PokemonStat.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TPokemonStatEntity = class
  type
    TAffectingMoves = class
    type
      TDecrease = class
      private
        Fchange: integer;
        Fmove: TResource;
      public
        constructor Create; overload;
        destructor Destroy; override;
        property change: integer read Fchange write Fchange;
        property move: TResource read Fmove write Fmove;
      end;

      TIncrease = class
      private
        Fchange: integer;
        Fmove: TResource;
      public
        constructor Create; overload;
        destructor Destroy; override;
        property change: integer read Fchange write Fchange;
        property move: TResource read Fmove write Fmove;
      end;
    private
      Fdecrease: TObjectList<TDecrease>;
      Fincrease: TObjectList<TIncrease>;
      procedure SetFdecrease(const Value: TObjectList<TDecrease>);
      procedure SetFincrease(const Value: TObjectList<TIncrease>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property decrease: TObjectList<TDecrease> read Fdecrease write SetFdecrease;
      property increase: TObjectList<TIncrease> read Fincrease write SetFincrease;
    end;

    TAffectingNatures = class
    type
      TDecrease = class
      private
        Fmove: TResource;
      public
        constructor Create; overload;
        destructor Destroy; override;
        property move: TResource read Fmove write Fmove;
      end;

      TIncrease = class
      private
        Fmove: TResource;
      public
        constructor Create; overload;
        destructor Destroy; override;
        property move: TResource read Fmove write Fmove;
      end;
    private
      Fdecrease: TObjectList<TDecrease>;
      Fincrease: TObjectList<TIncrease>;
      procedure SetFdecrease(const Value: TObjectList<TDecrease>);
      procedure SetFincrease(const Value: TObjectList<TIncrease>);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property decrease: TObjectList<TDecrease> read Fdecrease write SetFdecrease;
      property increase: TObjectList<TIncrease> read Fincrease write SetFincrease;
    end;

    TCharacteristics = class
    private
      Furl: string;
    public
      property url: string read Furl write Furl;
    end;
  private
    Faffecting_moves: TAffectingMoves;
    Faffecting_natures: TAffectingNatures;
    Fcharacteristics: TObjectList<TCharacteristics>;
    Fgame_index: integer;
    Fid: integer;
    Fis_battle_only: integer;
    Fmove_damage_class: TResource;
    Fname: string;
    Fnames: TObjectList<TNames>;
    procedure SetFaffecting_natures(const Value: TAffectingNatures);
    procedure SetFcharacteristics(const Value: TObjectList<TCharacteristics>);
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property affecting_moves: TAffectingMoves read Faffecting_moves write Faffecting_moves;
    property affecting_natures: TAffectingNatures read Faffecting_natures write SetFaffecting_natures;
    property characteristics: TObjectList<TCharacteristics> read Fcharacteristics write SetFcharacteristics;
    property game_index: integer read Fgame_index write Fgame_index;
    property id: integer read Fid write Fid;
    property is_battle_only: integer read Fis_battle_only write Fis_battle_only;
    property move_damage_class: TResource read Fmove_damage_class write Fmove_damage_class;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
  end;

implementation

{ TPokemonStatEntity.TAffectingMoves.TDecrease }

constructor TPokemonStatEntity.TAffectingMoves.TDecrease.Create;
begin
  Fmove := TResource.Create;
end;

destructor TPokemonStatEntity.TAffectingMoves.TDecrease.Destroy;
begin
  Fmove.Free;
  inherited;
end;

{ TPokemonStatEntity.TAffectingMoves }

constructor TPokemonStatEntity.TAffectingMoves.Create;
begin
  Fdecrease := TObjectList<TDecrease>.Create;
  Fincrease := TObjectList<TIncrease>.Create;
end;

destructor TPokemonStatEntity.TAffectingMoves.Destroy;
begin
  Fdecrease.Free;
  Fincrease.Free;
  inherited;
end;

procedure TPokemonStatEntity.TAffectingMoves.SetFdecrease(const Value: TObjectList<TDecrease>);
begin
  FreeAndNil(Fdecrease);
  Fdecrease := Value;
end;

procedure TPokemonStatEntity.TAffectingMoves.SetFincrease(const Value: TObjectList<TIncrease>);
begin
  FreeAndNil(Fincrease);
  Fincrease := Value;
end;

{ TPokemonStatEntity }

constructor TPokemonStatEntity.Create;
begin
  Faffecting_moves := TAffectingMoves.Create;
  Faffecting_natures := TAffectingNatures.Create;
  Fcharacteristics := TObjectList<TCharacteristics>.Create;
  Fmove_damage_class := TResource.Create;
  Fnames := TObjectList<TNames>.Create;
end;

destructor TPokemonStatEntity.Destroy;
begin
  Faffecting_moves.Free;
  Faffecting_natures.Free;
  Fcharacteristics.Free;
  Fmove_damage_class.Free;
  Fnames.Free;
  inherited;
end;

procedure TPokemonStatEntity.SetFaffecting_natures(const Value: TAffectingNatures);
begin
  FreeAndNil(Faffecting_natures);
  Faffecting_natures := Value;
end;

procedure TPokemonStatEntity.SetFcharacteristics(const Value: TObjectList<TCharacteristics>);
begin
  FreeAndNil(Fcharacteristics);
  Fcharacteristics := Value;
end;

procedure TPokemonStatEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

{ TPokemonStatEntity.TAffectingMoves.TIncrease }

constructor TPokemonStatEntity.TAffectingMoves.TIncrease.Create;
begin
  Fmove := TResource.Create;
end;

destructor TPokemonStatEntity.TAffectingMoves.TIncrease.Destroy;
begin
  Fmove.Free;
  inherited;
end;

{ TPokemonStatEntity.TAffectingNatures }

constructor TPokemonStatEntity.TAffectingNatures.Create;
begin
  Fdecrease := TObjectList<TDecrease>.Create;
  Fincrease := TObjectList<TIncrease>.Create;
end;

destructor TPokemonStatEntity.TAffectingNatures.Destroy;
begin
  Fdecrease.Free;
  Fincrease.Free;
  inherited;
end;

procedure TPokemonStatEntity.TAffectingNatures.SetFdecrease(const Value: TObjectList<TDecrease>);
begin
  FreeAndNil(Fdecrease);
  Fdecrease := Value;
end;

procedure TPokemonStatEntity.TAffectingNatures.SetFincrease(const Value: TObjectList<TIncrease>);
begin
  FreeAndNil(Fincrease);
  Fincrease := Value;
end;

end.
