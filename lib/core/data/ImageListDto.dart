/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 10 - Apr - 2018
 */
import 'package:practice_flutter_imagelist/core/data/ImageDto.dart';

class ImageListDto {
  final List<ImageDto> items;

  ImageListDto(this.items);

  static ImageListDto parseJson(Object jsonObject) {
    if (jsonObject is! List) {
      throw new ArgumentError("Unexpected protocol. JsonArray expected.");
    }

    // ignore: strong_mode_uses_dynamic_as_bottom
    final itemList = (jsonObject as List).map<ImageDto>((Map<String, dynamic> entry) {
      return new ImageDto(entry);
    }).toList();

    return new ImageListDto(itemList);
  }
}
