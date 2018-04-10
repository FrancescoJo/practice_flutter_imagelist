/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/material.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycleAwareWidget.dart';
import 'package:practice_flutter_imagelist/i18n/LocaleUtils.dart';
import 'package:practice_flutter_imagelist/i18n/S.dart';
import 'package:practice_flutter_imagelist/ui/main/MainUiImpl.dart';

/// Main programme entry point.
void main() => runApp(new Application());

/// Wrapper class of this "Application"
/// This widget is the root of your application.
class Application extends AppLifecycleAwareWidget {
  static var currentLocale = LocaleUtils.getSystemLocale();

  Application() {
    S.initWith(Application.currentLocale);
  }

  @override Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainUiImpl(),
    );
  }
}
