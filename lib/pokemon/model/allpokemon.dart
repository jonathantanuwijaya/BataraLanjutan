
class AllPokemon {
  AllPokemon({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory AllPokemon.fromMap(Map<String, dynamic> json) => AllPokemon(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "url": url,
  };
}