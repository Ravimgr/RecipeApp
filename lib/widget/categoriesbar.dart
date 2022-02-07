//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoriesBar extends StatelessWidget {
  CategoriesBar({
    Key? key,
  }) : super(key: key);

  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('Categories');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 66,
        child: StreamBuilder(
          stream: _categories.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Category(
                    title: documentSnapshot['title'],
                    image: documentSnapshot['imgUrl'],
                  ),
                );
              },
            );
          },
        ));
  }
}

class Category extends StatelessWidget {
  const Category({Key? key, required this.image, required this.title})
      : super(key: key);
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
