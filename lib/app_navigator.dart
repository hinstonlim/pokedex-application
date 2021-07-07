import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_application/bloc/nav_cubit.dart';
import 'package:pokedex_application/ui/pokemon_main_view.dart';
import 'package:pokedex_application/ui/pokemon_details_view.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(builder: (context, pokemonId) {
      return Navigator(
        pages: [      //Navigate nbtw pages
          MaterialPage(child: PokedexView()),
          
          if (pokemonId != null)
            MaterialPage(child: PokemonDetailsView())
        ],
        onPopPage: (route, result) {    //Execute when back button tapped
          BlocProvider.of<NavCubit>(context).backToPokedex();
          return route.didPop(result);
        },
      );
    });
  }
}