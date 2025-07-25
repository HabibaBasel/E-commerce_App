import 'dart:ui';

import 'package:storeapp/addshoesclass.dart';
import 'package:storeapp/shoeslist.dart';
import 'package:hive_ce/hive.dart';

void addData(Box hive) {
  List allhive = [];
  List menhive = [];
  List womenhive = [];
  List kidshive = [];
  List newbornhive = [];

  List<int> convertColors(List<Color> colors) {
    return colors.map((color) => color.value).toList();
  }

  for (var shoes in allshoes) {
    print(shoes.colors.map((c) => c.value).toList());
    allhive.add({
      "name": shoes.name,
      "description": shoes.description,
      "price": shoes.price,
      "category": shoes.category,
      "size": shoes.size,
      "colors": convertColors(shoes.colors),
      "image": shoes.image,
      "isfavorite": shoes.isfavorite,
    });
  }

  for (var shoes in menshoes) {
    menhive.add({
      "name": shoes.name,
      "description": shoes.description,
      "price": shoes.price,
      "category": shoes.category,
      "size": shoes.size,
      "colors": convertColors(shoes.colors),
      "image": shoes.image,
      "isfavorite": shoes.isfavorite,
    });
  }

  for (var shoes in womenshoes) {
    womenhive.add({
      "name": shoes.name,
      "description": shoes.description,
      "price": shoes.price,
      "category": shoes.category,
      "size": shoes.size,
      "colors": convertColors(shoes.colors),
      "image": shoes.image,
      "isfavorite": shoes.isfavorite,
    });
  }

  for (var shoes in kidsshoes) {
    kidshive.add({
      "name": shoes.name,
      "description": shoes.description,
      "price": shoes.price,
      "category": shoes.category,
      "size": shoes.size,
      "colors": convertColors(shoes.colors),
      "image": shoes.image,
      "isfavorite": shoes.isfavorite,
    });
  }

  for (var shoes in newbornshoes) {
    newbornhive.add({
      "name": shoes.name,
      "description": shoes.description,
      "price": shoes.price,
      "category": shoes.category,
      "size": shoes.size,
      "colors": convertColors(shoes.colors),
      "image": shoes.image,
      "isfavorite": shoes.isfavorite,
    });
  }

  hive.put("allshoes", allhive);
  hive.put("menshoes", menhive);
  hive.put("womenshoes", womenhive);
  hive.put("kidsshoes", kidshive);
  hive.put("newbornshoes", newbornhive);
}
