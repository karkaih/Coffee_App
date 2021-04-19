import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/models/coffee.dart';
import 'package:coffe_app/screens/home/coffe_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeList extends StatefulWidget {
  CoffeList({Key key}) : super(key: key);

  @override
  _CoffeListState createState() => _CoffeListState();
}

class _CoffeListState extends State<CoffeList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Coffee>>(context)??[];
    if(brews!=null){
      brews.forEach((brew) {
        print(brew.name);
        print(brew.sugars);
        print(brew.strength);
      });
    }

    return ListView.builder(itemCount: brews.length,itemBuilder: (context,index){
      return CoffeTile(brew:brews[index]) ;

    });
  }
}