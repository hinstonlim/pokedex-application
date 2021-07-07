/*
 "count": 1118,
  "next": "https://pokeapi.co/api/v2/pokemon?offset=300&limit=100",
  "previous": "https://pokeapi.co/api/v2/pokemon?offset=100&limit=100",
  "results": [
    {
      "name": "unown",
      "url": "https://pokeapi.co/api/v2/pokemon/201/"
    },
    {
      "name": "wobbuffet",
      "url": "https://pokeapi.co/api/v2/pokemon/202/"
    },
*/

import 'package:flutter/material.dart';

class PokemonListing {

  final int id;
  final String name;

  String get imageUrl =>
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  PokemonListing({@required this.id, @required this.name});

  factory PokemonListing.fromJson(Map<String, dynamic> json) {    //Factory Method defines a method, which should be used for creating objects instead of direct constructor call (new operator)
    final name  = json['name'];                
    final url   = json['url'] as String;  
    final id    = int.parse(url.split('/')[6]);

    return PokemonListing(id: id, name: name);
  }
}

//Breaks up the content passed in from pokemon_repository and return Listings(imageUrl, name, id)
class PokemonPageResponse {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageResponse({@required this.pokemonListings, @required this.canLoadNextPage}); //{} required!!!

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;       //Load next page if there is 'next' exists         
    final pokemonListings = (json['results'] as List)   //Pass results which contain name & URL
      .map((listingJson) => PokemonListing.fromJson(listingJson))   //????
      .toList();

    return PokemonPageResponse(
      pokemonListings: pokemonListings, 
      canLoadNextPage: canLoadNextPage
    );
  }
}