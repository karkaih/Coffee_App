import 'package:coffe_app/services/auth.dart';
import 'package:flutter/material.dart';

class Sign extends StatefulWidget {
  Sign({Key key}) : super(key: key);

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Sign in to our app"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        // ignore: deprecated_member_use
        child: RaisedButton(
          onPressed: () async{
            dynamic result =  await _auth.signInAnon();
            if (result==null) {
            print("error signing in");
              print(result);
            }  else{
              print("Sign in");
              print(result.uid);
            }
          },
          child: Text("Sign in anon"),
        ),
      ),
    );
  }
}