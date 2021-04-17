import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  //collection refrence
  final CollectionReference coffeeCollection =
      Firestore.instance.collection("Coffee");



  Future updateUserData(String sugars , String name , int strength) async {

    return await coffeeCollection.document(uid).setData({
      "sugar":sugars,
      "name" :name ,
      "stregth":strength
    });
  }
}
