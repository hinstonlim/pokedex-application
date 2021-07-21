import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_application/bloc/pokemon_details_cubit.dart';
import 'package:pokedex_application/data/pokemon_details.dart';

class PokemonDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TESTINGGGGGGGGGGG Details',
          style: TextStyle(
            fontSize: 20,
            color: Colors.blueAccent,
          ),
        ),
      ),
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetails>(
        builder: (context, details) {
          return details != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      // flex: 2,
                      child: Card(
                        color: Colors.red[50],
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(20),
                            //   child: Column(
                            //     children: [
                            //       Container(
                            //         decoration: BoxDecoration(
                            //           border: Border.all(
                            //             color: Colors.deepOrange[900],
                            //             width: 4,
                            //           )
                            //         ),
                            //         child: Image.network(
                            //           details.imageUrl,
                            //           scale: 0.5,
                            //           fit: BoxFit.cover,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: 
                              SizedBox(
                                width: 250, 
                                child: Card(
                                  color: Colors.pink[50],
                                  child: Padding(
                                    padding: EdgeInsets.all(9),
                                    child: Image.network(
                                      details.imageUrl,
                                      scale: 0.6,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              details.name.toUpperCase()[0] + details.name.substring(1),
                              style: TextStyle(
                                fontFamily: 'Times New Roman',
                                fontSize: 35,
                                fontWeight: FontWeight.bold
                              ), 
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: details.types
                                .map((type) => _pokemonTypeView(type))
                                .toList(),
                              ),
                            ),
                            Text(
                              'ID: ${details.id}  -  Weight: ${details.weight}  -  Height: ${details.height}'
                            ),
                            Padding(
                              padding: const EdgeInsets.all(40),
                              child: SizedBox(
                                width: 250, 
                                child: Card(
                                  color: Colors.red[100],
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      details.description,
                                      textAlign: TextAlign.center, 
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: SizedBox(
                    //     width: double.infinity, 
                    //     child: Card(
                    //       color: Colors.lightBlue[100],
                    //       child: Padding(
                    //         padding: EdgeInsets.all(8),
                    //         child: Text(
                    //           details.description,
                    //           textAlign: TextAlign.center, 
                    //         ),
                    //       ),
                    //     ),
                    //   )
                    // )
                  ],
                ),
              )
            )
          : Center(
            child: CircularProgressIndicator(),
          );
        }
      )
    );
  }
  Widget _pokemonTypeView(String type) {
    Color color;

    switch (type) {
      case 'normal':
        color = Color(0xFFbdbeb0);
        break;
      case 'poison':
        color = Color(0xFF995E98);
        break;
      case 'psychic':
        color = Color(0xFFE96EB0);
        break;
      case 'grass':
        color = Color(0xFF9CD363);
        break;
      case 'ground':
        color = Color(0xFFE3C969);
        break;
      case 'ice':
        color = Color(0xFFAFF4FD);
        break;
      case 'fire':
        color = Color(0xFFE7614D);
        break;
      case 'rock':
        color = Color(0xFFCBBD7C);
        break;
      case 'dragon':
        color = Color(0xFF8475F7);
        break;
      case 'water':
        color = Color(0xFF6DACF8);
        break;
      case 'bug':
        color = Color(0xFFC5D24A);
        break;
      case 'dark':
        color = Color(0xFF886958);
        break;
      case 'fighting':
        color = Color(0xFF9E5A4A);
        break;
      case 'ghost':
        color = Color(0xFF7774CF);
        break;
      case 'steel':
        color = Color(0xFFC3C3D9);
        break;
      case 'flying':
        color = Color(0xFF81A2F8);
        break;
      case 'normal':
        color = Color(0xFFF9E65E);
        break;
      case 'fairy':
        color = Color(0xFFEEB0FA);
        break;
      default:
        color = Colors.black;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Text(
          type.toUpperCase(),
          style: TextStyle(
            fontSize: 15,
            color: Colors.white, 
            fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}