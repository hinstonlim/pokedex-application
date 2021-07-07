import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_application/data/pokemon_info_response.dart';
import 'package:pokedex_application/data/pokemon_main_response.dart';
import 'package:pokedex_application/data/pokemon_info_description_response.dart';

class PokemonRepository{
  final baseUrl = 'pokeapi.co';
  final client = http.Client();   //Interface for http clients

  //An object representing a delayed computation
  // ignore: missing_return
  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    //pokemon?limit=200&offset=0
    
    final queryParameters = {'limit': '200', 'offset': (pageIndex*200).toString()};     //200 pokemons per page

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParameters);

    try {
      final response  = await client.get(uri);        //Send a get request to given URL (uri in this case)
      final json      = jsonDecode(response.body);    //Convert to correct parameters for json(map)
      return PokemonPageResponse.fromJson(json);
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  Future<PokemonInfoResponse> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    try {
      final response = await client.get(uri);
      final json     = jsonDecode(response.body);
      return PokemonInfoResponse.fromJson(json);
    } catch (e) {
      print(e);
    }
  }

  //
  // ignore: missing_return
  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    try {
      final response = await client.get(uri);
      final json     = jsonDecode(response.body);
      return PokemonSpeciesInfoResponse.fromJson(json);
    } catch (e) {
      print(e);
    }
  }
}