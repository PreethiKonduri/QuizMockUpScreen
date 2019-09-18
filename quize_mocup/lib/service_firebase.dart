import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quize_mocup/resource.dart';
import 'main.dart';

Future addQuizCloud(Map<String, dynamic> data) async {
  await Firestore.instance.collection(ConstResources.collection_name).add(data);
}

Widget fetchQuizFromCloud() {

  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance
        .collection(ConstResources.collection_name)
        .snapshots(),
    builder: (BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError)
        return new Text('Error: ${snapshot.error}');
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return new Text('Loading...');
        default:
          return new ListView(
            children: snapshot.data.documents
                .map((DocumentSnapshot document) {
              return QuizListItemView(document);
            }).toList(),
          );
      }
    },
  );



}
