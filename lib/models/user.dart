
import 'package:firebase_auth/firebase_auth.dart';

class Users{
  final String uid;
  Users({ this.uid});

}

class UserData{
  final String uid;
  final String name;
  final String sugars;
  final int strength;
  UserData({this.uid, this.name, this.sugars, this.strength});
}