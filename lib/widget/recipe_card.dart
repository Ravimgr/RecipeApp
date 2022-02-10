import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recipeapp/widget/title_text.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard(
      {Key? key, required this.imgUrl, required this.title, required this.time})
      : super(key: key);
  final String imgUrl;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Random().nextInt(150) + 50.5,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.timelapse_rounded,
                            color: Colors.white,
                          ),
                          Text('$time min',
                              style: const TextStyle(color: Colors.white)),
                        ],
                      )),
                ),
                Positioned(
                  bottom: 10,
                  right: 5,
                  child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(46, 58, 89, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.star),
                          Text('4.5'),
                        ],
                      )),
                ),
              ],
            ),
          ),
          TitleText(text: title, fontSize: 18),
          const Text('western'),
        ],
      ),
    );
  }
}
