import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recipeapp/widget/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> _items = List.generate(
      30,
      (index) => {
            "id": index,
            "title": "Item $index",
            "height": Random().nextInt(150) + 50.5
          });

  @override
  Widget build(BuildContext context) {
    const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 20.0);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: const _TopBody(padding: _padding)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: MasonryGridView.count(
                  itemCount: _items.length,
                  crossAxisCount: 2,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).pushNamed('/detail'),
                      child: Card(
                        // Give each item a random background color
                        color: Color.fromARGB(
                            Random().nextInt(256),
                            Random().nextInt(256),
                            Random().nextInt(256),
                            Random().nextInt(256)),
                        key: ValueKey(_items[index]['id']),
                        child: SizedBox(
                          height: _items[index]['height'],
                          child: Center(
                            child: Image.asset(
                              'assets/images/img.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}

class _TopBody extends StatelessWidget {
  const _TopBody({Key? key, required this.padding}) : super(key: key);

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: padding,
          child: const AppBarWidget(),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: padding,
          child: RichText(
            text: const TextSpan(
                text: 'Make your own food\nstay at',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ' home',
                    style: TextStyle(
                        color: Color.fromRGBO(46, 58, 89, 1),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  )
                ]),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: padding,
          child: const SearchBarWidget(),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: padding,
          child: CategoriesBar(),
        ),
      ],
    );
  }
}
