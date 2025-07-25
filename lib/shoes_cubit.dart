import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:storeapp/addshoesclass.dart';
import 'package:storeapp/shoes_state.dart';

class ShoesCubit extends Cubit<ShoesState> {
  final Box hive;

  ShoesCubit(this.hive)
    : super(
        ShoesLoad(
          allShoes: [],
          menShoes: [],
          womenShoes: [],
          kidsShoes: [],
          newbornShoes: [],
        ),
      ) {
    loadShoesFromHive();
  }

  void loadShoesFromHive() {
    final hive = Hive.box("data");

    final allData = hive.get("allshoes", defaultValue: []) as List;
    final menData = hive.get("menshoes", defaultValue: []) as List;
    final womenData = hive.get("womenshoes", defaultValue: []) as List;
    final kidsData = hive.get("kidsshoes", defaultValue: []) as List;
    final newbornData = hive.get("newbornshoes", defaultValue: []) as List;

    emit(
      ShoesLoad(
        allShoes: allData.map((e) => Addshoesclass.fromhive(data: e)).toList(),
        menShoes: menData.map((e) => Addshoesclass.fromhive(data: e)).toList(),
        womenShoes:
            womenData.map((e) => Addshoesclass.fromhive(data: e)).toList(),
        kidsShoes:
            kidsData.map((e) => Addshoesclass.fromhive(data: e)).toList(),
        newbornShoes:
            newbornData.map((e) => Addshoesclass.fromhive(data: e)).toList(),
      ),
    );
  }
}
