import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/widget/widgets.dart';
import 'package:recipeapp/constants/constants.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context)!.settings.arguments as String;

    final foodDetails = foods.doc(foodId).get();
    return Scaffold(
        body: FutureBuilder(
            future: foodDetails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                DocumentSnapshot foodSnapshot =
                    snapshot.data as DocumentSnapshot;
                final Map details = foodSnapshot.data() as Map;
                return Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(details['imgUrl']),
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
                        children: [
                          InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child:
                                  const AppIcons(icon: Icons.arrow_back_ios)),
                          const AppIcons(icon: Icons.bookmark),
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
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: TitleText(text: details['title'])),
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
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
                                children: [
                                  Expanded(
                                    child: TextWithIcon(
                                      text: 'mins',
                                      value: details['duration'],
                                      icon: Icons.timelapse_rounded,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextWithIcon(
                                      text: 'Servings',
                                      value: details['servings'],
                                      icon: Icons.person_outline,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextWithIcon(
                                      text: 'Calories',
                                      value: 103.toString(),
                                      icon: Icons.timelapse_rounded,
                                    ),
                                  ),
                                  const Expanded(
                                    child: TextWithIcon(
                                      text: 'Easy',
                                      icon: Icons.stacked_bar_chart,
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
                                          title: Text(
                                              details['ingredients'][index]),
                                        ),
                                    itemCount: details['ingredients'].length),
                              ),
                              const SizedBox(height: 10),
                              const TitleText(text: "Steps"),
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                    itemBuilder: (context, index) => ListTile(
                                          leading: const Icon(Icons.circle),
                                          title: Text(details['steps'][index]),
                                        ),
                                    itemCount: details['steps'].length),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Text('loading data');
            }));
  }
}
