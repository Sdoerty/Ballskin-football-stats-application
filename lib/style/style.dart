import 'package:flutter/material.dart';

appBarListTile(){
  return ListTile(
    title: Text('BALLSKIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
    subtitle: Text('FOOTBALL STATS', style: TextStyle(color: Colors.white, fontSize: 10)),
    trailing: IconButton(icon: Icon(Icons.search), onPressed: () {  }, color: Colors.white,),
  );
}