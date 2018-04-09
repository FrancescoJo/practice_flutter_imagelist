/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practice_flutter_imagelist/i18n/IMessageMap.dart';
import 'package:practice_flutter_imagelist/i18n/messages/Strings_en_US.dart';
import 'package:practice_flutter_imagelist/i18n/messages/Strings_es_ES.dart';
import 'package:practice_flutter_imagelist/core/util/Collections.dart';
import 'package:sprintf/sprintf.dart';

/// This class holds all strings required for current language; However this class runs under
/// custom implementation therefore an initialisation process must be done before use. Invoke
/// `init` method at the programme entry point to achieve this requisite.
///
/// Why custom implementation rather than Flutter `Intl` package? Because it lacks functionality
/// and too difficult to setup.
// TODO: Hot reload support
class S {
  // public
  static const _TextSpec msg_title_main_ui = const _TextSpec(IMessageMap.msg_title_main_ui);
  static const _TextSpec msg_hello_world   = const _TextSpec(IMessageMap.msg_hello_world);

  // private
  static Locale _locale;
  static Map<String, String> _messageMap;

  static void initWith(Locale locale) {
    S._locale = locale;
    debugPrint("Initialising message maps with locale $locale");

    /*
     * Tedious. Dart supports "mirror" which is similar to Java Reflection;
     * however Flutter prohibits it so we can't load classes dynamically.
     *
     * https://www.dartlang.org/articles/dart-vm/reflection-with-mirrors
     * https://github.com/flutter/flutter/issues/1150
     */
    IMessageMap messageMap;
    switch (locale.languageCode) {
      case "en":
        switch (locale.countryCode) {
          case "us":
            messageMap = new Strings_en_US();
            break;
          default:
            messageMap = new Strings_en_US();
            break;
        }
        break;
      case "es":
        switch (locale.countryCode) {
          case "ES":
            messageMap = new Strings_es_ES();
            break;
          default:
            messageMap = new Strings_es_ES();
            break;
        }
        break;
      default:
        messageMap = new Strings_en_US();
        break;
    }
    S._messageMap = messageMap.populate();
    debugPrint("${S._messageMap.length} message entries loaded for $locale");
  }
}

class _TextSpec {
  final String key;

  const _TextSpec(this.key);

  String text([List formatArgs]) {
    final String template = S._messageMap[key];
    String msg;
    if (template == null) {
      msg = "[${S._locale}] ${this.key}";
    } else {
      if (Collections.isEmpty(formatArgs)) {
        msg = template;
      } else {
        try {
          msg = sprintf(template, formatArgs);
        } catch (e) {
          debugPrint(e);
          msg = template;
        }
      }
    }

    return msg;
  }
}
