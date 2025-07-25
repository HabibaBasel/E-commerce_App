import 'package:flutter/material.dart';
import 'package:storeapp/coloritem.dart';

class Colorslistview extends StatefulWidget {
  final Function(List<Color>) onColorSelected;
  final List<Color> selectedcolors;
  Colorslistview({
    super.key,
    required this.onColorSelected,
    required this.selectedcolors,
  });

  @override
  State<Colorslistview> createState() => _ColorslistviewState();
}

class _ColorslistviewState extends State<Colorslistview> {
  late List<Color> selectedcolors;
  @override
  void initState() {
    super.initState();
    selectedcolors = List.from(widget.selectedcolors);
  }

  List<Color> colors = [
    Color(0xFF000000),
    Color(0xFF212121),
    Color(0xFF424242),
    Color(0xFF616161),
    Color(0xFF757575),
    Color(0xFF9E9E9E),
    Color(0xFFBDBDBD),
    Color(0xFFEEEEEE),
    Color(0xFFF5F5F5),
    Color(0xFFFFFFFF),
    Color(0xFFFFEBEE),
    Color(0xFFFFCDD2),
    Color(0xFFEF9A9A),
    Color.fromARGB(255, 206, 132, 132),
    Color(0xFFEF5350),
    Color.fromARGB(255, 248, 90, 79),
    Color(0xFFE53935),
    Color(0xFFD32F2F),
    Color(0xFFC62828),
    Color(0xFFB71C1C),
    Color(0xFFFFF3E0),
    Color(0xFFFFE082),
    Color(0xFFFFD54F),
    Color(0xFFFFCA28),
    Color(0xFFFFB300),
    Color(0xFFFF8F00),
    Color(0xFFFF6F00),
    Color(0xFFEF6C00),
    Color(0xFFDD5A00),
    Color(0xFFBF360C),
    Color(0xFFFFF9C4),
    Color(0xFFFFF59D),
    Color(0xFFFFF176),
    Color(0xFFFFEE58),
    Color(0xFFFFEB3B),
    Color(0xFFFDD835),
    Color(0xFFFBC02D),
    Color(0xFFF9A825),
    Color(0xFFF57F17),
    Color(0xFF9E7D2E),
    Color(0xFF81C784),
    Color(0xFF66BB6A),
    Color(0xFF4CAF50),
    Color(0xFF43A047),
    Color(0xFF388E3C),
    Color(0xFF2C6B2F),
    Color(0xFF1B5E20),
    Color(0xFF90CAF9),
    Color(0xFF64B5F6),
    Color(0xFF42A5F5),
    Color(0xFF2196F3),
    Color(0xFF1E88E5),
    Color(0xFF1976D2),
    Color(0xFF1565C0),
    Color(0xFF8C9EFF),
    Color(0xFF536DFE),
    Color(0xFF3D5AFE),
    Color(0xFF1A237E),
    Color(0xFF000051),
    Color(0xFF00008B),
    Color(0xFF0000A0),
    Color(0xFF303F9F),
    Color(0xFFF3E5F5),
    Color(0xFFE1BEE7),
    Color(0xFFD1C4E9),
    Color(0xFFB39DDB),
    Color(0xFF9575CD),
    Color(0xFF7E57C2),
    Color(0xFF5E35B1),
    Color(0xFF512DA8),
    Color(0xFF4527A0),
    Color(0xFF311B92),
    Color(0xFFF8BBD0),
    Color(0xFFF48FB1),
    Color(0xFFF06292),
    Color(0xFFEC407A),
    Color(0xFFE91E63),
    Color(0xFFD81B60),
    Color(0xFFC2185B),
    Color(0xFFAD1457),
    Color(0xFF880E4F),
    Color(0xFF6A1B9A),
    Color(0xFFB2DFDB),
    Color(0xFF80CBC4),
    Color(0xFF4DB6AC),
    Color(0xFF26A69A),
    Color(0xFF00897B),
    Color(0xFF00796B),
    Color(0xFF004D40),
    Color(0xFF003D33),
    Color(0xFFE0F7FA),
    Color(0xFFB2EBF2),
    Color(0xFF80DEEA),
    Color(0xFF4DD0E1),
    Color(0xFF26C6DA),
    Color(0xFF00BCD4),
    Color(0xFF00ACC1),
    Color(0xFF0097A7),
    Color(0xFF00838F),
    Color(0xFF006064),
    Color(0xFFEFEFEF),
    Color(0xFFD7D7D7),
    Color(0xFFB8B8B8),
    Color(0xFFA1A1A1),
    Color(0xFF8A8A8A),
    Color(0xFF737373),
    Color(0xFF5C5C5C),
    Color(0xFF464646),
    Color(0xFF303030),
    Color(0xFF1A1A1A),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: colors.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: InkWell(
            child: coloritem(
              isactive: selectedcolors.contains(colors[index]),
              color: colors[index],
            ),
            highlightColor: Colors.black,
            splashColor: Colors.black,
            hoverColor: Colors.black,
            onTap: () {
              setState(() {
                if (selectedcolors.contains(colors[index])) {
                  selectedcolors.remove(colors[index]);
                } else {
                  selectedcolors.add(colors[index]);
                }
                widget.onColorSelected(selectedcolors);
              });
            },
          ),
        );
      },
    );
  }
}
