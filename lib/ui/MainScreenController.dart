/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/material.dart';
import 'package:practice_flutter_imagelist/core/data/ImageListDto.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycle.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycleOwner.dart';
import 'package:practice_flutter_imagelist/core/net/RxJsonHttpClient.dart';
import 'package:practice_flutter_imagelist/ui/MainScreenUiModel.dart';

class MainScreenController extends StatefulWidget {
  final _uiProducer = new MainScreenUiModel();

  void loadImageList(AppLifecycleOwner lifecycleContext) {
    _uiProducer.showLoading();
    RxJsonHttpClient.get(
        url: "https://picsum.photos/list",
        // I'm a newbie to Dart - is there more concise syntax to achieve this?
        // e.g.) ImageListDto::parseJson
        parser: (json) => ImageListDto.parseJson(json)
    ).doOnDone(() {
      _uiProducer.showEmpty();
    }).takeUntil(
        lifecycleContext.lifecycleOf(AppLifecycle.PAUSED)
    ).listen((imageList) {
      // TODO: create list view via MainUi and present it
      print("List contains ${imageList.items.length} images");
      imageList.items.forEach((imageDto) {
        print("$imageDto");
      });
    }, onError: (exception) {
      _uiProducer.showError(exception);
    });
  }

  @override
  MainScreenUiModel createState() => new MainScreenUiModel();
}
