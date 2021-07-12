import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokedex.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonList extends StatefulWidget {
  PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  PokeDex? pokedex;

  Future<PokeDex> pokemonlariGetir() async {
    var response = await http.get(Uri.parse(url));
    var decodedJson = json.decode(response.body);
    pokedex = PokeDex.fromJson(decodedJson);
    return pokedex!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: FutureBuilder(
          future: pokemonlariGetir(),
          builder: (BuildContext context, AsyncSnapshot<PokeDex> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              /* return snapshot.data == null
                  ? Text("data")
                  : GridView.builder(
                      itemCount: snapshot.data!.pokemon!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Center(
                            child: Text(snapshot.data!.pokemon![index].name
                                .toString()));
                      },
                    ); */
              return GridView.count(
                crossAxisCount: 2,
                children: snapshot.data!.pokemon!.map((gelen) {
                  return Text(gelen.name!);
                }).toList(),
              );
            } else {
              return Container(
                child: Text("data"),
              );
            }
          }),
    );
  }
}
