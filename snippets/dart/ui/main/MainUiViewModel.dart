/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
//import 'package:flutter/widgets.dart';
//import 'package:practice_flutter_imagelist/core/data/ImageListDto.dart';
//import 'package:practice_flutter_imagelist/i18n/S.dart';
//
//import '../../mvvm/ViewModelTemplate.dart';
//import 'MainUi.dart';
//import 'MainUiModelImpl.dart';
//
//class MainUiViewModel extends ViewModelTemplate {
//  final MainUiModelImpl _model = new MainUiModelImpl();
//  final MainUi _view;
//
//  MainUiViewModel(this._view) : super(_view);
//
//  void loadImageList() {
//    _model.drawView(_view.loadingView());
//    httpGetAsync("https://picsum.photos/list",
//                 // I'm a newbie to Dart - is there more concise syntax to achieve this?
//                 (json) => ImageListDto.parseJson(json))
//        .listen((imageList) {
//          // TODO: create list view via MainUi and present it
//          print("List contains ${imageList.items.length} images");
//          imageList.items.forEach((imageDto) {
//            print("$imageDto");
//          });
//        }, onError: (exception) {
//          _model.drawView(_view.errorView(_model.context, S.msg_error_while_loading.text([exception])));
//        });
//  }
//
//  @override
//  State createState() => _model;
//}
