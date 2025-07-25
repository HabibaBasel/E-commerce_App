import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:storeapp/addshoesclass.dart';
import 'package:storeapp/editallshoes.dart';
import 'package:storeapp/editothertypeshoes.dart';
import 'package:storeapp/hivedata.dart';
import 'package:storeapp/shoesdetails.dart';
import 'package:storeapp/showtypedetails.dart';
import 'shoeslist.dart';

class Womenshoescard extends StatefulWidget {
  const Womenshoescard({super.key});

  @override
  State<Womenshoescard> createState() => _WomenshoescardState();
}

class _WomenshoescardState extends State<Womenshoescard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 5,
          mainAxisExtent: 215,
        ),
        itemCount: womenshoes.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  const Color.fromARGB(255, 172, 169, 169),

                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),

            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => Showtypedetails(sindex: womenshoes[index]),
                  ),
                );

                setState(() {});
              },
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 3,
                        ),
                        child: Image.network(
                          womenshoes[index].image,
                          height: 80,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          womenshoes[index].name,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          height: 2 * 7.3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: womenshoes[index].colors.length,
                            itemBuilder: (context, index1) {
                              return Container(
                                margin: EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 0.3,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor:
                                      womenshoes[index].colors[index1],
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 5),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Color.fromARGB(255, 198, 196, 196),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "\$${womenshoes[index].price}",
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  softWrap: false,
                                ),
                                SizedBox(width: 11),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        womenshoes[index].isfavorite =
                                            !womenshoes[index].isfavorite;
                                        allshoes[allshoes.indexWhere(
                                                  (shoe) =>
                                                      shoe.image ==
                                                      womenshoes[index].image,
                                                )]
                                                .isfavorite =
                                            womenshoes[index].isfavorite;
                                        addData(Hive.box("data"));
                                      });
                                    },
                                    icon: Icon(
                                      womenshoes[index].isfavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      size: 16,
                                    ),
                                    color: Colors.red,
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => Editothertypeshoes(
                                                sindex: womenshoes[index],
                                              ),
                                        ),
                                      );

                                      setState(() {});
                                      addData(Hive.box("data"));
                                    },
                                    icon: Icon(Icons.edit, size: 16),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        allshoes.removeWhere(
                                          (element) =>
                                              element.image ==
                                              womenshoes[index].image,
                                        );

                                        womenshoes.remove(womenshoes[index]);
                                        addData(Hive.box("data"));
                                      });
                                    },
                                    icon: Icon(Icons.delete, size: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
