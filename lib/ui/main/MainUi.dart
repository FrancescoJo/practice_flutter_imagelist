/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/widgets.dart';
import 'package:practice_flutter_imagelist/core/mvvm/IViewTemplate.dart';

abstract class MainUi extends IViewTemplate {
  Widget getLoadingView();
}
