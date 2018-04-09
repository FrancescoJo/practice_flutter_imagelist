/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/cupertino.dart';
import 'package:practice_flutter_imagelist/ui/main/MainUiViewModel.dart';

class ModelTemplate<T extends StatefulWidget> extends State<T> {
  var _isBuilt = false;
  Widget _currentView;

  void invalidate(Widget view) {
    final invalidation = () {
      _currentView = view;
    };

    if (_isBuilt) {
      setState(invalidation);
    } else {
      invalidation.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isBuilt) {
      _isBuilt = true;
    }
    return _currentView;
  }
}
