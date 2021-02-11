import 'package:flutter/material.dart';
import 'package:mobile_portfolio/pokedex/PokeCard.dart';
import 'package:mobile_portfolio/pokedex/pokedata.dart';
import 'package:palette_generator/palette_generator.dart';

import 'Pokemon.model.dart';

class PokedexUI extends StatefulWidget {
  @override
  _PokedexUIState createState() => _PokedexUIState();
}

class _PokedexUIState extends State<PokedexUI> {
  getID(String url) {
    List split = url.split("/");
    return split[split.length - 2];
  }

  Future<Color> getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor.color;
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Pokedex",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: getPokedata(),
        builder: (context, pokemonSnap) {
          if (pokemonSnap.connectionState == ConnectionState.none ||
              pokemonSnap.hasData == false) {
            return Text("No pokemon found!");
          }
          return GridView.builder(
            itemCount: pokemonSnap.data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
            itemBuilder: (BuildContext context, int index) {
              return PokeCard(
                pokemon: Pokemon.fromJson(pokemonSnap.data[index]),
                // color: pokemonSnap.data[index]["color"],
                // name: pokemonSnap.data[index]["name"],
                // image: pokemonSnap.data[index]["image"],
                // textColor: pokemonSnap.data[index]["textColor"],
              );
            },
          );
        },
      )),
    );
  }
}
