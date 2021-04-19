import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/models/coffee.dart';
import 'package:coffe_app/screens/home/settings_form.dart';
import 'package:coffe_app/services/auth.dart';
import 'package:coffe_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'coffe_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.brown[100],
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Coffee>>.value(
      value: DatabaseService().coffee,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text(" Home"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            // ignore: deprecated_member_use
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text("Log out")),
            // ignore: deprecated_member_use
            FlatButton.icon(
                onPressed: () {
                  _showSettingPanel();
                },
                icon: Icon(Icons.settings),
                label: Text("Settings"))
          ],
        ),
        body: Container(
            decoration: BoxDecoration(

                image:
                    DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/coffee_bg.png"))),
            child: CoffeList()),
      ),
    );
  }
}
