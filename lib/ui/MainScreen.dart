/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/material.dart';
import 'package:practice_flutter_imagelist/core/data/ImageListDto.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycleAwareWidget.dart';
import 'package:practice_flutter_imagelist/i18n/S.dart';
import 'package:practice_flutter_imagelist/ui/MainScreenWorker.dart';
import 'package:practice_flutter_imagelist/ui/widget/MainEmptyView.dart';
import 'package:practice_flutter_imagelist/ui/widget/MainErrorView.dart';
import 'package:practice_flutter_imagelist/ui/widget/MainLoadingView.dart';
import 'package:practice_flutter_imagelist/ui/widget/PicsumListView.dart';

class MainScreen extends AppLifecycleAwareWidget {
  final _worker = new MainScreenWorker();

  @override Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(S.msg_title_main_ui.text()),
        ),
        body: new FutureBuilder<ImageListDto>(
            future: _worker.getPhotoList(this),
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
