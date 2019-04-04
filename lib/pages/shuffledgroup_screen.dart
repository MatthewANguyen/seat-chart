import 'package:flutter/material.dart';

class MyShuffleGroup extends StatelessWidget {
  final object;
  MyShuffleGroup({
    this.object
  });

  Widget seat() {
    var array = object.groupArray;
    print(object.groupArray);
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children:<Widget>[
        Text(array[0].toString()),
        Text(array[1].toString())
      ]
    );
  }

  Widget row() {
    var row = object.rowSize;
  }

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Container(
        child: seat(),
      ),
    );
  }
}