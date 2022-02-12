
import 'dart:convert';

Pokemon pokemonFromMap(String str) => Pokemon.fromMap(json.decode(str));

class Pokemon {
  Pokemon({
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.stats,
    required this.types,
    required this.weight,
  });

  List<Ability> abilities;
  int baseExperience;
  int height;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  String name;
  int order;
  List<dynamic> pastTypes;
  List<Stat> stats;
  List<Type> types;
  int weight;

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
    abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromMap(x))),
    baseExperience: json["base_experience"],
    height: json["height"],
    id: json["id"],
    isDefault: json["is_default"],
    locationAreaEncounters: json["location_area_encounters"],
    name: json["name"],
    order: json["order"],
    pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
    stats: List<Stat>.from(json["stats"].map((x) => Stat.fromMap(x))),
    types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
    weight: json["weight"],
  );

}

class Ability {
  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  TypeClass ability;
  bool isHidden;
  int slot;

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
    ability: TypeClass.fromMap(json["ability"]),
    isHidden: json["is_hidden"],
    slot: json["slot"],
  );

}
class AbilityElement {
  AbilityElement({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  TypeClass ability;
  bool isHidden;
  int slot;

  factory AbilityElement.fromMap(Map<String, dynamic> json) => AbilityElement(
    ability: TypeClass.fromMap(json["ability"]),
    isHidden: json["is_hidden"],
    slot: json["slot"],
  );

}


class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
  });

  int baseStat;
  int effort;

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(
    baseStat: json["base_stat"],
    effort: json["effort"],
  );

}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  int slot;
  TypeClass type;

  factory Type.fromMap(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: TypeClass.fromMap(json["type"]),
  );

}
class TypeClass {
  TypeClass({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory TypeClass.fromMap(Map<String, dynamic> json) => TypeClass(
    name: json["name"],
    url: json["url"],
  );

}