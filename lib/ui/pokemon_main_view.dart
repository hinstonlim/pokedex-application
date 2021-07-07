import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_application/bloc/nav_cubit.dart';
import 'package:pokedex_application/bloc/pokemon_bloc.dart';
import 'package:pokedex_application/bloc/pokemon_state.dart';

class PokedexView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Pokedex',
          style: TextStyle(
            fontSize: 20
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {

          if (state is PokemonLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),   //Loading widget
            );

          } else if (state is PokemonPageLoadSuccess) {
            return GridView.builder(
              gridDelegate: 
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: state.pokemonListings.length,  //Dynamic count
              itemBuilder: (context, index) {     //A scrollable 2d array of widget
                return GestureDetector(
                  onTap: () => BlocProvider.of<NavCubit>(context).
                    showPokemonDetails(state.pokemonListings[index].id),
                  child: Card(  //Card UI
                    // child: ListTile(
                    //   title: Image.network(state.pokemonListings[index].imageUrl),
                    //   subtitle: Text(state.pokemonListings[index].name),
                    // )
                    color: Colors.red[50],
                    child: GridTile(  //Grid View
                      child: Column(  //Listing shown horizontally
                        children: [
                          Image.network(state.pokemonListings[index].imageUrl),    //Image Preview
                          Text(state.pokemonListings[index].name.toUpperCase()[0] + state.pokemonListings[index].name.substring(1))   //Pokemon Name
                        ],
                      ),
                    ),
                  ),
                );
              },
            );

          } else if (state is PokemonPageLoadFailed) {
            return Center(  //Error mssg
              child: Text(state.error.toString()),
            );

          } else {
              return Container();
          }
        }
      )
    );
  }
}