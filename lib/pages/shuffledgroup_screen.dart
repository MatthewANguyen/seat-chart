import 'package:flutter/material.dart';

class MyShuffleGroup extends StatelessWidget {
  var object;
  MyShuffleGroup({
    this.object
  });
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Container(
        child: Text(object.toString()),
      ),
    );
  }
}