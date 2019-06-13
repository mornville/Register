import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Register',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primarySwatch: Colors.red,


        ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(300.0), // here the desired height
          child: AppBar(
            title: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text(
                        'The Register.app',
                        style: TextStyle(fontFamily: 'Roboto',fontSize: 30.0),
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Wanna Login?',
                      style: TextStyle(fontSize: 20.0, color: Colors.black87)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
