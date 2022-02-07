import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 55,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(46, 58, 89, 1),
                ),
                hintText: 'Seach any Recipe',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(164, 168, 167, 1),
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(108, 114, 124, 1),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(108, 114, 124, 1),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          width: 48,
          height: 55,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(46, 58, 89, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            splashColor: Colors.transparent,
            splashRadius: 10,
            icon: const Icon(
              Icons.filter_alt,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
