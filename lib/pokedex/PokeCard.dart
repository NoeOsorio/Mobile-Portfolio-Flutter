import 'package:flutter/material.dart';
import 'package:mobile_portfolio/pokedex/PokemonData.dart';

class PokeCard extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Image image;
  final String name;
  final String url;

  const PokeCard(
      {Key key, this.color, this.textColor, this.image, this.name, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PokemonData(
                  color: color,
                  textColor: textColor,
                  image: image,
                  name: name,
                  url: url,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: [
            image,
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: textColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
