/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 10 - Apr - 2018
 */
import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:practice_flutter_imagelist/core/util/Strings.dart';
import 'package:rxdart/rxdart.dart';

/// A JSON object parser rule which converts `jsonListOrMap` to user specified
/// type T. In plain Android or iOS development this can be done easily using
/// various JSON parsers, but in Flutter we can't use mirror(reflection),
/// so we must implement this thing on every our domain DTOs.
///
/// Hope that there are better workarounds.
///
/// see also: https://webdev.dartlang.org/articles/get-data/json-web-service#parsing-json
typedef T JsonObjectParser<T>(Object jsonListOrMap);

/// A very basic http client which wraps request as Reactive streams.
class RxJsonHttpClient {
  /// Send request to server and gets result as <T> if parser rule is given,
  /// or raw String otherwise.
  static Observable<T> get<T>({String url, Uri uri, JsonObjectParser<T> parser}) {
    final observable = new Observable.fromFuture(
        _request("GET", _selectUri(url, uri))
    );

    if (parser != null) {
      return observable.map((String s) => parser.call(json.decode(s)));
    } else {
      return observable as Observable<T>;
    }
  }

  // For other missing methods:
  // https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods

  static Uri _selectUri(String url, Uri uri) {
    if (Strings.isEmpty(url)) {
      if (uri == null) {
        throw new ArgumentError("Url or uri must not be empty!");
      }

      return uri;
    }

    return Uri.parse(url);
  }

  static Future<String> _request(String method, Uri uri) async {
    final request  = await new HttpClient().openUrl(method, uri);
    final response = await request.close();

    return await response.transform(utf8.decoder).join();
  }
}
