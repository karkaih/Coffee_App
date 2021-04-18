import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/models/coffee.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection refrence
  final CollectionReference coffeeCollection =
      Firestore.instance.collection("Coffee");

  Future updateUserData(String sugars, String name, int strength) async {
    return await coffeeCollection
        .document(uid)
        .setData({"sugar": sugars, "name": name, "strength": strength});
  }

//Coffee list from snapshot
  List<Coffee> _coffeeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Coffee(doc.data["name"] ?? '', doc.data["sugars"] ?? '0',
          doc.data["strength"] ?? 0);
    }).toList();
  }

  //get Coffee stream

  Stream<List<Coffee>> get coffee {
    return coffeeCollection.snapshots().map(_coffeeListFromSnapshot);
  }
}
