import 'package:flutter/material.dart';
import 'package:register_app/screens/splashScreen.dart';
import 'package:register_app/screens/home.dart';
import 'package:register_app/screens/signIn.dart';
import 'package:register_app/screens/addNewSale.dart';
import 'package:register_app/screens/transaction_history.dart';
import 'package:register_app/screens/reports.dart';
import 'package:register_app/screens/setting.dart';


import 'package:flutter/services.dart';
import 'package:register_app/screens/note_list.dart';
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
        "/HomePage": (BuildContext context) => NoteList(),
        "/NewSale": (BuildContext context) =>AddNewSale(),
        "/SignIn": (BuildContext context) => SignIn(),
        "/History": (BuildContext context) => NoteListHistory(),
        "/Reports": (BuildContext context) => NoteListHistor(),

        "/Settings": (BuildContext context) => Settings(),

      },
    ),
  );
}
