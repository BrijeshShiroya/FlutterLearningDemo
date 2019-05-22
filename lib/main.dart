import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// void main() {

//   runApp(MyApp());
// }

void main() {
  runApp(MaterialApp(
    title: 'Navigation',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        username = text;
                      });
                    },
                    decoration: InputDecoration(hintText: 'Username'),
                    textAlign: TextAlign.left,
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        password = text;
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      onPressed: () {
                        if (username.trim() == '') {
                          // print('please enter email');
                          Fluttertoast.showToast(
                              msg: "Please enter Username",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1);
                        } else if (password.trim() == '') {
                          Fluttertoast.showToast(
                              msg: "Please enter Password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1);
                        } else {
                          // Fluttertoast.showToast(
                          //     msg: "Login Success",
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.BOTTOM,
                          //     timeInSecForIos: 1);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondRoute()));
                        }
                      },
                      child: Text('Login'),
                    ),
                  )
                ],
              ))),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
