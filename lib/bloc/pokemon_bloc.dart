import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_application/bloc/pokemon_event.dart';
import 'package:pokedex_application/bloc/pokemon_state.dart';
import 'package:pokedex_application/data/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {    //<input, output>

  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial());
  
  //Determine what state to return
  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* { //Stream, async* & await tgt for bloc usage
    
    if (event is PokemonPageRequest) {
      yield PokemonLoadInProgress();    //yield returns value w/o terminates the function

      try {
        final pokemonPageResponse = await _pokemonRepository.getPokemonPage(event.page);    //Stores information get from pokeapi.co
        yield PokemonPageLoadSuccess( 
          pokemonListings: pokemonPageResponse.pokemonListings, 
          canLoadNextPage: pokemonPageResponse.canLoadNextPage
        );
      } catch (e) {
        yield PokemonPageLoadFailed(error: e);  
      }
    }
  }
}