import 'dart:html';

import 'package:firebase_app/models/brew.dart';
import 'package:flutter/material.dart';


class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    void navigate(Brew brew){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>New(data: brew,)));
    }
    return GestureDetector(
      onTap:(){
        navigate(brew);
      },
      child: Padding(
      padding: EdgeInsets.only(
        top:8.0,
      ),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} Sugar(s)'),
        ),
      ),
      ),
    );
  }

  }

class New extends StatelessWidget{
  final Brew data;
  New({this.data});
  @override
  Widget build(BuildContext context){
    return Container(
        child: Column(
          children: [
            Text(data.name),

          ],
        ),
      );

  }
}
