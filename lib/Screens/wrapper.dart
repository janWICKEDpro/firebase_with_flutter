import 'package:firebase_app/Screens/authenticate/authenticate.dart';
import 'package:firebase_app/Screens/home/home.dart';
import 'package:firebase_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Users>(context);
    print(user);
    if(user==null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
