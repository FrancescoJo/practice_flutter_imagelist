/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */

/// This interface holds all i18n target texts used in whole programme.
abstract class IMessageMap {
  Map<String, String> populate();

  static const String label_title_error = "label_title_error";
  static const String label_ok = "label_ok";

  static const String msg_title_main_ui = "msg_title_main_ui";
  static const String msg_please_wait_loading = "msg_please_wait_loading";
  static const String msg_error_while_loading = "msg_error_while_loading";
}
