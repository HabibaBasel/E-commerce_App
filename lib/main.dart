import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:storeapp/login.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("data");
  runApp(store());
}

class store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Login());
  }
}
