unit Characteristic.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities;

type
  TCharacteristicEntity = class
  type
    TDescription = class
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
    Fdescription: TObjectList<TDescription>;
    Fgene_modulo: integer;
    Fhighest_stat: TResource;
    Fpossible_values: TList<integer>;
    procedure SetFdescription(const Value: TObjectList<TDescription>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property description: TObjectList<TDescription> read Fdescription
      write SetFdescription;
    property gene_modulo: integer read Fgene_modulo write Fgene_modulo;
    property highest_stat: TResource read Fhighest_stat write Fhighest_stat;
    property possible_values: TList<integer> read Fpossible_values
      write Fpossible_values;
  end;

implementation

{ TCharacteristicEntity.TDescription }

constructor TCharacteristicEntity.TDescription.Create;
begin
  Flanguage := TResource.Create;
end;

destructor TCharacteristicEntity.TDescription.Destroy;
begin
  Flanguage.free;
  inherited;
end;

{ TCharacteristicEntity }

constructor TCharacteristicEntity.Create;
begin
  Fdescription := TObjectList<TDescription>.Create;
  Fhighest_stat := TResource.Create;
end;

destructor TCharacteristicEntity.Destroy;
begin
  Fdescription.free;
  Fhighest_stat.free;
  inherited;
end;

procedure TCharacteristicEntity.SetFdescription(const Value
  : TObjectList<TDescription>);
begin
  FreeAndNil(Fdescription);
  Fdescription := Value;
end;

end.
