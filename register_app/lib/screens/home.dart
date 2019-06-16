import 'package:flutter/material.dart';

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
  addDynamic(){
    listDynamic.add(DynamicWidget());
    setState(() {

    });
  }


  //BackchodAlert
  Future<bool> alertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('gaand me Chull', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300),),
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
                  onPressed: () {
                    alertBox();
                  },
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('ASHUTOSH',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w300,letterSpacing: 1.5),),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/user.png"),
                    ),
                  ),
                  accountEmail: Text('aj97389@gmail.com',),
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
                    )),                ),
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
              addDynamic();
            },
            child: Icon(Icons.add),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: RaisedButton(
                      color: Colors.lightBlue,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/HomePage');
                      },
                      child: Text(
                        'CheckOut (\$ 400.00)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                      itemCount: listDynamic.length,
                      itemBuilder: (_,index) => listDynamic[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class DynamicWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListTile(
        leading: Icon(Icons.recent_actors,color: Colors.green,),
        title: Text('Amount: \$ 30.00'),
        trailing: Icon(Icons.delete,color: Colors.redAccent,),
        subtitle: Text('Payment Method: Cash'),
      ),
    );
  }

}