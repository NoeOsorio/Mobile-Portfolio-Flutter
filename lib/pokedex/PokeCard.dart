import 'package:flutter/material.dart';
import 'package:mobile_portfolio/pokedex/PokemonData.dart';

import 'Pokemon.model.dart';

class PokeCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokeCard({Key key, this.pokemon}) : super(key: key);

  @override
  _PokeCardState createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PokemonData(pokemon: widget.pokemon)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: widget.pokemon.color,
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: widget.pokemon.image,
            ),
            Expanded(
              flex: 1,
              child: Text(
                widget.pokemon.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: widget.pokemon.textColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
