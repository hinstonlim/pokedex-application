import 'package:flutter/material.dart';

abstract class PokemonEvent {}

//Currently there is only one event required to be implemented
class PokemonPageRequest extends PokemonEvent { 
  final int page;

  PokemonPageRequest({@required this.page}); 
}