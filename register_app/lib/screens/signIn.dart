import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Stack(

          fit: StackFit.expand,
          children: <Widget>[

            Container(
              decoration: BoxDecoration(color: Color(0xfff6f6f6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Expanded(

                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: ListView(

                                children: <Widget>[
                                 Column(
                                   children: <Widget>[
                                     Padding(
                                       padding: EdgeInsets.only(top:20.0),

                                         child: CircleAvatar(
                                           backgroundColor: Colors.white,
                                           radius: 40.0,
                                           backgroundImage:
                                           AssetImage("images/user.png"),
                                         ),
                                       ),







                                     Padding(
                                       padding: EdgeInsets.all(20.0),
                                       child: Text(
                                         'Sign In To Register.app',
                                         style: TextStyle(
                                             color: Colors.blue,
                                             fontWeight: FontWeight.w300,
                                             fontSize: 20.0),
                                       ),
                                     ),
                                     //password
                                   Form(
                                     key:_formKey,
                                     child: Column(
                                       children: <Widget>[
                                         Container(
                                           width: 300.0,
                                           child: Padding(
                                             padding: EdgeInsets.all(20.0),
                                             child: TextField(
                                               controller: username,
                                               decoration: InputDecoration(
                                                 labelText:
                                                 'Username (required)',
                                                 labelStyle: TextStyle(
                                                     fontWeight: FontWeight.w300,
                                                     fontSize: 15.0),
                                               ),
                                             ),
                                           ),
                                         ),
                                         Container(
                                           width: 300.0,
                                           child: Padding(
                                             padding: EdgeInsets.all(20.0),
                                             child: Column(
                                               children: <Widget>[
                                                 TextField(
                                                   controller: password,
                                                   decoration: InputDecoration(
                                                     labelText:
                                                     'Password (required)',
                                                     labelStyle: TextStyle(
                                                         fontWeight: FontWeight.w300,
                                                         fontSize: 15.0),
                                                   ),
                                                 ),
                                                 Row(
                                                   mainAxisAlignment: MainAxisAlignment.end,
                                                   children: <Widget>[
                                                     Padding(
                                                       padding: EdgeInsets.only(top:20.0),
                                                       child:Text('Forgot Password?',style: TextStyle(fontWeight: FontWeight.w500),),
                                                     ),

                                                   ],
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ),

                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.center,

                                           children: <Widget>[
                                             Padding(padding: EdgeInsets.all(20.0),
                                               child: Container(
                                                 width: 100.0,
                                                 height: 40.0,
                                                 child: RaisedButton(
                                                   color: Colors.lightBlue,
                                                   onPressed: () {
                                                     Navigator.of(context).pushNamed('/HomePage');
                                                   },
                                                   child: Text(
                                                     'Sign In',
                                                     style: TextStyle(
                                                         color: Colors.white,
                                                         fontSize: 18.0,
                                                         fontWeight: FontWeight.w400),
                                                   ),
                                                 ),
                                               ),)
                                           ],
                                         ),
                                       ],
                                     ),
                                   )
                                   ],
                                 ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
