import 'package:flutter/material.dart';
import 'package:flutterofflinepractice/models/store_model.dart';

class StoreComponent extends StatelessWidget {

  late StoreModel store;


  StoreComponent({required this.store});




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(this.store.name,style: TextStyle(fontSize: 20),),);
  }
}