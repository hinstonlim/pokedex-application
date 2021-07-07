import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_application/data/pokemon_details.dart';
import 'package:pokedex_application/data/pokemon_info_response.dart';
import 'package:pokedex_application/data/pokemon_repository.dart';
import 'package:pokedex_application/data/pokemon_info_description_response.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails> {

  final _pokemonRepository = PokemonRepository();

  PokemonDetailsCubit() : super(null);

  void getPokemonDetails(int pokemonId) async {
    final responses = await Future.wait([     //Future.wait allows following two lines of code to excute simultaneously
      _pokemonRepository.getPokemonInfo(pokemonId),         //responses[0]
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId)   //responses[1]
    ]);
    
    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final speciesInfo = responses[1] as PokemonSpeciesInfoResponse;   //For description

    emit(PokemonDetails(
      id          : pokemonInfo.id,
      name        : pokemonInfo.name,
      imageUrl    : pokemonInfo.imageUrl,
      types       : pokemonInfo.types,
      weight      : pokemonInfo.weight,
      height      : pokemonInfo.height,
      description : speciesInfo.description
    ));
  }

  void clearPokemonDetails() => emit(null);
}