import 'package:flutter/material.dart';
import 'package:storeapp/addshoesclass.dart';
import 'package:storeapp/colorslistview.dart';
import 'package:storeapp/shoeslist.dart';

class Editshoes extends StatefulWidget {
  final Addshoesclass sindex;
  Editshoes({super.key, required this.sindex});

  @override
  State<Editshoes> createState() => _EditshoesState();
}

class _EditshoesState extends State<Editshoes> {
  final GlobalKey<FormState> formkey = GlobalKey();

  TextEditingController name = TextEditingController();

  TextEditingController description = TextEditingController();

  String? category;

  TextEditingController price = TextEditingController();

  TextEditingController imagecontroller = TextEditingController();

  List<String> selectedSizes = [];

  List<Color> selectedColors = [];
  late Addshoesclass shoeindex;
  @override
  void initState() {
    super.initState();
    shoeindex = widget.sindex;

    name.text = shoeindex.name;
    description.text = shoeindex.description;
    category = shoeindex.category;
    price.text = shoeindex.price;
    imagecontroller.text = shoeindex.image;
    selectedSizes = List.from(shoeindex.size);
    selectedColors = List.from(shoeindex.colors);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(shoeindex);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Editing Item',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
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
        leadingWidth: 35,
        iconTheme: IconThemeData(color: Colors.white, size: 28),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: name,

                  decoration: InputDecoration(
                    labelText: "Shoes Name",
                    labelStyle: TextStyle(color: Colors.white),
                    errorStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 8, 101, 145),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),

                  controller: description,
                  decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: TextStyle(color: Colors.white),
                    errorStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 8, 101, 145),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: DropdownButtonFormField<String>(
                  hint: Text("Select Category"),
                  dropdownColor: Colors.black,
                  focusColor: Colors.blueGrey,
                  value: category,
                  items: [
                    DropdownMenuItem(child: Text("Men"), value: "men"),
                    DropdownMenuItem(child: Text("Women"), value: "women"),
                    DropdownMenuItem(child: Text("Kids"), value: "kids"),
                    DropdownMenuItem(child: Text("Newborn"), value: "newborn"),
                  ],
                  onChanged: (String? newvalue) {
                    setState(() {
                      category = newvalue;
                    });
                  },

                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Select Category",
                    labelStyle: TextStyle(color: Colors.white),
                    errorStyle: TextStyle(color: Colors.white),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 8, 101, 145),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () async {
                    List<String>? result = await showDialog<List<String>>(
                      context: context,
                      builder: (BuildContext context) {
                        return MultiSelectDialog(selectedSizes);
                      },
                    );
                    if (result != null) {
                      setState(() {
                        selectedSizes = result;
                      });
                    }
                  },
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 45,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        selectedSizes.isEmpty
                            ? "Select Sizes"
                            : selectedSizes.join(', '),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),

                  controller: price,
                  decoration: InputDecoration(
                    labelText: "Price",
                    labelStyle: TextStyle(color: Colors.white),
                    errorStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 8, 101, 145),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),

                  controller: imagecontroller,
                  decoration: InputDecoration(
                    hintText: "*********.png",
                    labelText: "Image URL",
                    labelStyle: TextStyle(color: Colors.white),
                    errorStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 8, 101, 145),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Colorslistview(
                  selectedcolors: shoeindex.colors,
                  key: ValueKey(shoeindex),
                  onColorSelected: (colors) {
                    setState(() {
                      selectedColors = List.from(colors);
                    });
                  },
                ),
              ),

              SizedBox(height: 30),

              MaterialButton(
                onPressed: () {
                  setState(() {
                    shoeindex = Addshoesclass(
                      name: name.text.isNotEmpty ? name.text : shoeindex.name,
                      description:
                          description.text.isNotEmpty
                              ? description.text
                              : shoeindex.description,
                      price:
                          price.text.isNotEmpty ? price.text : shoeindex.price,
                      category: category ?? shoeindex.category,
                      size:
                          selectedSizes.isNotEmpty
                              ? selectedSizes
                              : shoeindex.size,
                      colors:
                          selectedColors.isNotEmpty
                              ? selectedColors
                              : shoeindex.colors,
                      image:
                          imagecontroller.text.isNotEmpty
                              ? imagecontroller.text
                              : shoeindex.image,
                      isfavorite: shoeindex.isfavorite,
                    );

                    if (shoeindex.category == "men") {
                      menshoes[menshoes.indexWhere(
                            (shoe) => shoe.image == shoeindex.image,
                          )] =
                          shoeindex;
                    } else if (shoeindex.category == "women") {
                      womenshoes[womenshoes.indexWhere(
                            (shoe) => shoe.image == shoeindex.image,
                          )] =
                          shoeindex;
                    } else if (shoeindex.category == "kids") {
                      kidsshoes[kidsshoes.indexWhere(
                            (shoe) => shoe.image == shoeindex.image,
                          )] =
                          shoeindex;
                    } else if (shoeindex.category == "newborn") {
                      newbornshoes[newbornshoes.indexWhere(
                            (shoe) => shoe.image == shoeindex.image,
                          )] =
                          shoeindex;
                    }
                    allshoes[allshoes.indexWhere(
                          (shoe) => shoe.image == shoeindex.image,
                        )] =
                        shoeindex;
                    if (name.text.isEmpty &&
                        description.text.isEmpty &&
                        price.text.isEmpty &&
                        selectedSizes.isEmpty &&
                        selectedColors.isEmpty &&
                        imagecontroller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            'Please fill out at least one of the required fields',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  });

                  Navigator.pop(context);
                },
                color: Color(0xFF003365),
                minWidth: 150,
                height: 55,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("Edit Item", style: TextStyle(color: Colors.white)),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> shoeSizes = [
  'Newborn (0-3 months)',
  '0-3 months',
  '3-6 months',
  '6-9 months',
  '9-12 months',
  '12-18 months',
  '18-24 months',
  '1-4 years (Toddler)',
  '4-7 years (Little Kid)',
  '7-12 years (Big Kid)',
  'US 1 (Big Kid)',
  'US 2 (Big Kid)',
  'US 3 (Big Kid)',
  'US 4 (Big Kid)',
  'US 5 (Big Kid)',
  'US 6 (Big Kid)',
  'US 7 (Big Kid)',
  'US 8 (Big Kid)',
  'US 9 (Big Kid)',
  'US 10 (Big Kid)',
  'US 11 (Big Kid)',
  'US 12 (Big Kid)',
  'US 13 (Big Kid)',
  'US 5 (Adult Small)',
  'US 6 (Adult Small)',
  'US 7 (Adult Small)',
  'US 8 (Adult Medium)',
  'US 9 (Adult Medium)',
  'US 10 (Adult Medium)',
  'US 11 (Adult Medium)',
  'US 12 (Adult Large)',
  'US 13 (Adult Large)',
  'US 14 (Adult Large)',
  'US 15 (Adult X-Large)',
  'US 16 (Adult X-Large)',
  'US 17 (Adult X-Large)',
  'US 18 (Adult X-Large)',
  'US 19 (Adult X-Large)',
  'US 20 (Adult X-Large)',
];

class MultiSelectDialog extends StatefulWidget {
  final List<String> selectedSizes;
  MultiSelectDialog(this.selectedSizes);

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  List<String> tempSelectedSizes = [];

  @override
  void initState() {
    super.initState();
    tempSelectedSizes = List.from(widget.selectedSizes);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text("Select Sizes", style: TextStyle(color: Colors.white)),
      content: SingleChildScrollView(
        child: Column(
          children:
              shoeSizes.map((size) {
                return CheckboxListTile(
                  activeColor: Color.fromARGB(255, 8, 101, 145),
                  title: Text(size, style: TextStyle(color: Colors.white)),
                  value: tempSelectedSizes.contains(size),
                  onChanged: (bool? checked) {
                    setState(() {
                      if (checked!) {
                        tempSelectedSizes.add(size);
                      } else {
                        tempSelectedSizes.remove(size);
                      }
                    });
                  },
                );
              }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, null),
          child: Text(
            "Cancel",
            style: TextStyle(color: Color.fromARGB(255, 8, 101, 145)),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, tempSelectedSizes),
          child: Text(
            "OK",
            style: TextStyle(color: Color.fromARGB(255, 8, 101, 145)),
          ),
        ),
      ],
    );
  }
}
