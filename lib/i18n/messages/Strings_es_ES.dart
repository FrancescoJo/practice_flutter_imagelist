/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:practice_flutter_imagelist/i18n/IMessageMap.dart';

/// European Spanish text implementation. Direct use of this class is
/// strongly discouraged.
// ignore: camel_case_types
class Strings_es_ES extends IMessageMap {
  @override
  Map<String, String> populate() {
    return {
      IMessageMap.label_title_error: "Error",
      IMessageMap.label_ok: "Ok",

      IMessageMap.msg_title_main_ui: "Mi primera app de Flutter",
      IMessageMap.msg_please_wait_loading: "Cargando… Espere por favor",
      IMessageMap.msg_error_while_loading: "Hay un error. La razón: %s",
      IMessageMap.msg_empty_image_list: "No hay ninguna imagenes."
    };
  }
}
