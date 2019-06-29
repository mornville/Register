import 'package:flutter/material.dart';
import 'package:register_app/screens/auth.dart';

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

                                         Center(
                                           child: Column(
                                             children: <Widget>[
                                               LoginButton(), // <-- Built with StreamBuilder
                                               UserProfile() // <-- Built with StatefulWidget
                                             ],
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


class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  initState() {
    super.initState();

    // Subscriptions are created here
    authService.profile.listen((state) => setState(() => _profile = state));

    authService.loading.listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(padding: EdgeInsets.all(20), child: Text(_profile.toString())),
      Text(_loading.toString())
    ]);
  }
}
class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authService.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialButton(
              onPressed: () => authService.signOut(),
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Signout'),
            );
          } else {
            return MaterialButton(
              onPressed: () => authService.googleSignIn(),
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Login with Google'),
            );
          }
        });
  }
}