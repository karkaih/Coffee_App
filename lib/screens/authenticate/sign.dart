import 'package:coffe_app/services/auth.dart';
import 'package:coffe_app/shared/constants.dart';
import 'package:coffe_app/shared/loading.dart';
import 'package:flutter/material.dart';

class Sign extends StatefulWidget {
  final Function toggleView;

  Sign({Key key, this.toggleView}) : super(key: key);

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false ;
//text field state
  String email = "";

  String password = "";

  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ?Loading() :Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Sign in to our app"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          // ignore: deprecated_member_use
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Registre"))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          // ignore: deprecated_member_use
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Email"),
                  validator: (val) {
                    return val.isEmpty ? "Enter an email" : null;
                  },
                  onChanged: (v) {
                    setState(() {
                      email = v;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
decoration: textInputDecoration.copyWith(hintText: "Password"),
                  validator: (val) =>
                      val.length < 6 ? "Enter an password +6" : null,
                  obscureText: true,
                  onChanged: (v) {
                    setState(() {
                      password = v;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        loading=true;
                      });
                      print(email);
                      print(password);
                       dynamic result = await _auth.signIn(email, password);
                        if (result==null) {
                          setState(() {
                            error="Could not sign in";
                            loading=false;
                          });
                        }
                    }
                  },
                  color: Colors.pink[400],
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                )
              ],
            ),
          )),
    );
  }
}
