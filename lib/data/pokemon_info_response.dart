class PokemonInfoResponse {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int weight;
  final int height;

  PokemonInfoResponse({
    this.id,
    this.name,
    this.imageUrl,
    this.types,
    this.height,
    this.weight
  });

  factory PokemonInfoResponse.fromJson(Map<String, dynamic> json) {
    
    final types = (json['types'] as List)
      .map((typeJson) => typeJson['type']['name'] as String)
      .toList();

    return PokemonInfoResponse(
      id       : json['id'],
      name     : json['name'],
      imageUrl : json['sprites']['front_default'],
      types    : types,
      height   : json['height'],
      weight   : json['weight']
    );
  }
}