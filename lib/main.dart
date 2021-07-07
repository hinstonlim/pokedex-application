import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_application/app_navigator.dart';
import 'package:pokedex_application/bloc/nav_cubit.dart';
import 'package:pokedex_application/bloc/pokemon_bloc.dart';
import 'package:pokedex_application/bloc/pokemon_details_cubit.dart';
import 'package:pokedex_application/bloc/pokemon_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final pokemonDetailsCubit = PokemonDetailsCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red[500],
        scaffoldBackgroundColor: Colors.orange[50],
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>  
              PokemonBloc()..add(PokemonPageRequest(page: 0))
          ),
          BlocProvider(
            create: (context) => 
              NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)
          ),
          BlocProvider(
            create: (context) =>
            pokemonDetailsCubit
          ),
        ], 
        child: AppNavigator()
      ),
    );
  }
}