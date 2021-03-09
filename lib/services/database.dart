import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/brew.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  final CollectionReference brewCollection= FirebaseFirestore.instance.collection("brews");


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
//streams
  Stream<List<Brew>> get brews{
    return brewCollection.snapshots().map(_getBrewModelSnapshot);
}
List<Brew> _getBrewModelSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((e){
      return Brew(
         name: e.data()['Name'] ?? '',
        sugars: e.data()['Sugar'] ?? '0',
        strength: e.data()['Strength'] ?? 0
      );
    }).toList();
  }

}