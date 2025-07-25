import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:storeapp/editallshoes.dart';
import 'package:storeapp/editothertypeshoes.dart';
import 'package:storeapp/hivedata.dart';
import 'package:storeapp/shoesdetails.dart';
import 'package:storeapp/shoeslist.dart';
import 'package:storeapp/showtypedetails.dart';

class Newbornshoescard extends StatefulWidget {
  const Newbornshoescard({super.key});

  @override
  State<Newbornshoescard> createState() => _NewbornshoescardState();
}

class _NewbornshoescardState extends State<Newbornshoescard> {
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
        itemCount: newbornshoes.length,
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
                        (context) =>
                            Showtypedetails(sindex: newbornshoes[index]),
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
                          newbornshoes[index].image,
                          height: 100,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          newbornshoes[index].name,
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
                            itemCount: newbornshoes[index].colors.length,
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
                                      newbornshoes[index].colors[index1],
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
                                  "\$${newbornshoes[index].price}",
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
                                        newbornshoes[index].isfavorite =
                                            !newbornshoes[index].isfavorite;
                                        allshoes[allshoes.indexWhere(
                                                  (shoe) =>
                                                      shoe.image ==
                                                      newbornshoes[index].image,
                                                )]
                                                .isfavorite =
                                            newbornshoes[index].isfavorite;
                                        addData(Hive.box("data"));
                                      });
                                    },
                                    icon: Icon(
                                      newbornshoes[index].isfavorite
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
                                                sindex: newbornshoes[index],
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
                                              newbornshoes[index].image,
                                        );

                                        newbornshoes.remove(
                                          newbornshoes[index],
                                        );
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
