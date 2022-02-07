import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    this.color = Colors.black,
    required this.text,
    this.fontSize = 20,
  }) : super(key: key);

  final Color? color;
  final String text;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }
}
