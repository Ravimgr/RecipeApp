import 'package:flutter/material.dart';
import 'package:recipeapp/widget/app_icon.dart';
import 'package:recipeapp/widget/text_with_icon.dart';
import 'package:recipeapp/widget/title_text.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/momo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            left: 0,
            top: 0,
            right: 0,
          ),
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcons(icon: Icons.arrow_back_ios),
                AppIcons(icon: Icons.bookmark),
              ],
            ),
            top: 30,
            left: 20,
            right: 20,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 280,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                            child: TitleText(
                                text: "Crepes with Orange and Honey")),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.star),
                              Text(
                                "Rating",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text('Western'),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Expanded(
                          child: TextWithIcon(
                            text: 'mins',
                            value: 35,
                            icon: Icons.timelapse_rounded,
                          ),
                        ),
                        Expanded(
                          child: TextWithIcon(
                            text: 'mins',
                            value: 35,
                            icon: Icons.timelapse_rounded,
                          ),
                        ),
                        Expanded(
                          child: TextWithIcon(
                            text: 'mins',
                            value: 35,
                            icon: Icons.timelapse_rounded,
                          ),
                        ),
                        Expanded(
                          child: TextWithIcon(
                            text: 'mins',
                            value: 35,
                            icon: Icons.timelapse_rounded,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const TitleText(text: "Ingredients"),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                          itemBuilder: (context, index) => ListTile(
                                leading: const Icon(Icons.circle),
                                title: Text('Item $index'),
                              ),
                          itemCount: 10),
                    ),
                    const SizedBox(height: 10),
                    const TitleText(text: "Steps"),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                          itemBuilder: (context, index) => ListTile(
                                leading: const Icon(Icons.circle),
                                title: Text('Item $index'),
                              ),
                          itemCount: 10),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
