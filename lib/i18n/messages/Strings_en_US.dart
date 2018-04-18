/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:practice_flutter_imagelist/i18n/IMessageMap.dart';

/// US English text implementation. Direct use of this class is
/// strongly discouraged.
// ignore: camel_case_types
class Strings_en_US extends IMessageMap {
  @override
  Map<String, String> populate() {
    return {
      IMessageMap.label_title_error: "Error",
      IMessageMap.label_ok: "Ok",

      IMessageMap.msg_title_main_ui: "My first Flutter app",
      IMessageMap.msg_please_wait_loading: "Please wait while loading…",
      IMessageMap.msg_error_while_loading: "Error occurred. Reason: %s"
    };
  }
}
