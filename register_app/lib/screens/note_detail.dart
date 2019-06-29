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
  final _formKey = GlobalKey<FormState>();
  //calc UI
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  dynamic operand = '+';

  TextEditingController txt = TextEditingController();
  Widget btn(btnText, Color color, Color textColor) {
    return Container(
        padding: EdgeInsets.only(bottom: 2.0),
        child: new RaisedButton(
            child: Text(
              btnText,
              style: TextStyle(fontSize: 25, color: textColor),
            ),
            onPressed: () {
              calculation(btnText);
            },
            color: color,
            padding: EdgeInsets.all(22.0),
            ));
  } // end of button

  Widget btnZero(btnText, Color color) {
    return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: new RaisedButton(
            child: Text(
              btnText,
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            onPressed: () {
              calculation(btnText);
            },
            color: color,
            padding: EdgeInsets.only(left: 81, top: 10, right: 81, bottom: 10),
            shape: StadiumBorder()));
  } // end of button
  //end

  static var _priorities = ['Cash', 'Online'];

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note;

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    //alertBox
    Future<bool> alertBox(String alertText) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                '$alertText',
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
    //endAlertBox

    titleController.text = note.title;
    descriptionController.text = note.description;

    return WillPopScope(
        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.lightGreen,
                      onPressed: () {
                        setState(() {
                          if (finalResult == '' ||
                              finalResult == '0' && _formKey.currentState.validate()) {
                            alertBox(
                                'Error. Enter the Correct Amount.');
                          } else {
                            debugPrint(':)');
                            _save();
                            updateDescription();
                            updateTitle();
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Text(
                          'CHECKOUT ( \u20B9$finalResult )',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ))
                ],
              ),
            ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }),
          ),
          body: Center(
            child: Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                child: Center(
                  child: ListView(
                      shrinkWrap: true,
                    children: <Widget>[

                       // Third Element
                       Center(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: <Widget>[
                                  ListTile(
                                   title: Row(
                                     children: <Widget>[
                                       Text('Note : ',style: TextStyle(fontWeight: FontWeight.w300,
                                           fontSize: 18.0),),
                                       Expanded(
                                         child:Container(

                                             child:Padding(
                                               padding:EdgeInsets.all(20.0),
                                               child: TextField(
                                                 controller: descriptionController,
                                                 decoration: InputDecoration(
                                                   labelText:
                                                   'Description ( Optional )',
                                                   labelStyle: TextStyle(
                                                       fontWeight: FontWeight.w300,
                                                       fontSize: 18.0),
                                                 ),
                                               ),
                                             )
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                           ],
                         ),
                       ),


                      // First element
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ListTile(

                              title: Row(
                                children: <Widget>[
                                  Text('Payment Mode :       ',style: TextStyle(fontWeight: FontWeight.w300,
                                      fontSize: 18.0),),

                                  DropdownButton(
                                      items: _priorities
                                          .map((String dropDownStringItem) {
                                        return DropdownMenuItem<String>(
                                          value: dropDownStringItem,
                                          child: Text(dropDownStringItem),
                                        );
                                      }).toList(),
                                      value: getPriorityAsString(note.priority),
                                      style: TextStyle(color: Colors.black,fontSize: 20.0),
                                      onChanged: (valueSelectedByUser) {
                                        setState(() {
                                          debugPrint(
                                              'User selected $valueSelectedByUser');
                                          updatePriorityAsInt(valueSelectedByUser);
                                        });
                                      }),
                                ],
                              )
                            ),

                            // Second Element
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ListTile(

                                title: Row(
                                  children: <Widget>[
                                    Text('Amount :    \u20B9 $finalResult ',style: TextStyle(fontWeight: FontWeight.w300,
                                        fontSize: 18.0),),


                                  ],
                                )
                            ),

                            // Second Element
                          ],
                        ),
                      ),
                      //second element
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Container(
                              height: 70.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                btn('7', Colors.white, Colors.grey),
                                btn('8', Colors.white, Colors.grey),
                                btn('9', Colors.white, Colors.grey),
                                btn('x', Colors.white, Colors.grey),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                btn('4', Colors.white, Colors.grey),
                                btn('5', Colors.white, Colors.grey),
                                btn('6', Colors.white, Colors.grey),
                                btn('-', Colors.white, Colors.grey),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                btn('1', Colors.white, Colors.grey),
                                btn('2', Colors.white, Colors.grey),
                                btn('3', Colors.white, Colors.grey),
                                btn('+', Colors.white, Colors.grey),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                btn('0', Colors.white, Colors.grey),
                                btn('.', Colors.white, Colors.grey),
                                btn('C', Colors.white, Colors.red), // AARRGGBB

                                btn('=', Colors.orange, Colors.white),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
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
    note.title = txt.text;
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
      _showAlertDialog('Status', 'Transaction Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Transaction');
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

  //calc functions

  void calculation(btnText) {
    if (btnText == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '';
      opr = '';
      preOpr = '';
      setState(() {
        txt.text = '';
      });
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        operand = '+';
        finalResult = add();
      } else if (opr == '-') {
        operand = '-';
        finalResult = sub();
      } else if (opr == 'x') {
        operand = 'x';
        finalResult = mul();
      } else if (opr == '/') {
        operand = '/';
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
      txt.text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
//end

}
