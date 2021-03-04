import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users _getUserId(User user){
    return user!=null ? Users(uid: user.uid) : null;
  }

  Stream<Users> get user {
    return _auth.authStateChanges()
        .map(_getUserId);
  }

//Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user= result.user;
      return _getUserId(user);
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

//Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user= result.user;
      await DatabaseService(uid: user.uid).updateUserData('3', 'Jan the boss', 100);
      return _getUserId(user);
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

//Anonymous signIn
  Future signInAnon() async {
    try {
     UserCredential result = await _auth.signInAnonymously();
     User user = result.user;
     return _getUserId(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //Logout user
  Future SignOut() async{
    try{
    return  await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}