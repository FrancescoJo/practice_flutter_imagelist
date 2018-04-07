import 'package:practice_flutter_imagelist/i18n/IMessageMap.dart';

/// US English text implementation. Direct use of this class is
/// strongly discouraged.
// ignore: camel_case_types
class Strings_en_US extends IMessageMap {
  @override
  Map<String, String> populate() {
    return {
      IMessageMap.msg_title_main_ui: "My first Flutter app",
      IMessageMap.msg_hello_world: "Hello, world"
    };
  }
}
