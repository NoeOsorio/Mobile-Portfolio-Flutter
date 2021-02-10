import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

List pokedata = [
  {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"},
  {"name": "ivysaur", "url": "https://pokeapi.co/api/v2/pokemon/2/"},
  {"name": "venusaur", "url": "https://pokeapi.co/api/v2/pokemon/3/"},
  {"name": "charmander", "url": "https://pokeapi.co/api/v2/pokemon/4/"},
  {"name": "charmeleon", "url": "https://pokeapi.co/api/v2/pokemon/5/"},
  {"name": "charizard", "url": "https://pokeapi.co/api/v2/pokemon/6/"},
  {"name": "squirtle", "url": "https://pokeapi.co/api/v2/pokemon/7/"},
  {"name": "wartortle", "url": "https://pokeapi.co/api/v2/pokemon/8/"},
  {"name": "blastoise", "url": "https://pokeapi.co/api/v2/pokemon/9/"},
  {"name": "caterpie", "url": "https://pokeapi.co/api/v2/pokemon/10/"},
  {"name": "metapod", "url": "https://pokeapi.co/api/v2/pokemon/11/"},
  {"name": "butterfree", "url": "https://pokeapi.co/api/v2/pokemon/12/"},
  {"name": "weedle", "url": "https://pokeapi.co/api/v2/pokemon/13/"},
  {"name": "kakuna", "url": "https://pokeapi.co/api/v2/pokemon/14/"},
  {"name": "beedrill", "url": "https://pokeapi.co/api/v2/pokemon/15/"},
  {"name": "pidgey", "url": "https://pokeapi.co/api/v2/pokemon/16/"},
  {"name": "pidgeotto", "url": "https://pokeapi.co/api/v2/pokemon/17/"},
  {"name": "pidgeot", "url": "https://pokeapi.co/api/v2/pokemon/18/"},
  {"name": "rattata", "url": "https://pokeapi.co/api/v2/pokemon/19/"},
  {"name": "raticate", "url": "https://pokeapi.co/api/v2/pokemon/20/"}
];

Future<List> getPokedata() async {
  List newPokedata = [];
  for (var data in pokedata) {
    String id = getID(data["url"]);
    String imageURL =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
    Image image = Image.network(imageURL);
    List<Color> color = await getImagePalette(NetworkImage(imageURL));

    newPokedata.add({
      "id": id,
      "imageURL": imageURL,
      "image": image,
      "color": color[0],
      "textColor": color[1],
      "name": data["name"]
    });
  }

  return newPokedata;
}

getID(String url) {
  List split = url.split("/");

  return split[split.length - 2];
}

Future<List<Color>> getImagePalette(ImageProvider imageProvider) async {
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(imageProvider);

  return [
    paletteGenerator.dominantColor.color,
    paletteGenerator.dominantColor.color !=
            paletteGenerator.lightVibrantColor.color
        ? paletteGenerator.lightVibrantColor.color
        : Colors.white,
  ];
}
