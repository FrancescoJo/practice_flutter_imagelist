/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/widgets.dart';
import 'package:practice_flutter_imagelist/core/data/ImageListDto.dart';
import 'package:practice_flutter_imagelist/core/mvvm/ViewModelTemplate.dart';
import 'package:practice_flutter_imagelist/ui/main/MainUi.dart';
import 'package:practice_flutter_imagelist/ui/main/MainUiModelImpl.dart';

class MainUiViewModel extends ViewModelTemplate {
  final MainUiModelImpl _model = new MainUiModelImpl();
  MainUi _view;

  MainUiViewModel(MainUi _view) : super(_view) {
    this._view = _view;
  }

  void loadImageList() {
    _model.invalidate(_view.getLoadingView());
    httpGetAsync("https://picsum.photos/list",
                 // I'm a newbie to Dart - is there more concise syntax to achieve this?
                 (json) => ImageListDto.parseJson(json))
        .listen((imageList) {
          print("List contains ${imageList.items.length} images");
          imageList.items.forEach((imageDto) {
            print("$imageDto");
          });
        }, onError: (exception) {
          print("ImageList population error: $exception");
        });
  }

  @override
  State createState() => _model;
}
