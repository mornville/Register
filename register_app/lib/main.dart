import 'package:flutter/material.dart';
import 'package:register_app/screens/splashScreen.dart';
import 'package:register_app/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo,),
      title: 'Register.app',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String,WidgetBuilder>
      {
        "/HomePage" : (BuildContext context)=> Home(),
      }
      ,
    ),
  );
}

