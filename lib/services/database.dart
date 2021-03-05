import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  final CollectionReference brewCollection= FirebaseFirestore.instance.collection("brews");

  //streams
  Stream<QuerySnapshot> get brews{
    return brewCollection.snapshots();
  }

  //update
Future updateUserData(String sugars, String name, int strength) async{
  return await brewCollection.doc(uid).set(
      {
    'Sugar': sugars,
    'Name': name,
    'Strength': strength
      }
  );
}

}