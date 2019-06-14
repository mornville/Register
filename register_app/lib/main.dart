import 'package:flutter/material.dart';
import 'package:register_app/screens/splashScreen.dart';
import 'package:register_app/screens/home.dart';
import 'package:register_app/screens/signIn.dart';


import 'package:flutter/services.dart';

Future main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      title: 'Register.app',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "/HomePage": (BuildContext context) => Home(),
        "/SignIn": (BuildContext context) => SignIn(),
      },
    ),
  );
}
