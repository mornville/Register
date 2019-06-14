import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60.0,
                        child: Icon(
                          Icons.blur_on,
                          color: Colors.blue,
                          size: 60.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.0),
                      ),
                      Text(
                        'The Register.app',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text('Powered By VeePay',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300)),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(color: Color(0xfff6f6f6)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 300.0,
                                height: 40.0,
                                child: RaisedButton(
                                  color: Colors.lightBlue,
                                  onPressed: () {
                                    debugPrint('New Account pressed');
                                  },
                                  child: Text(
                                    'Create  Account',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 300.0,
                                height: 40.0,
                                child: RaisedButton(
                                  elevation: 1.0,
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/HomePage');
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                child: FlatButton(
                                  child: Text(
                                    'Learn About Register.app',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {
                                    debugPrint('Learn more Pressed');
                                  },
                                ),
                              ),
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
        ],
      ),
    );
  }
}
