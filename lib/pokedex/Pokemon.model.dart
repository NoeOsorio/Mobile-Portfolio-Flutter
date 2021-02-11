import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final Color color;
  final Color textColor;
  final Image image;
  final String name;
  final String url;
  final String imageURL;

  Pokemon(this.id, this.color, this.textColor, this.image, this.name, this.url,
      this.imageURL);

  factory Pokemon.fromJson(json) {
    return Pokemon(
        int.tryParse(json["id"]),
        json["color"],
        json["textColor"],
        json["image"],
        nameKebbabCase(json["name"]),
        json["url"],
        json["imageURL"]);
  }

  static String nameKebbabCase(String name) {
    String tmp = name[0].toUpperCase() + name.substring(1);
    return tmp;
  }
}
