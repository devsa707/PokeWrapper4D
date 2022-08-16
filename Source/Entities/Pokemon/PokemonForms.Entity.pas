unit PokemonForms.Entity;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Commons.Entities,
  // MVC Framework
  MVCFramework.Serializer.Commons;

type
  TPokemonFormsEntity = class
  type
    TSprites = class
    private
      Fback_default: string;
      Fback_female: string;
      Fback_shiny: string;
      Fback_shiny_female: string;
      Ffront_default: string;
      Ffront_female: string;
      Ffront_shiny: string;
      Ffront_shiny_female: string;
    public
      property back_default: string read Fback_default write Fback_default;
      property back_female: string read Fback_female write Fback_female;
      property back_shiny: string read Fback_shiny write Fback_shiny;
      property back_shiny_female: string read Fback_shiny_female write Fback_shiny_female;
      property front_default: string read Ffront_default write Ffront_default;
      property front_female: string read Ffront_female write Ffront_female;
      property front_shiny: string read Ffront_shiny write Ffront_shiny;
      property front_shiny_female: string read Ffront_shiny_female write Ffront_shiny_female;
    end;

    TTypes = class
    private
      Fslot: integer;
      Ftype: TResource;
    public
      constructor Create; overload;
      destructor Destroy; override;
      property slot: integer read Fslot write Fslot;
      [MVCNameAsAttribute('type')]
      property type_: TResource read Ftype write Ftype;
    end;
  private
    Fform_name: string;
    Fform_names: TObjectList<TNames>;
    Fform_order: integer;
    Fid: integer;
    Fis_battle_only: boolean;
    Fis_default: boolean;
    Fis_mega: boolean;
    Fname: string;
    Fnames: TObjectList<TNames>;
    Forder: integer;
    Fpokemon: TResource;
    Fsprites: TSprites;
    Ftypes: TObjectList<TTypes>;
    Fversion_group: TResource;
    procedure SetFform_names(const Value: TObjectList<TNames>);
    procedure SetFnames(const Value: TObjectList<TNames>);
  public
    constructor Create; overload;
    destructor Destroy; override;
    property form_name: string read Fform_name write Fform_name;
    property form_names: TObjectList<TNames> read Fform_names write SetFform_names;
    property form_order: integer read Fform_order write Fform_order;
    property id: integer read Fid write Fid;
    property is_battle_only: boolean read Fis_battle_only write Fis_battle_only;
    property is_default: boolean read Fis_default write Fis_default;
    property is_mega: boolean read Fis_mega write Fis_mega;
    property name: string read Fname write Fname;
    property names: TObjectList<TNames> read Fnames write SetFnames;
    property order: integer read Forder write Forder;
    property pokemon: TResource read Fpokemon write Fpokemon;
    property sprites: TSprites read Fsprites write Fsprites;
    property types: TObjectList<TTypes> read Ftypes write Ftypes;
    property version_group: TResource read Fversion_group write Fversion_group;
  end;

implementation

{ TPokemonFormsEntity }

constructor TPokemonFormsEntity.Create;
begin
  Fform_names := TObjectList<TNames>.Create;
  Fnames := TObjectList<TNames>.Create;
  Fpokemon := TResource.Create;
  Fsprites := TSprites.Create;
  Ftypes := TObjectList<TTypes>.Create;
  Fversion_group := TResource.Create;
end;

destructor TPokemonFormsEntity.Destroy;
begin
  Fform_names.Free;
  Fnames.Free;
  Fpokemon.Free;
  Fsprites.Free;
  Ftypes.Free;
  Fversion_group.Free;
  inherited;
end;

procedure TPokemonFormsEntity.SetFform_names(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fform_names);
  Fform_names := Value;
end;

procedure TPokemonFormsEntity.SetFnames(const Value: TObjectList<TNames>);
begin
  FreeAndNil(Fnames);
  Fnames := Value;
end;

{ TPokemonFormsEntity.TTypes }

constructor TPokemonFormsEntity.TTypes.Create;
begin
  Ftype := TResource.Create;
end;

destructor TPokemonFormsEntity.TTypes.Destroy;
begin
  Ftype.Free;
  inherited;
end;

end.
