/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/material.dart';
import 'package:practice_flutter_imagelist/core/ui/StateTemplate.dart';
import 'package:practice_flutter_imagelist/ui/MainScreenController.dart';
import 'package:practice_flutter_imagelist/ui/widget/MainEmptyView.dart';
import 'package:practice_flutter_imagelist/ui/widget/MainErrorView.dart';
import 'package:practice_flutter_imagelist/ui/widget/MainLoadingView.dart';

enum _MainUiState {
  LOADING,
  EMPTY_LIST
}

class MainScreenUiModel extends StateTemplate<MainScreenController> {
  _MainUiState _state = _MainUiState.LOADING;

  void showLoading() {
    setState(() {
      this._state = _MainUiState.LOADING;
    });
  }

  void showEmpty() {
    setState(() {
      this._state = _MainUiState.EMPTY_LIST;
    });
  }

  void showError(Error exception) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => new MainErrorView(exception)
    );
  }

  @override
  Widget createUi(BuildContext context) {
    switch (_state) {
      case _MainUiState.EMPTY_LIST:
        return new MainEmptyView();
      case _MainUiState.LOADING:
      default:
        return new MainLoadingView();
    }
  }
}
