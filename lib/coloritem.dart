import 'package:flutter/material.dart';

class coloritem extends StatelessWidget {
  const coloritem({super.key, required this.isactive, required this.color});
  final bool isactive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isactive
        ? Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 5),
          ),
          child: CircleAvatar(radius: 22, backgroundColor: color),
        )
        : Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 0.5),
          ),
          child: CircleAvatar(radius: 20, backgroundColor: color),
        );
  }
}
