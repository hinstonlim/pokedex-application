import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_application/bloc/pokemon_details_cubit.dart';

class NavCubit extends Cubit<int> { //Pass id  of pokemon
  PokemonDetailsCubit pokemonDetailsCubit;

  NavCubit({this.pokemonDetailsCubit}) : super(null);

  void showPokemonDetails(int pokemonId) {
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }

  void backToPokedex() {
    pokemonDetailsCubit.clearPokemonDetails();
    emit(null);
  }
}