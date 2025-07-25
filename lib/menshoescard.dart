import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:storeapp/addshoesclass.dart';
import 'package:storeapp/editallshoes.dart';
import 'package:storeapp/editothertypeshoes.dart';
import 'package:storeapp/hivedata.dart';
import 'package:storeapp/shoesdetails.dart';
import 'package:storeapp/showtypedetails.dart';
import 'shoeslist.dart';

class Menshoescard extends StatefulWidget {
  const Menshoescard({super.key});

  @override
  State<Menshoescard> createState() => _MenshoescardState();
}

class _MenshoescardState extends State<Menshoescard> {
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
        itemCount: menshoes.length,
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
                final updatedIndex = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => Showtypedetails(sindex: menshoes[index]),
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
                          horizontal: 8,
                          vertical: 3,
                        ),
                        child: Image.network(
                          menshoes[index].image,
                          height: 90,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          menshoes[index].name,
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
                            itemCount: menshoes[index].colors.length,
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
                                      menshoes[index].colors[index1],
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
                                  "\$${menshoes[index].price}",
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
                                        menshoes[index].isfavorite =
                                            !menshoes[index].isfavorite;
                                        allshoes[allshoes.indexWhere(
                                                  (shoe) =>
                                                      shoe.image ==
                                                      menshoes[index].image,
                                                )]
                                                .isfavorite =
                                            menshoes[index].isfavorite;
                                        addData(Hive.box("data"));
                                      });
                                    },
                                    icon: Icon(
                                      menshoes[index].isfavorite
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
                                                sindex: menshoes[index],
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
                                              menshoes[index].image,
                                        );

                                        menshoes.remove(menshoes[index]);
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
