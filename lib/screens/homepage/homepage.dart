import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recipeapp/constants/constants.dart';
import 'package:recipeapp/widget/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              child: StreamBuilder<QuerySnapshot>(
                  stream: foods.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return MasonryGridView.count(
                        itemCount: snapshot.data!.docs.length,
                        crossAxisCount: 2,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot foods =
                              snapshot.data!.docs[index];
                          return InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed('/detail', arguments: foods.id),
                            child: RecipeCard(
                              imgUrl: foods['imgUrl'],
                              title: foods['title'],
                              time: foods['duration'],
                            ),
                          );
                        });
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
