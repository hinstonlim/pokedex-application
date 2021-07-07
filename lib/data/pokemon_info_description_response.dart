class PokemonSpeciesInfoResponse {
  final String description;

  PokemonSpeciesInfoResponse({this.description});

  factory PokemonSpeciesInfoResponse.fromJson(Map<String, dynamic> json) {
    final description = json['flavor_text_entries'][0]['flavor_text']; 

    return PokemonSpeciesInfoResponse(description: description);
  }
}