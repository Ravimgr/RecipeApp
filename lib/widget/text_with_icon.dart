import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {
  const TextWithIcon(
      {Key? key, required this.text, this.value, required this.icon})
      : super(key: key);

  final String text;
  final double? value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 150,
        width: 85,
        decoration: const BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
              topRight: Radius.circular(40)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: ClipOval(
                    child: Icon(
                  icon,
                  size: 40,
                  color: Colors.black,
                )),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
