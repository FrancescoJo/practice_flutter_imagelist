/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/widgets.dart';

abstract class StateTemplate<T extends StatefulWidget> extends State<T> {
  bool _isBuilt = false;

  @override
  void setState(VoidCallback fn) {
    if (_isBuilt) {
      super.setState(fn);
    } else {
      fn.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isBuilt) {
      _isBuilt = true;
    }

    return createUi(context);
  }

  Widget createUi(BuildContext context);
}
