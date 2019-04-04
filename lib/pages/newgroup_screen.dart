import 'package:flutter/material.dart';
import 'dart:math';
import './shuffledgroup_screen.dart';

class Data{
  final groupArray;
  final rowSize;
  const Data({
    this.groupArray,
    this.rowSize
  });
}

class MyGroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: NewGroupScreen(),
    );
  }
}

class NewGroupScreen extends StatefulWidget {
  @override
  NewGroupScreenState createState() {
    return new NewGroupScreenState();
  }
}

class NewGroupScreenState extends State<NewGroupScreen> {
  
  final _formKey = GlobalKey<FormState>();
  final groupNumberController = TextEditingController();
  final rowNumberController = TextEditingController();
  var groupSize = 0;
  var rowSize = 0;

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    groupNumberController.dispose();
    rowNumberController.dispose();
    super.dispose();
  }

  void shuffle() {
    groupSize = int.parse(groupNumberController.text);
    rowSize = int.parse(rowNumberController.text);
    List<int> groupArray = new List(groupSize);
    for(var i = 0; i < groupSize; i++) {
      groupArray[i] = i;
    }
    for(var i = 0; i < groupSize; i++) {
      var random = new Random();
      /*
        * Generates a positive random integer uniformly distributed on the range
        * from [min], inclusive, to [max], exclusive.
        */
      int swap = 0 + random.nextInt(groupSize);
      int temp = groupArray[i];
      groupArray[i] = groupArray[swap];
      groupArray[swap] = temp;
    }
    for(var i = 0; i < groupSize; i++) {
      print(groupArray[i]);
    }
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) => new MyShuffleGroup(object:Data(groupArray: groupArray, rowSize: rowSize))
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: groupNumberController,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: "Number of group members"
                ),
                maxLength: 2,
              ),
              TextField(
                controller: rowNumberController,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: "Number of riders per row"
                ),
                maxLength: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    shuffle();
                    //todo: set up pairings view
                    FocusScope.of(context).requestFocus(new FocusNode()); //dismiss keyboard
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ), 
      )
    ); 
  }
}