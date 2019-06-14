import 'package:flutter/material.dart';

class AddNewSale extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddNewSaleState();
  }
}

class _AddNewSaleState extends State<AddNewSale> {
  String total = '';
  var checkout = 0.0;
  final textController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Sale'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  onChanged: (text){
                    setState(() {
                      total = text;
                      checkout = double.parse(total);

                    });
                  },
                  keyboardType: TextInputType.number,
                 controller: textController,
                  decoration: InputDecoration(
                    hintText: 'Enter the amount here',
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top:20.0),
                    child:Container(
                      width: 200.0,
                      height: 40.0,
                      child: RaisedButton(
                        elevation: 1.0,
                        color: Colors.lightBlue,
                        onPressed: () {
                          Navigator.of(context).pushNamed('/HomePage');
                        },
                        child: Text(
                          'CheckOut (\$ $checkout)',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
