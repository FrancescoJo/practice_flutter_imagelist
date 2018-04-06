import 'package:flutter/material.dart';

/// Main UI class
class MainUi extends StatelessWidget {
  static const String _title = "Flutter Demo Main UI";

  // Called only once
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(_title),
        ),
        body: new Center(
            child: new Text("Hello, world!!")
        )
    );
  }
}
