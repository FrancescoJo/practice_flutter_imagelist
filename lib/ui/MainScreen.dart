/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practice_flutter_imagelist/core/data/ImageListDto.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycle.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycleAwareWidget.dart';
import 'package:practice_flutter_imagelist/core/net/RxJsonHttpClient.dart';
import 'package:practice_flutter_imagelist/i18n/S.dart';
import 'package:practice_flutter_imagelist/ui/widget/MainEmptyView.dart';
import 'package:practice_flutter_imagelist/ui/widget/MainErrorView.dart';
import 'package:practice_flutter_imagelist/ui/widget/MainLoadingView.dart';
import 'package:practice_flutter_imagelist/ui/widget/PicsumListView.dart';

class MainScreen extends AppLifecycleAwareWidget {
  Future<ImageListDto> getPhotoList() {
    return RxJsonHttpClient.get(
        url: "https://picsum.photos/list",
        parser: (json) => ImageListDto.parseJson(json)
    ).takeUntil(lifecycleOf(AppLifecycle.PAUSED)).single;
  }

  @override Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(S.msg_title_main_ui.text()),
        ),
        body: new FutureBuilder<ImageListDto>(
          // XXX(fj): We have Model(getPhotoList), Control(FutureBuilder), View(FutureBuilder.builder)
          // in this single place - will be a dreadful problem in the future. How can we fix this?
          // How can we fix this like in MVP/MVVM way?
            future: getPhotoList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                if (data.items.length == 0) {
                  return new MainEmptyView();
                }
                return new PicsumListView(data.items);
              } else if (snapshot.hasError) {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) => new MainErrorView(snapshot.error)
                );
              }

              return new MainLoadingView();
            }
        )
    );
  }
}
