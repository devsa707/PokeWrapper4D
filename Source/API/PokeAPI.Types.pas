unit PokeAPI.Types;

interface

type
  TBerries = (berry, //
    berry_firmness, //
    berry_flavor);

  TContests = (contest_type, //
    contest_effect, //
    super_contest_effect);

  TEncounters = (encounter_method, //
    enconter_condition, //
    encounter_condition_value);

  TEvolution = (evolution_chain, //
    evolution_trigger);

  TGames = (generation, //
    pokedex, //
    version, //
    version_group);

  TItems = (item, //
    item_attribute, //
    item_fling_effect, //
    item_pocket);

  TLocations = (location, //
    location_area, //
    pal_park_area, //
    region);

  TMachines = (machine);

  TMoves = (move, //
    move_ailment, //
    move_battle_style, //
    move_categorie, //
    move_damage_class, //
    move_learn_method, //
    move_targets);

  TPokemon = (ability, //
    characteristic, //
    egg_group, //
    gender, //
    growth_rate, //
    nature, //
    pokeathlon_stat, //
    pokemon, //
    pokemon_location_area, //
    pokemon_color, //
    pokemon_form, //
    pokemon_habitat, //
    pokemon_shape, //
    pokemon_specie, //
    stat, //
    type_);

implementation

end.
