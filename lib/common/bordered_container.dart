import 'package:book_store/utilz/theme.dart';
import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({Key? key, required this.child, this.thickness = 3,
    required this.width, required this.height, required this.color})
      : super(key: key);

  final Widget child;
  final double thickness;
  final double width;
  final double height;
  final  Color color;


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 5),
        width:width,
        height:height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color),
        ),
        child: child,
        );
  }
}
