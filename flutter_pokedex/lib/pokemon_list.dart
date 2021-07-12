import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokedex.dart';
import 'package:flutter_pokedex/pokemon_detail.dart';
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
  Future<PokeDex>? veri;

  Future<PokeDex> pokemonlariGetir() async {
    var response = await http.get(Uri.parse(url));
    var decodedJson = json.decode(response.body);
    pokedex = PokeDex.fromJson(decodedJson);
    return pokedex!;
  }

  @override
  void initState() {
    super.initState();
    veri = pokemonlariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: FutureBuilder(
          future: veri,
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
                children: snapshot.data!.pokemon!.map((poke) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PokemonDetail(
                                pokemon: poke,
                              )));
                    },
                    child: Hero(
                      tag: poke.img!,
                      child: Card(
                        elevation: 6,
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: FadeInImage.assetNetwork(
                                  placeholder: "assets/images/loading.gif",
                                  image: poke.img!),
                            ),
                            Text(
                              poke.name!,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
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
