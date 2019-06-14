import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Future<bool>_onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Do You Want To Exit?', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300),),
            actions: <Widget>[
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text('My Drawer app'),
            backgroundColor: Colors.redAccent,
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('Ashutosh'),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundImage:
                      NetworkImage('https://i.imgur.com/itElfV3.jpg'),
                    ),
                  ),
                  accountEmail: Text('aj97389@gmail.com'),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'images/back.jpeg'))),
                ),
                ListTile(
                  title: Text('First Page'),
                  trailing: Icon(Icons.arrow_upward),
                ),
                Divider(),
                ListTile(
                  title: Text('Second Page'),
                  trailing: Icon(Icons.arrow_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Close Button'),
                  trailing: Icon(Icons.cancel),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Divider(),
              ],
            ),
          ),
          body: Center(
            child: Text(
              'HomePage',
              style: TextStyle(fontSize: 35.0),
            ),
          ),
        ),
      ),
    );
  }
}
