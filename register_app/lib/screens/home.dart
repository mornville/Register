import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'))),
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
    );
  }
}
