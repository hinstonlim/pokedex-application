class PokemonDetails {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int weight;
  final int height;
  final String description;

  PokemonDetails({
    this.id,
    this.name,
    this.imageUrl,
    this.types,
    this.height,
    this.weight,
    this.description
  });
}