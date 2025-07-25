import 'package:flutter/material.dart';
import 'package:storeapp/addshoesclass.dart';
import 'package:storeapp/coloritem.dart';
import 'package:storeapp/colorslistview.dart';
import 'package:storeapp/shoeslist.dart';
import 'colorslistview.dart';

class Addshoes extends StatefulWidget {
  @override
  State<Addshoes> createState() => _AddshoesState();
}

class _AddshoesState extends State<Addshoes> {
  final GlobalKey<FormState> formkey = GlobalKey();

  TextEditingController name = TextEditingController();

  TextEditingController description = TextEditingController();

  String? category;

  TextEditingController price = TextEditingController();

  TextEditingController image = TextEditingController();

  List<String> selectedSizes = [];

  List<Color> selectedColors = [];

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Adding Item',
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
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Shoes Name ";
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Description ";
                    }
                    return null;
                  },
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
                      if (newvalue != null) {
                        category = newvalue;
                      }
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a category';
                    } else {
                      return null;
                    }
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
                        horizontal: 70,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter The Price ";
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Image URL ";
                    }
                    return null;
                  },
                  controller: image,
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
                  selectedcolors: selectedColors,
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
                  if (formkey.currentState!.validate() &&
                      selectedSizes.isNotEmpty &&
                      selectedColors.isNotEmpty) {
                    String shoeName = name.text;
                    String shoeDescription = description.text;
                    String shoeCategory = category!;
                    String shoePrice = price.text;
                    String shoeImage = image.text;

                    allshoes.add(
                      Addshoesclass(
                        name: shoeName,
                        description: shoeDescription,
                        price: shoePrice,
                        category: shoeCategory,
                        size: selectedSizes,
                        colors: List.from(selectedColors),
                        image: shoeImage,
                        isfavorite: false,
                      ),
                    );
                    if (category == "men") {
                      menshoes.add(allshoes.last);
                    } else if (category == "women") {
                      womenshoes.add(allshoes.last);
                    } else if (category == "kids") {
                      kidsshoes.add(allshoes.last);
                    } else if (category == "newborn") {
                      newbornshoes.add(allshoes.last);
                    }

                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Text(
                          'Please fill out all required fields and select at least one size and color',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                color: Color(0xFF003365),
                minWidth: 150,
                height: 55,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("Add Item", style: TextStyle(color: Colors.white)),
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
                  activeColor: Color.fromARGB(255, 9, 114, 163),
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
            style: TextStyle(color: Color.fromARGB(255, 9, 114, 163)),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, tempSelectedSizes),
          child: Text(
            "OK",
            style: TextStyle(color: Color.fromARGB(255, 9, 114, 163)),
          ),
        ),
      ],
    );
  }
}
