import 'package:flutter/material.dart';
import 'package:storeapp/addshoesclass.dart';
import 'package:storeapp/editallshoes.dart';
import 'package:storeapp/shoeslist.dart';

class Showtypedetails extends StatefulWidget {
  final Addshoesclass sindex;
  const Showtypedetails({super.key, required this.sindex});

  @override
  State<Showtypedetails> createState() => _ShoesDetailsState();
}

class _ShoesDetailsState extends State<Showtypedetails> {
  int cartCount = 0;

  @override
  Widget build(BuildContext context) {
    final shoe = widget.sindex;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Athletic Shoes',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                "https://static.vecteezy.com/system/resources/previews/017/791/921/non_2x/sneaker-shoe-neon-glow-icon-illustration-vector.jpg",
              ),
              backgroundColor: Colors.black,
            ),
          ),
        ],
        automaticallyImplyLeading: true,
        leadingWidth: 25,
        iconTheme: IconThemeData(color: Colors.white, size: 25),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shoe.name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Center(child: Image.network(shoe.image, fit: BoxFit.fitHeight)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price: \$${shoe.price}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Expanded(child: SizedBox()),
                IconButton(
                  icon: Icon(
                    shoe.isfavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      shoe.isfavorite = !shoe.isfavorite;

                      if (shoe.category == "men") {
                        menshoes[menshoes.indexWhere(
                              (shoes) => shoes.image == shoe.image,
                            )]
                            .isfavorite = shoe.isfavorite;
                      } else if (shoe.category == "women") {
                        womenshoes[womenshoes.indexWhere(
                              (shoes) => shoes.image == shoe.image,
                            )]
                            .isfavorite = shoe.isfavorite;
                      } else if (shoe.category == "kids") {
                        kidsshoes[kidsshoes.indexWhere(
                              (shoes) => shoes.image == shoe.image,
                            )]
                            .isfavorite = shoe.isfavorite;
                      } else if (shoe.category == "newborn") {
                        newbornshoes[newbornshoes.indexWhere(
                              (shoes) => shoes.image == shoe.image,
                            )]
                            .isfavorite = shoe.isfavorite;
                      }
                      allshoes[allshoes.indexWhere(
                            (shoes) => shoes.image == shoe.image,
                          )]
                          .isfavorite = shoe.isfavorite;
                    });
                  },
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "Available Sizes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children:
                  shoe.size
                      .map(
                        (size) => Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Chip(
                            backgroundColor: Colors.grey.shade100,
                            label: Text(size, style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      )
                      .toList(),
            ),

            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.info, color: Colors.blueAccent, size: 24),
                SizedBox(width: 8),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),

              child: Text(
                shoe.description,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ),

            SizedBox(height: 15),
            Text(
              "Shoes Colors",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children:
                  shoe.colors
                      .map(
                        (color) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                        ),
                      )
                      .toList(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.delete, size: 28, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      if (shoe.category == 'men') {
                        menshoes.removeWhere(
                          (element) => element.image == shoe.image,
                        );
                      }
                      if (shoe.category == 'women') {
                        womenshoes.removeWhere(
                          (element) => element.image == shoe.image,
                        );
                      }
                      if (shoe.category == 'kids') {
                        kidsshoes.removeWhere(
                          (element) => element.image == shoe.image,
                        );
                      } else {
                        newbornshoes.removeWhere(
                          (element) => element.image == shoe.image,
                        );
                      }
                      allshoes.removeWhere(
                        (element) => element.image == widget.sindex.image,
                      );
                    });

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart, color: Colors.blue, size: 22),
                    Text(
                      "$cartCount",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      cartCount++;
                    });
                  },

                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
