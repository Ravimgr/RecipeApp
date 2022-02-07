import 'package:flutter/material.dart';

class AppIcons extends StatelessWidget {
  const AppIcons(
      {Key? key,
      required this.icon,
      this.bgColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.iconSize = 40})
      : super(key: key);

  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(iconSize / 2),
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
