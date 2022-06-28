import 'package:flutter/material.dart';

import '../model/data3_model.dart';

class detail3 extends StatelessWidget {
   final ResultAllBooks catalog;
   
  // const MyHome({Key? key}) : super(key: key);
   const detail3({ Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Center(child: Text('Home')),
      ),
      body: Container(
        decoration: const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/aa.jpg"),
        fit: BoxFit.cover),
  ),
        child:  Center(child: Text(catalog.details!,style: TextStyle(color: Color.fromARGB(255, 255, 17, 0)),)),
      ),
    );
  }
}