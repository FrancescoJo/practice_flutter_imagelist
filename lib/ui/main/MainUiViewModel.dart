/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/widgets.dart';
import 'package:practice_flutter_imagelist/ui/main/MainUi.dart';
import 'package:practice_flutter_imagelist/ui/main/MainUiModelImpl.dart';

class MainUiViewModel extends StatefulWidget {
  final MainUi _view;
  final MainUiModelImpl _model = new MainUiModelImpl();

  MainUiViewModel(this._view);

  void loadImageList() {
    _model.invalidate(_view.getLoadingView());
    // TODO Rx load json image
  }

  @override
  State createState() => _model;
}
