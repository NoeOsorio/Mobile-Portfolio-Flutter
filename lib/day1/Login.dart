// https://dribbble.com/shots/14725890-Pet-App?utm_source=Clipboard_Shot&utm_campaign=sajon007&utm_content=Pet%20App&utm_medium=Social_Share
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  final String logo = 'assets/images/logo.svg';
  final String hero = 'assets/images/undraw_flutter_dev_wvqj.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // <div>Iconos diseñados por <a href="https://www.flaticon.es/autores/photo3idea-studio" title="photo3idea_studio">photo3idea_studio</a> from <a href="https://www.flaticon.es/" title="Flaticon">www.flaticon.es</a></div>
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      logo,
                      semanticsLabel: "Noe Osorio",
                      width: 100,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Noe Osorio",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontSize: 24),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Flutter Developer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                  ],
                )),
                Container(
                    child: SvgPicture.asset(
                  hero,
                  width: 300,
                  fit: BoxFit.fitWidth,
                )),
                Container(
                    child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Button");
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFFFF9C4),
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                  spreadRadius: 5)
                            ],
                            color: Color(0xFFFFEB3B),
                            borderRadius: BorderRadius.circular(25)),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "#30DaysOfFlutter",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontSize: 24),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Discover the magic of Flutter by yourself",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ],
                )),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    loginButton(false),
                    loginButton(true),
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}

Widget loginButton(bool login) {
  return GestureDetector(
    onTap: () {
      if (login) {
        print("login");
      } else {
        print("signup");
      }
    },
    child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
      decoration: login
          ? BoxDecoration(
              boxShadow: [
                  BoxShadow(
                      color: Color(0xFFE3F2FD),
                      offset: Offset(0, 0),
                      blurRadius: 30,
                      spreadRadius: 2)
                ],
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  stops: [.2, .9],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xFF64B5F6), Color(0xFF2196F3)]))
          : BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(0xFFE3F2FD),
                  offset: Offset(0, 0),
                  blurRadius: 30,
                  spreadRadius: 2)
            ], borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Text(
        login ? "Log In" : "Sign Up",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: login ? Colors.white : Color(0xFF2196F3)),
      ),
    ),
  );
}
