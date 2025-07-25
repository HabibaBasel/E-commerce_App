import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:storeapp/addshoes.dart';
import 'package:storeapp/addshoesclass.dart';
import 'package:storeapp/allshoescard.dart';
import 'package:storeapp/hivedata.dart';
import 'package:storeapp/kidsshoescard.dart';
import 'package:storeapp/menshoescard.dart';
import 'package:storeapp/newbornshoescard.dart';
import 'package:storeapp/shoeslist.dart';
import 'package:storeapp/womenshoescard.dart';

class ShoeStoreScreen extends StatefulWidget {
  @override
  State<ShoeStoreScreen> createState() => _ShoeStoreScreenState();
}

class _ShoeStoreScreenState extends State<ShoeStoreScreen> {
  final hive = Hive.box("data");

  @override
  void initState() {
    var allhivedata = hive.get("allshoes");
    var menhivedata = hive.get("menshoes");
    var womenhivedata = hive.get("womenshoes");
    var kidshivedata = hive.get("kidsshoes");
    var newbornhivedata = hive.get("newbornshoes");

    List allData = [];
    List menData = [];
    List womenData = [];
    List kidsData = [];
    List newbornData = [];

    for (var shoes in allData) {
      allshoes.add(Addshoesclass.fromhive(data: shoes));
    }

    for (var shoes in menData) {
      menshoes.add(Addshoesclass.fromhive(data: shoes));
    }

    for (var shoes in womenData) {
      womenshoes.add(Addshoesclass.fromhive(data: shoes));
    }

    for (var shoes in kidsData) {
      kidsshoes.add(Addshoesclass.fromhive(data: shoes));
    }

    for (var shoes in newbornData) {
      newbornshoes.add(Addshoesclass.fromhive(data: shoes));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey();

    return DefaultTabController(
      length: 5,

      child: Form(
        key: formkey,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search shoes...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            automaticallyImplyLeading: true,
            leadingWidth: 30,
            iconTheme: IconThemeData(color: Colors.white, size: 26),
            backgroundColor: Colors.black,
            bottom: TabBar(
              indicatorColor: Color.fromARGB(255, 0, 73, 145),
              tabAlignment: TabAlignment.start,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: [
                Tab(text: "All Shoes"),
                Tab(text: "Men Shoes"),
                Tab(text: "Women Shoes"),
                Tab(text: "Kids Shoes"),
                Tab(text: "Newborn Shoes"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Allshoescard(),
              Menshoescard(),
              Womenshoescard(),
              Kidsshoescard(),
              Newbornshoescard(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Add Item',
            mini: true,
            backgroundColor: Color(0xFF003365),
            foregroundColor: Colors.white,
            onPressed: () async {
              if (formkey.currentState!.validate()) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Addshoes()),
                );
              }
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
