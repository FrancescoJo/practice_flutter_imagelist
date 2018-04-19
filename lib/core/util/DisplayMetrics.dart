/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 19 - Apr - 2018
 */
import 'package:flutter/widgets.dart';

/// Collections of display related functions.
class DisplayMetrics {
  /// Converts Flutter's logical pixels to real pixel value. This may required
  /// to use image related services running on non-Flutter environments.
  ///
  /// Note that, [context] must be a child of WidgetsApp or MaterialApp.
  static int pt2Px(BuildContext context, double pt) {
    final mq = MediaQuery.of(context);
    final px = pt * mq.devicePixelRatio;
    return px.round();
  }
}
