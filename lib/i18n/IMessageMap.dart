/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */

/// This interface holds all i18n target texts used in whole programme.
abstract class IMessageMap {
  Map<String, String> populate();

  static const String msg_title_main_ui = "msg_title_main_ui";
  static const String msg_hello_world = "msg_hello_world";
}
