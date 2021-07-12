import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokedex.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonDetail extends StatefulWidget {
  Pokemon? pokemon;

  PokemonDetail({this.pokemon});

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  PaletteGenerator? paletteGenerator;
  Color baskinRenk = Colors.transparent;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baskinRengiBul();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
        PaletteGenerator.fromImageProvider(NetworkImage(widget.pokemon!.img!));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      debugPrint(
          "secilen renk :" + paletteGenerator!.dominantColor!.color.toString());

      setState(() {
        baskinRenk = paletteGenerator!.vibrantColor!.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baskinRenk,
      appBar: AppBar(
        backgroundColor: baskinRenk,
        elevation: 0,
        title: Text(
          widget.pokemon!.name!,
          textAlign: TextAlign.center,
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return dikeyBody(context);
          } else {
            return yatayBody(context);
          }
        },
      ),
    );
  }

  Widget yatayBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: MediaQuery.of(context).size.height * (3 / 4),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: widget.pokemon!.img!,
              child: Container(
                width: 200,
                child: Image.network(widget.pokemon!.img!, fit: BoxFit.fill),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50),
                  Text(
                    widget.pokemon!.name!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height : " + widget.pokemon!.height!,
                  ),
                  Text(
                    "Weight : " + widget.pokemon!.weight!,
                  ),
                  Text(
                    "Type",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon!.type!
                        .map((tip) => Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),
                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon!.prevEvolution != null
                        ? widget.pokemon!.prevEvolution!
                            .map((pre) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  pre.name!,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("Son Hali")],
                  ),
                  Text(
                    "Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon!.nextEvolution != null
                        ? widget.pokemon!.nextEvolution!
                            .map((evolution) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  evolution.name!,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("Son Hali")],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon!.weaknesses != null
                        ? widget.pokemon!.weaknesses!
                            .map((weakness) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  weakness,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("Son Hali")],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Stack dikeyBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height * (7 / 10),
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.02,
          child: Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 50),
                Text(
                  widget.pokemon!.name!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Height : " + widget.pokemon!.height!,
                ),
                Text(
                  "Weight : " + widget.pokemon!.weight!,
                ),
                Text(
                  "Type",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon!.type!
                      .map((tip) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            tip,
                            style: TextStyle(color: Colors.white),
                          )))
                      .toList(),
                ),
                Text(
                  "Pre Evolution",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon!.prevEvolution != null
                      ? widget.pokemon!.prevEvolution!
                          .map((pre) => Chip(
                              backgroundColor: Colors.deepOrange.shade300,
                              label: Text(
                                pre.name!,
                                style: TextStyle(color: Colors.white),
                              )))
                          .toList()
                      : [Text("Son Hali")],
                ),
                Text(
                  "Next Evolution",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon!.nextEvolution != null
                      ? widget.pokemon!.nextEvolution!
                          .map((evolution) => Chip(
                              backgroundColor: Colors.deepOrange.shade300,
                              label: Text(
                                evolution.name!,
                                style: TextStyle(color: Colors.white),
                              )))
                          .toList()
                      : [Text("Son Hali")],
                ),
                Text(
                  "Weakness",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon!.weaknesses != null
                      ? widget.pokemon!.weaknesses!
                          .map((weakness) => Chip(
                              backgroundColor: Colors.deepOrange.shade300,
                              label: Text(
                                weakness,
                                style: TextStyle(color: Colors.white),
                              )))
                          .toList()
                      : [Text("Son Hali")],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: widget.pokemon!.img!,
            child: Container(
              width: 150,
              height: 150,
              child: Image.network(widget.pokemon!.img!, fit: BoxFit.contain),
            ),
          ),
        )
      ],
    );
  }
}
