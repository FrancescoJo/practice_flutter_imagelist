/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/material.dart';
import 'package:practice_flutter_imagelist/i18n/S.dart';

class MainEmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            new CircularProgressIndicator(),
            new Padding(padding: const EdgeInsets.all(8.0)),
            new Text(S.msg_please_wait_loading.text())
          ]));
}
