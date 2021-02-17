import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "#30DaysOfFlutter",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w900,
                      fontSize: 24),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    CustomButton(
                        route: "/day1", title: "Day 1", subtitle: "Login Page"),
                    CustomButton(
                        route: "/day2",
                        title: "Day 2",
                        subtitle: "Animation Widget"),
                    CustomButton(title: "Day 3", subtitle: "Home Page"),
                    CustomButton(
                      title: "Day 4",
                      subtitle: "Pokemons",
                      route: "/day4",
                    ),
                    CustomButton(
                      title: "Day 8",
                      subtitle: "Pokedex",
                      route: "/pokedex",
                    ),
                    CustomButton(
                      title: "Day 14",
                      subtitle: "Draw",
                      route: "/day14",
                    ),
                    CustomButton(
                      title: "Day 15",
                      subtitle: "Image Loader",
                      route: "/day15",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final String route;
  final String title;
  final String subtitle;

  const CustomButton(
      {Key key, this.route, @required this.title, @required this.subtitle})
      : super(key: key);
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Color buttonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          Navigator.of(context, rootNavigator: true).pushNamed(widget.route);
        }
        setState(() {
          buttonColor = Colors.blue;
        });
        Timer(Duration(milliseconds: 200), () {
          setState(() {
            buttonColor = Colors.white;
          });
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            duration: Duration(milliseconds: 400),
            decoration: BoxDecoration(
              // color: buttonColor,
              color: buttonColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                    // style: Theme.of(context).textTheme.button,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    // margin: EdgeInsets.all(10),
                    child: Text(
                      widget.subtitle,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      // style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.arrow_right_rounded,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
