/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 30 - Apr - 2018
 */
import 'dart:async';

import 'package:practice_flutter_imagelist/core/data/ImageListDto.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycle.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycleAwareWidget.dart';
import 'package:practice_flutter_imagelist/core/net/RxJsonHttpClient.dart';

class MainScreenWorker {
  Future<ImageListDto> getPhotoList(AppLifecycleAwareWidget lifecycleProvider) {
    return RxJsonHttpClient.get(
        url: "https://picsum.photos/list",
        parser: (json) => ImageListDto.parseJson(json)
    ).takeUntil(lifecycleProvider.lifecycleOf(AppLifecycle.PAUSED)).single;
  }
}
