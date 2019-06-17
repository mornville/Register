import 'package:register_app/models/note.dart';
import 'package:register_app/utils/database_helper.dart';
import 'note_list.dart';
import 'package:flutter/material.dart';
import 'package:register_app/screens/note_detail.dart';
import 'package:sqflite/sqflite.dart';

class NoteListHistor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteListHistor> {


  //bottomNavBar drawer
  static final List<String> _listViewData = [
    "Inducesmile.com",
    "Flutter Dev",
    "Android Dev",
    "iOS Dev!",
    "React Native Dev!",
    "React Dev!",
  ];

  _showDrawer() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: ListView(
              children: [
                Center(
                    child: ListTile(
                      leading: Icon(Icons.verified_user),
                      title: Text('List of Users'),
                    )),
                Divider(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _listViewData
                      .map((data) =>
                      ListTile(
                        leading: Icon(Icons.arrow_right),
                        title: Text(data),
                      ))
                      .toList(),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports')),


      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'ASHUTOSH',
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.2),
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/user.png"),
                ),
              ),
              accountEmail: Text(
                'aj97389@gmail.com',
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [.5, 0.7, 0.7, 0.9],
                    colors: [
                      // Colors are easy thanks to Flutter's Colors class.
                      Colors.deepOrange[800],
                      Colors.deepOrange[700],
                      Colors.deepOrange[600],
                      Colors.deepOrange[400],
                    ],
                  )),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/HomePage");
              },
            ),
            Divider(),
            ListTile(
              title: Text('Transactions'),
              leading: Icon(Icons.account_balance),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/History");
              },
            ),
            Divider(),
            ListTile(
              title: Text('Reports'),
              leading: Icon(Icons.receipt),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/Reports");

              },
            ),
            Divider(),
            ListTile(
              title: Text('Deposits'),
              leading: Icon(Icons.account_balance_wallet),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/Settings");              },
            ),
            Divider(),
            ListTile(
              title: Text('Log Out'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/SignIn");
              },
            ),
            Divider(),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60.0,
                        child: Icon(
                          Icons.notifications_active,
                          color: Colors.blue,
                          size: 60.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.0),
                      ),
                      Text(
                        'Reports Coming Soon!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

}