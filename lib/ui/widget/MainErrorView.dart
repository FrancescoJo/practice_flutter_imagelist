/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/material.dart';
import 'package:practice_flutter_imagelist/i18n/S.dart';

class MainErrorView extends StatelessWidget {
  final Error _error;

  MainErrorView(this._error);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text(S.label_title_error.text()),
      content: new Text(S.msg_error_while_loading.text([_error])),
      actions: <Widget>[
        new FlatButton(
          child: new Text(S.label_ok.text()),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ]
    );
  }
}
