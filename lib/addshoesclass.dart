import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Addshoesclass {
  late String name;
  late String description;
  late String price;
  late String category;
  late List<String> size;
  late List<Color> colors;
  late String image;
  bool isfavorite = false;

  Addshoesclass({
    required String name,
    required String description,
    required String price,
    required String category,
    required List<String> size,
    required List<Color> colors,
    required String image,
    required bool isfavorite,
  }) {
    this.name = name;
    this.description = description;
    this.price = price;
    this.category = category;
    this.size = size;
    this.colors = colors;
    this.image = image;
  }

  Addshoesclass.fromhive({required Map data}) {
    name = data["name"];
    description = data["description"];
    price = data["price"];
    category = data["category"];
    size = data["size"];
    colors =
        (data["colors"] as List).map((e) {
          if (e is int) {
            return Color(e);
          } else if (e is Color) {
            return e;
          } else {
            return Colors.transparent;
          }
        }).toList();
    image = data["image"];
    isfavorite = data["isfavorite"] ?? false;
  }
}
