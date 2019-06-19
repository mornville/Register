import 'package:flutter/material.dart';

class IosCloneCalc extends StatefulWidget {
  IosCloneCalcState createState() => IosCloneCalcState();
}

class IosCloneCalcState extends State<IosCloneCalc> {
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
        padding: EdgeInsets.only(bottom: 20.0),
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
            shape: CircleBorder()));
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

  Widget build(BuildContext buildCx) {
    return Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: RaisedButton(
                                color: Colors.lightGreen,
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'Checkout ( \u20B9$finalResult )',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )))),
                  ],
                ),
                Divider(),
                Container(
                  height: 70.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    btn('7', Colors.white, Colors.grey),
                    btn('8', Colors.white, Colors.grey),
                    btn('9', Colors.white, Colors.grey),
                    btn('x', Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    btn('4', Colors.white, Colors.grey),
                    btn('5', Colors.white, Colors.grey),
                    btn('6', Colors.white, Colors.grey),
                    btn('-', Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    btn('1', Colors.white, Colors.grey),
                    btn('2', Colors.white, Colors.grey),
                    btn('3', Colors.white, Colors.grey),
                    btn('+', Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    btn('0', Colors.white, Colors.grey),
                    btn('.', Colors.white, Colors.grey),
                    btn('C', Colors.red, Colors.white), // AARRGGBB

                    btn('=', Colors.orange, Colors.white),
                  ],
                ),
              ],
            ),
          ],
        ));
  } // end of state class

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
}
