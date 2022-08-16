unit PokeWrapper.Resources;

interface

uses
  System.Character,
  System.StrUtils,
  System.TypInfo,
  //
  PokeWrapper.Types;

type

  IPokeResource = interface
    ['{B6B1E0AF-3BB0-4898-BB90-CE5C490F7CC4}']
    function GetResourceName(APokemon: TPokemon): string;
  end;

  TPokeResource = class(TInterfacedObject, IPokeResource)
  private
    function FindResource(APokemon: TPokemon): string;
  public
    function GetResourceName(APokemon: TPokemon): string;
  end;

implementation

{ TPokeInfo }

function TPokeResource.FindResource(APokemon: TPokemon): string;
begin
  case APokemon of
    berry:
      Exit('berry/%s');
    berry_firmness:
      Exit('berry-firmness/%s');
    berry_flavor:
      Exit('berry-flavor/%s');
    contest_type:
      Exit('contest-type/%s');
    contest_effect:
      Exit('contest-effect/%s');
    super_contest_effect:
      Exit('super-contest-effect/%s');
    encounter_method:
      Exit('encounter-method/%s');
    encounter_condition:
      Exit('encounter-condition/%s');
    encounter_condition_value:
      Exit('encounter-condition-value/%s');
    evolution_chain:
      Exit('evolution-chain/%s');
    evolution_trigger:
      Exit('evolution-trigger/%s');
    generation:
      Exit('generation/%s');
    pokedex:
      Exit('pokedex/%s');
    version:
      Exit('version/%s');
    version_group:
      Exit('version-group/%s');
    item:
      Exit('item/%s');
    item_attribute:
      Exit('item-attribute/%s');
    item_fling_effect:
      Exit('item-fling-effect/%s');
    item_pocket:
      Exit('item-pocket/%s');
    location:
      Exit('location/%s');
    location_area:
      Exit('location-area/%s');
    pal_park_area:
      Exit('pal-park-area/%s');
    region:
      Exit('region/%s');
    machine:
      Exit('machine/%s');
    move:
      Exit('move/%s');
    move_ailment:
      Exit('move-ailment/%s');
    move_battle_style:
      Exit('move-battle-style/%s');
    move_category:
      Exit('move-category/%s');
    move_damage_class:
      Exit('move-damage-class/%s');
    move_learn_method:
      Exit('move-learn-method/%s');
    move_target:
      Exit('move-target/%s');
    ability:
      Exit('ability/%s');
    characteristic:
      Exit('characteristic/%s');
    egg_group:
      Exit('egg-group/%s');
    gender:
      Exit('gender/%s');
    growth_rate:
      Exit('growth-rate/%s');
    nature:
      Exit('nature/%s');
    pokeathlon_stat:
      Exit('pokeathlon-stat/%s');
    pokemon:
      Exit('pokemon/%s');
    pokemon__encounters:
      Exit('pokemon/%s/encounters');
    pokemon_color:
      Exit('pokemon-color/%s');
    pokemon_form:
      Exit('pokemon-form/%s');
    pokemon_habitat:
      Exit('pokemon-habitat/%s');
    pokemon_shape:
      Exit('pokemon-shape/%s');
    pokemon_specie:
      Exit('pokemon-specie/%s');
    stat:
      Exit('stat/%s');
    type_:
      Exit('type/%s');
  end;
end;

function TPokeResource.GetResourceName(APokemon: TPokemon): string;
begin
  Result := FindResource(APokemon);
end;

end.
