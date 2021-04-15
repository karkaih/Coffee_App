import 'package:coffe_app/screens/authenticate/registre.dart';
import 'package:coffe_app/screens/authenticate/sign.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true ;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return  Sign(toggleView:toggleView);
    }
  else{
    return Registre(toggleView:toggleView);
    }
  }
}