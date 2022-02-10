import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference foods =
    FirebaseFirestore.instance.collection('foods');
