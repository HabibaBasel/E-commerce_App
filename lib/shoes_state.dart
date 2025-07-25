import 'package:storeapp/addshoesclass.dart';

class ShoesState {}

class addshoescubit extends ShoesState {}

class removeshoescubit extends ShoesState {}

class editshoescubit extends ShoesState {}

class ShoesLoad extends ShoesState {
  List<Addshoesclass> allShoes;
  List<Addshoesclass> menShoes;
  List<Addshoesclass> womenShoes;
  List<Addshoesclass> kidsShoes;
  List<Addshoesclass> newbornShoes;

  ShoesLoad({
    required this.allShoes,
    required this.menShoes,
    required this.womenShoes,
    required this.kidsShoes,
    required this.newbornShoes,
  });
}
