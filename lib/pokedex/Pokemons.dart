import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List pokemonList(String response) {
  final LinkedHashMap parsed = jsonDecode(response);

  print(parsed["results"]);
  // return parsed.
  return parsed["results"] ?? [];
}

Future<http.Response> fetchPokemons() async {
  return http.get(Uri.https("pokeapi.co", "api/v2/pokemon"));
}

class Pokemons extends StatefulWidget {
  @override
  _PokemonsState createState() => _PokemonsState();
}

class _PokemonsState extends State<Pokemons> {
  @override
  void initState() {
    super.initState();

    // fetchPokemons().then((value) => print(value.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemons"),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: fetchPokemons(),
            builder: (context, pokemonSnap) {
              if (pokemonSnap.connectionState == ConnectionState.none ||
                  pokemonSnap.hasData == false) {
                return Text("No pokemon found!");
              }

              // print(pokemonSnap.data.body.results);
              List pokemons = pokemonList(pokemonSnap.data.body);
              return ListView.builder(
                  itemCount: pokemons.length,
                  itemBuilder: (context, index) {
                    var pokemon = pokemons[index];

                    return ListTile(
                      title: Text(pokemon["name"]),
                    );
                  });
            }),
      ),
    );
  }
}
