import 'package:practice_flutter_imagelist/i18n/IMessageMap.dart';

/// European Spanish text implementation. Direct use of this class is
/// strongly discouraged.
// ignore: camel_case_types
class Strings_es_ES extends IMessageMap {
  @override
  Map<String, String> populate() {
    return {
      IMessageMap.msg_title_main_ui: "Mi primera app de Flutter",
      IMessageMap.msg_hello_world: "Hola, mundo"
    };
  }
}
