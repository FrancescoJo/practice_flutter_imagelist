/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:rxdart/rxdart.dart';

import 'AppLifecycle.dart';

abstract class AppLifecycleOwner {
  /// Returns an `Observable` which emits given `desiredLifecycle` when the
  /// lifecycle actually happens. This method is especially useful in conjunction
  /// with `Observable.takeUntil` to remove async clean-up codes, e.g.)
  ///
  /// ```
  ///   // Dart Stream version
  ///   void main() {
  ///     // keep a reference to your stream subscription
  ///     StreamSubscription<List> dataSub;
  ///     // convert the Future returned by getData() into a Stream
  ///     dataSub = getData().asStream().listen((List data) {
  ///       updateDisplay(data);
  ///     });
  ///     // user navigated away!
  ///     dataSub.cancel();
  ///   }
  ///
  ///   // RxDart version
  ///   void main() {
  ///     new Observable(getData().asStream())
  ///       // Listen until the UI state enters to PAUSED
  ///       .takeUntil(lifecycleOf(Lifecycle.PAUSED))
  ///       .listen((List data) {
  ///         updateDisplay(data);
  ///       });
  /// ```
  Observable<AppLifecycle> lifecycleOf(AppLifecycle desiredLifecycle);
}
