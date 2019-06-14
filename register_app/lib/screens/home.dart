import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Do You Want To Exit?',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
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
            backgroundColor: Colors.blueAccent,
            title: Text("Dashboard"),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: Icon(Icons.supervised_user_circle),
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('Ashutosh'),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/user.png"),
                    ),
                  ),
                  accountEmail: Text('aj97389@gmail.com'),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/back.jpeg'))),
                ),
                ListTile(
                  title: Text('Transactions'),
                  leading: Icon(Icons.account_balance),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Reports'),
                  leading: Icon(Icons.receipt),
                  onTap: () {
                    Navigator.of(context).pop();
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
                  },
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/NewSale");
            },
            child: Icon(Icons.add),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100.0,
                  backgroundImage:
                  AssetImage("images/user.png"),

                ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text('No Sale Yet!',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w300),),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
