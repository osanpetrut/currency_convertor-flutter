import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Currency Convertor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title; // "title" is a variable that does not change

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currencies = ['Ron', 'Dollar', 'Euro'];
  String _currencies2 = 'Ron';
  String _currencies3 = 'Dollar';
  double amountChanged = 0;
  String money = '';

  String convert() {
      if (_currencies2 == 'Ron') {
        // ?:
        final double ratio = _currencies3 == 'Euro' ? 0.21 : 0.24;
        amountChanged = double.parse(money) * ratio;
      } //Ron convertor

      if (_currencies2 == 'Dollar') {
        final ratio = _currencies3 == 'Euro' ? 0.85 : 4.12;
        amountChanged = double.parse(money) * ratio;
        print(amountChanged);
      } // Dollar convertor

      if (_currencies2 == 'Euro') {
        final double ratio = _currencies3 == 'Ron' ? 4.12 : 1.18;
        amountChanged = double.parse(money) * ratio;
        print(amountChanged);
      }// Euro convertor
      return amountChanged.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
   //print(MediaQuery.of(context));
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text(
            widget.title,
          )),
      body: Container(
          color: Colors.grey[400],
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: 'To change',
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),

                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  setState(() {
                    money = value;
                  });
                },
              ),
              DropdownButton<String>(
                items: _currencies.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newValueSelected) {
                  setState(() {
                    this._currencies2 = newValueSelected;
                  });
                },
                value: _currencies2,
              ),
              DropdownButton<String>(
                items: _currencies.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newValueSelected) {
                  setState(() {
                    this._currencies3 = newValueSelected;
                  });
                },
                value: _currencies3,
              ),
              FlatButton(
                color: Colors.red,
                child: Text('Change'),
                onPressed: () async {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.grey[350],
                        title: Center(
                          child: Text('The amount change'),
                        ),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                convert(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                        titleTextStyle: TextStyle(
                          color: Colors.red[900],
                          fontWeight: FontWeight.w900,
                        ),
                        contentTextStyle: TextStyle(
                          color: Colors.red[900],
                          fontWeight: FontWeight.w900,
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.pop(context, null);
                            },
                            color: Colors.red[900],
                            splashColor: Colors.white,
                            disabledColor: Colors.grey,
                            textColor: Colors.black,
                          ),
                        ],
                      );
                    }
                  );
                },
              ),
            ],
          ),
        ),
    );
  }
}