/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/material.dart';
import 'package:practice_flutter_imagelist/i18n/S.dart';

/// Main UI class
class MainUi extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(S.msg_title_main_ui.text()),
        ),
        body: new Center(child: new Text(S.msg_hello_world.text())));
  }
}
