import 'package:flutter/material.dart';

import 'ui/main/MainUi.dart';

/// Main programme entry point.
void main() => runApp(new Application());

/// Wrapper class of this "Application"
/// This widget is the root of your application.
class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainUi(),
    );
  }
}
