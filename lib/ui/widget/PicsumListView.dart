/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/widgets.dart';
import 'package:practice_flutter_imagelist/core/data/ImageDto.dart';
import 'package:practice_flutter_imagelist/ui/widget/PicsumListItemView.dart';

class PicsumListView extends StatelessWidget {
  final List<ImageDto> _items;

  const PicsumListView(this._items);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (context, index) => new PicsumListItemView(_items[index]),
      itemCount: _items.length
    );
  }
}
