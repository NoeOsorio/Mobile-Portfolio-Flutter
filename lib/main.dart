import 'package:flutter/material.dart';
import 'package:mobile_portfolio/Home.dart';
import 'package:mobile_portfolio/day1/Login.dart';
import 'package:mobile_portfolio/day14/Draw.dart';
import 'package:mobile_portfolio/day2/Animations.dart';
import 'package:mobile_portfolio/pokedex/PokedexUI.dart';
import 'package:mobile_portfolio/pokedex/Pokemons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              button:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          buttonColor: Colors.blue),
      initialRoute: "/day1",
      routes: {
        "/day2": (context) => AnimatedBox(),
        "/day3": (context) => Home(),
        "/day1": (context) => LoginPage(),
        "/day4": (context) => Pokemons(),
        "/pokedex": (context) => PokedexUI(),
        "/day14": (context) => Draw(),
      },
      // home: LoginPage(),
    );
  }
}
