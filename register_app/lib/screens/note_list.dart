import 'dart:async';
import 'package:flutter/material.dart';
import 'package:register_app/models/note.dart';
import 'package:register_app/utils/database_helper.dart';
import 'package:register_app/screens/note_detail.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

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
    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Note('', '', 1), 'Add Note');
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
      body: getNoteListView(),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Payment Mode : ' +
                        getPaymentMode(this.noteList[position].priority),
                    style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),),
                  ),
                ],
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      getPriorityColor(this.noteList[position].priority),
                  child: getPriorityIcon(this.noteList[position].priority),
                ),
                title: Text(
                  '\u20B9 ${this.noteList[position].title}',
                  style: titleStyle,
                ),
                subtitle: Text(this.noteList[position].description +
                    ' on ' +
                    this.noteList[position].date),
                trailing: GestureDetector(
                  child: FlatButton(onPressed: null, child: Text('REMOVE')),
                  onTap: () {
                    _delete(context, noteList[position]);
                  },
                ),
                onTap: () {
                  debugPrint("ListTile Tapped");
                  navigateToDetail(this.noteList[position], 'Edit Note');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.white;
        break;
      case 2:
        return Colors.white;
        break;

      default:
        return Colors.white;
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.attach_money);
        break;
      case 2:
        return Icon(Icons.group);
        break;

      default:
        return Icon(Icons.credit_card);
    }
  }

  String getPaymentMode(int priority) {
    switch (priority) {
      case 1:
        return 'Cash';
        break;
      case 2:
        return 'Google Pay';
        break;

      case 3:
        return 'PayTM';
    }
  }

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {

      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
