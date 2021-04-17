import 'package:coffe_app/services/auth.dart';
import 'package:coffe_app/shared/constants.dart';
import 'package:coffe_app/shared/loading.dart';
import 'package:flutter/material.dart';

class Registre extends StatefulWidget {
  final Function toggleView ;

  const Registre({Key key, this.toggleView}) : super(key: key);
  @override
  _RegistreState createState() => _RegistreState();
}

class _RegistreState extends State<Registre> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false ;
  //text field state
  String email="" ;
  String password ="" ;
  String error ="" ;
  @override
  Widget build(BuildContext context) {
    return loading ?Loading() :Scaffold(
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
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Email"),
                  validator: (val){
              return  val.isEmpty ? "Enter an email":null;
                  },
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
                  decoration: textInputDecoration.copyWith(hintText: "Password"),
                  validator: (val)=> val.length <6 ? "Enter an password +6":null,
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
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading=true;
                    });
                    print(email);
                    print(password);
                    dynamic result = await _auth.registre(email, password);
                    if (result==null) {
                      setState(() {
                        error="please supply a valid email";
                        loading=false;
                      });
                    } 
                  }
                  },
                  color: Colors.pink[400],
                  child: Text(
                    "Registre",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20,),
                Text(error,style: TextStyle(color: Colors.red , fontSize: 14),)
              ],
            ),
          )),
    );
  }
}
