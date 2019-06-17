import 'package:flutter/material.dart';
import 'dart:io';
var number = 0;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  //DynamicWidget
  List<DynamicWidget> listDynamic = [];
  addDynamic() {
    number++;
    listDynamic.add(DynamicWidget());
    setState(() {});
  }

  //BackchodAlert
  Future<bool> alertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'gaand me Chull',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        });
  }

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
                  exit(0);
                },
              ),
            ],
          );
        });
  }


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
              )
            ),
                Divider(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _listViewData
                      .map((data) => ListTile(
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
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Container(
        child: Scaffold(
          appBar: AppBar(title: Text('Dashboard')),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              addDynamic();
            },
            tooltip: 'Press To Add Transaction',
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 5.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.supervisor_account),
                  iconSize: 30.0,
                  onPressed: _showDrawer,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.history),
                    iconSize: 30.0,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
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
                    Navigator.of(context).pushNamed("/HomePage");
                    Navigator.of(context).pop();
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Transactions'),
                  leading: Icon(Icons.account_balance),
                  onTap: () {
                    Navigator.of(context).pushNamed("/History");
                    Navigator.of(context).pop();
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Reports'),
                  leading: Icon(Icons.receipt),
                  onTap: () {
                    Navigator.of(context).pushNamed("/Reports");
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
          body: Container(
            child: Column(
              children: <Widget>[

                Flexible(
                  child: ListView.builder(
                      itemCount: listDynamic.length,
                      itemBuilder: (context, index) => listDynamic[index]),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom:40.0,top: 10.0),
                  child: Center(
                    child: RaisedButton(
                      color: Colors.black,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/HomePage');
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Checkout (\$ 400.00)',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DynamicWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DynamicWidgetState();
  }
}

class _DynamicWidgetState extends State<DynamicWidget> {
  List _paymentModes = [
    "Cash",
    "UPI",
    "Google Pay",
    "PayTM",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;
  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _paymentModes) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.account_balance),
                      title: Text('Customer Transaction'),
                    ),
                    Container(
                      width: 300.0,
                      child: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter Amount Here',
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 300.0,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Payment Mode :   ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16.0),
                            ),
                            DropdownButton(
                              iconEnabledColor: Colors.black,
                              value: _currentCity,
                              items: _dropDownMenuItems,
                              onChanged: changedDropDownItem,
                              style:
                                  TextStyle(fontSize: 15.0, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ButtonTheme.bar(
                      // make buttons use the appropriate styles for cards
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('REMOVE'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }
}
