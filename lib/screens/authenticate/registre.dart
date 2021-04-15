import 'package:coffe_app/services/auth.dart';
import 'package:flutter/material.dart';

class Registre extends StatefulWidget {
  final Function toggleView ;

  const Registre({Key key, this.toggleView}) : super(key: key);
  @override
  _RegistreState createState() => _RegistreState();
}

class _RegistreState extends State<Registre> {
  final AuthService _auth = AuthService();

  //text dield state
  String email="" ;
  String password ="" ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Sign up to our app"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          // ignore: deprecated_member_use
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Sign in"))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          // ignore: deprecated_member_use
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (v) {
                    setState(() {
                      email=v;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (v) {
                    setState(() {
                      password= v;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () async {
                    print(email);
                    print(password);
                  },
                  color: Colors.pink[400],
                  child: Text(
                    "Registre",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
