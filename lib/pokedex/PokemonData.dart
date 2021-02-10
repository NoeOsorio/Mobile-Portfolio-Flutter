import 'package:flutter/material.dart';

class PokemonData extends StatefulWidget {
  final Color color;
  final Color textColor;
  final Image image;
  final String name;
  final String url;

  const PokemonData(
      {Key key,
      @required this.url,
      @required this.color,
      @required this.textColor,
      @required this.image,
      @required this.name})
      : super(key: key);
  @override
  _PokemonDataState createState() => _PokemonDataState();
}

class _PokemonDataState extends State<PokemonData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(color: widget.color),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
            ),
            Positioned(
              child: widget.image,
              bottom: MediaQuery.of(context).size.height / 2 - 50,
            )
          ],
        ),
      ),
    );
  }
}
