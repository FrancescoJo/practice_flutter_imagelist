/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'dart:io';
import 'dart:ui';

/// Collections of locale related functions.
class LocaleUtils {
  /// Retrieves current platform locale. US English will be returned
  /// if current locale is unrecognisable.
  static Locale getSystemLocale() {
    final locale = Platform.localeName;
    if (locale == null) {
      return new Locale("en", "US");
    }

    final localeParts = locale.split("_");
    return new Locale(localeParts[0], localeParts[1]);
  }
}
