unit PokeAPI.Types;

interface

type
  TBerries = (berry, //
    berry_firmness, //
    berry_flavor);

  TContests = (contest_types, //
    contest_effects, //
    super_contest_effects);

  TEncounters = (encounter_methods, //
    enconter_conditions, //
    encounter_condition_values);

  TEvolution = (evolution_chains, //
    evolution_triggers);

  TGames = (generations, //
    pokedexes, //
    version, //
    version_groups);

  TItems = (item, //
    item_attributes, //
    item_fling_effects, //
    item_pockets);

  TLocations = (locations, //
    location_areas, //
    pal_park_areas, //
    regions);

  TMachines = (machines);

  TMoves = (moves, //
    move_ailments, //
    move_battle_styles, //
    move_categories, //
    move_damage_classes, //
    move_learn_methods, //
    move_targets);

  TPokemon = (abilities, //
    characteristics, //
    egg_groups, //
    genders, //
    growth_rates, //
    natures, //
    pokeathlon_stats, //
    pokemon, //
    pokemon_location_areas, //
    pokemon_colors, //
    pokemon_forms, //
    pokemon_habitats, //
    pokemon_shapes, //
    pokemon_species, //
    stats, Types);

implementation

end.
