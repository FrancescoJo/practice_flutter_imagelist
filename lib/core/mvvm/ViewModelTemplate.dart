/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/widgets.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycle.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycleOwner.dart';
import 'package:practice_flutter_imagelist/core/net/RxJsonHttpClient.dart';
import 'package:rxdart/rxdart.dart';

abstract class ViewModelTemplate extends StatefulWidget {
  final AppLifecycleOwner _lifecycleOwner;

  ViewModelTemplate(this._lifecycleOwner);

  /// Returns an Observable that performs HTTP GET request to destination `url`
  /// and stops itself when the app is paused.
  Observable<T> httpGetAsync<T>(String url, JsonObjectParser<T> parser) {
    return RxJsonHttpClient.get<T>(url: "https://picsum.photos/list", parser: parser)
      .takeUntil(_lifecycleOwner.lifecycleOf(AppLifecycle.PAUSED));
  }
}
