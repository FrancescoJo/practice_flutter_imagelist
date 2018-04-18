/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/material.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycleAwareWidget.dart';
import 'package:practice_flutter_imagelist/i18n/S.dart';
import 'package:practice_flutter_imagelist/ui/MainScreenController.dart';

class MainScreen extends AppLifecycleAwareWidget {
  final _presenter = new MainScreenController();

  @override
  void onResumed() {
    super.onResumed();
    _presenter.loadImageList(this);
  }

  @override Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(S.msg_title_main_ui.text()),
        ),
        body: _presenter
    );
  }
}
