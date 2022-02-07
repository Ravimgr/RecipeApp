import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome',
              style: TextStyle(
                color: Color.fromRGBO(186, 185, 188, 1),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'User',
              style: TextStyle(
                color: Color.fromRGBO(245, 71, 72, 1),
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(250, 240, 232, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Image.asset(
              'assets/images/pp.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
