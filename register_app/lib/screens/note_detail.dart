import 'dart:async';
import 'package:flutter/material.dart';
import 'package:register_app/models/note.dart';
import 'package:register_app/utils/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['Cash', 'Online'];

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note;

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.note, this.appBarTitle);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    titleController.text = note.title;
    descriptionController.text = note.description;

    return WillPopScope(
        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }),
          ),
          body: Center(
            child:
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      // First element
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ListTile(
                              leading: Text('Mode :  '),
                              title: DropdownButton(

                                  items: _priorities.map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),

                                  value: getPriorityAsString(note.priority),
                                  onChanged: (valueSelectedByUser) {
                                    setState(() {
                                      debugPrint('User selected $valueSelectedByUser');
                                      updatePriorityAsInt(valueSelectedByUser);
                                    });
                                  }),
                            ),

                            // Second Element
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                                      child: ListTile(
                                        title: TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Enter Correct Amount';
                                            }
                                            if (!value.contains(RegExp(r'^[0-9.]+$'))) {
                                              return 'Enter Correct Amount';
                                            }
                                            if (value.contains(',')) {
                                              return 'Amount Can Not Contain Any special Character';
                                            }
                                            return null;
                                          },
                                          controller: titleController,
                                          decoration: InputDecoration(
                                            labelText: 'Amount (required)',
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 18.0),
                                          ),
                                        ),
                                      )),

                                  // Third Element
                                  Padding(
                                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                                      child: ListTile(
                                        title: TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Description REQUIRED';
                                            }

                                            return null;
                                          },
                                          controller: descriptionController,
                                          decoration: InputDecoration(
                                            labelText: 'Description (required)',
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 18.0),
                                          ),
                                        ),
                                      )),

                                  // Fourth Element
                                  Padding(
                                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: RaisedButton(
                                              color: Theme.of(context).primaryColorDark,
                                              textColor:
                                              Theme.of(context).primaryColorLight,
                                              child: Text(
                                                'Add',
                                                textScaleFactor: 1.2,
                                              ),
                                              onPressed: () {
                                                if (_formKey.currentState.validate()) {
                                                  // If the form is valid, display a Snackbar.
                                                  setState(() {
                                                    debugPrint(':)');
                                                    _save();
                                                    updateDescription();
                                                    updateTitle();
                                                  });
                                                }
                                              }),
                                        ),
                                        Container(
                                          width: 5.0,
                                        ),
                                        Expanded(
                                          child: FlatButton(
                                            color: Theme.of(context).primaryColorDark,
                                            textColor: Theme.of(context).primaryColorLight,
                                            child: Text(
                                              'Remove',
                                              textScaleFactor: 1.2,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                debugPrint("Delete button clicked");
                                                _delete();
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ),

          ),
        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Convert the String priority in the form of integer before saving it to Database
  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'Cash':
        note.priority = 1;
        break;

      case 'Online':
        note.priority = 2;
        break;

    }
  }

  // Convert int priority to String priority and display it to user in DropDown
  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0]; // 'Cash'
        break;
      case 2:
        priority = _priorities[1]; // 'Online'
        break;

    }
    return priority;
  }

  // Update the title of Note object
  void updateTitle() {
    note.title = titleController.text;
  }

  // Update the description of Note object
  void updateDescription() {
    note.description = descriptionController.text;
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();

    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note.id != null) {
      // Case 1: Update operation
      result = await helper.updateNote(note);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertNote(note);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }
  }

  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (note.id == null) {
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteNote(note.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Note Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Note');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
