import 'dart:async';

/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

/// Application state-aware `Widget` class. Inheriting this class causes your
/// widget respond to any state(app lifecycle, locale, memory, etc) changes and
/// let it to be redrawn; which may impact drawing performance.
abstract class AppStateAwareWidget extends StatefulWidget {
  final _onResumeSubject = new PublishSubject<AppLifecycleState>();
  final _onPauseSubject  = new PublishSubject<AppLifecycleState>();

  @override State<StatefulWidget> createState() =>
      new _LifecycleAwareState(this);

  Widget build(BuildContext context);

  void _onDestroy() {
    _onResumeSubject.close();
    _onPauseSubject.close();
  }

  /// Called when this `Widget` is entered to `resumed` state.
  /// See https://docs.flutter.io/flutter/dart-ui/AppLifecycleState-class.html#resumed
  /// for the significance.
  void onResumed() { /* Default implementation */ }

  /// Called when this `Widget` is entered to `paused` state.
  /// See https://docs.flutter.io/flutter/dart-ui/AppLifecycleState-class.html#paused
  /// for the significance.
  void onPaused() { /* Default implementation */ }

  /// Called when Locale context of this `Widget` is changed.
  ///
  void onLocaleChanged(Locale locale) { /* Default implementation */ }

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
  Observable<AppLifecycle> lifecycleOf(AppLifecycle desiredLifecycle) {
    // This looks quite stupid; study Dart Streams and
    // change logic to utilise just single state subject to achieve this.
    // https://www.dartlang.org/tutorials/language/streams
    if (desiredLifecycle == AppLifecycle.PAUSED) {
      return _onPauseSubject.stream.flatMap((AppLifecycleState state) {
        return new Observable.just(AppLifecycle.PAUSED);
      });
    } else {
      return _onResumeSubject.stream.flatMap((AppLifecycleState state) {
        return new Observable.just(AppLifecycle.RESUMED);
      });
    }
  }
}

// see https://docs.flutter.io/flutter/widgets/WidgetsBindingObserver-class.html
class _LifecycleAwareState extends State<AppStateAwareWidget>
    with WidgetsBindingObserver {
  final AppStateAwareWidget _stateCallback;

  _LifecycleAwareState(this._stateCallback);

  @override void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // To ensure 'onResumed' called at the beginning of Widget display
    _stateCallback._onResumeSubject.add(AppLifecycleState.resumed);
    _stateCallback.onResumed();
  }

  @override void dispose() {
    _stateCallback._onDestroy();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      /*
       * Emit only iOS, Android common lifecycle to avoid platform-specific
       * problems, however this may ineffective.
       */
      if (state == AppLifecycleState.resumed) {
        _stateCallback.onResumed();
        _stateCallback._onResumeSubject.add(state);
      } else if (state == AppLifecycleState.paused) {
        _stateCallback.onPaused();
        _stateCallback._onPauseSubject.add(state);
      }
    });
  }

  @override void didChangeLocale(Locale locale) {
    setState(() {
      _stateCallback.onLocaleChanged(locale);
    });
  }

  @override Widget build(BuildContext context) => _stateCallback.build(context);
}

enum AppLifecycle {
  RESUMED,
  PAUSED
}
