import 'package:coffe_app/shared/constants.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  SettingsForm({Key key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["0", "1", "2", "3", "4"];

  //form values
  String _currentName;

  String _currentSugars;

  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Update your Coffee settings",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: "Name"),
              validator: (val) => val.isEmpty ? "Please enter a name" : null,
              onChanged: (val) {
                setState(() {
                  _currentName = val;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            //DropDown
            DropdownButtonFormField(
                decoration: textInputDecoration,
                value: _currentSugars ?? "0",
                onChanged: (val) {
                  setState(() => _currentSugars = val);
                },
                items: sugars.map((sugar) {
                  return DropdownMenuItem(
                      value: sugar, child: Text("$sugar sugars"));
                }).toList()),
            //Slider
            Slider(
              activeColor: Colors.brown[_currentStrength??100],
              inactiveColor: Colors.brown[_currentStrength??100],
              min: 100,
              max: 900,
              divisions: 8,
              onChanged: (val) {
                setState(() {
                  _currentStrength = val.round();
                });
              },
              value: (_currentStrength ?? 100).toDouble(),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () async {
                print(_currentName);
                print(_currentSugars);
                print(_currentStrength);
              },
              color: Colors.pink[400],
              child: Text(
                "Update",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
