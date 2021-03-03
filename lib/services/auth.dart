import 'package:firebase_app/models/user.dart';
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


  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user= result.user;
      return _getUserId(user);
    }catch(e) {
      print(e.toString());
      return null;
    }
  }


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
  Future SignOut() async{
    try{
    return  await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}