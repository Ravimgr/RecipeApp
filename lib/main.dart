import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/screens/food/food_details.dart';
import 'package:recipeapp/screens/homepage/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        '/homepage': (context) => const MyHomePage(),
        '/detail': (context) => const FoodDetails(),
      },
    );
  }
}
