import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {
  const TextWithIcon(
      {Key? key, required this.text, this.value, required this.icon})
      : super(key: key);

  final String text;
  final String? value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 150,
        width: 85,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(46, 58, 89, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: CircleAvatar(
                radius: 35,
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
              value == null ? '' : value.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
