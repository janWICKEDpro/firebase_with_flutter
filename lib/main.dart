import 'package:firebase_app/Screens/authenticate/authenticate.dart';
import 'package:firebase_app/Screens/authenticate/sign_in.dart';
import 'package:firebase_app/Screens/wrapper.dart';
import 'package:firebase_app/loading.dart';
import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Fire());
}
class Fire extends StatelessWidget{
  final Future<FirebaseApp> _initialize = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialize,
      builder: (context,snapshot){
        if(snapshot.hasError){
          return MaterialApp(
            home: Container(
              child: Text("Failed")
            )
          );
        }
        if(snapshot.connectionState == ConnectionState.done){
          return StreamProvider<Users>.value(
            initialData: Users(),
            value: AuthService().user,
            child: MaterialApp(
              home:Wrapper()
            )
          );
        }
        return MaterialApp(
            home: Loading()
        );
      }
    );
  }
}

