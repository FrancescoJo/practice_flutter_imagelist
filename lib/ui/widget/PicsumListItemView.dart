/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 19 - Apr - 2018
 */
import 'package:flutter/material.dart';
import 'package:practice_flutter_imagelist/core/util/DisplayMetrics.dart';
import 'package:practice_flutter_imagelist/core/data/ImageDto.dart';

/// https://hackernoon.com/flutter-iii-lists-and-items-6bfa7348ab1b
class PicsumListItemView extends StatelessWidget {
  static const _IMAGE_DIMEN_WIDTH  = 64.0;
  static const _IMAGE_DIMEN_HEIGHT = 64.0;

  final ImageDto _item;

  PicsumListItemView(this._item);

  @override
  Widget build(BuildContext context) {
    // Lorem picsum only accepts real pixels, not logical pixels in Flutter
    final width  = DisplayMetrics.pt2Px(context, _IMAGE_DIMEN_WIDTH);
    final height = DisplayMetrics.pt2Px(context, _IMAGE_DIMEN_HEIGHT);

    return new ListTile(
      // TODO: Fetch from Disk or Network (Both Image.disk or Image.network has their own caching strategy)
      leading: new Image.network("https://picsum.photos/$width/$height?image=${_item.id}",
        width: _IMAGE_DIMEN_WIDTH,
        height: _IMAGE_DIMEN_HEIGHT
      ),
      title: new Text(_item.author),
      subtitle: new Text(_item.filename)
    );
  }
}
