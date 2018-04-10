/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 10 - Apr - 2018
 */

class ImageDto {
  String format;
  int width;
  int height;
  String filename;
  int id;
  String author;
  String authorUrl;
  String postUrl;

  ImageDto(Map<String, dynamic> jsonObject) {
    this.id        = jsonObject["id"];
    this.format    = jsonObject["format"];
    this.width     = jsonObject["width"];
    this.height    = jsonObject["height"];
    this.filename  = jsonObject["filename"];
    this.author    = jsonObject["author"];
    this.authorUrl = jsonObject["author_url"];
    this.postUrl   = jsonObject["post_url"];
  }

  @override
  String toString() {
    return "ImageDto[\n" +
        "  id: $id\n" +
        "  format: $format\n" +
        "  width: $width\n" +
        "  height: $height\n" +
        "  filename: $filename\n" +
        "  author: $author\n" +
        "  authorUrl: $authorUrl\n" +
        "  postUrl: $postUrl\n" +
        "]";
  }
}
