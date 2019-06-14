import 'package:flutter/material.dart';
import 'package:register_app/screens/splashScreen.dart';
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo,),
      title: 'Register.app',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

