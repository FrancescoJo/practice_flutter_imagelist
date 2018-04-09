/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/widgets.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycle.dart';
import 'package:practice_flutter_imagelist/core/lifecycle/AppLifecycleOwner.dart';
import 'package:rxdart/rxdart.dart';

/// Application state-aware `Widget` class. Inheriting this class causes your
/// widget respond to any state(app lifecycle, locale, memory, etc) changes and
/// let it to be redrawn; which may impact drawing performance.
abstract class AppLifecycleAwareWidget extends StatefulWidget
    implements AppLifecycleOwner {
  final _onResumeSubject = new PublishSubject<AppLifecycleState>();
  final _onPauseSubject  = new PublishSubject<AppLifecycleState>();

  @override State createState() => new _LifecycleAwareState(this);

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

  @override Observable<AppLifecycle> lifecycleOf(AppLifecycle desiredLifecycle) {
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
class _LifecycleAwareState extends State<AppLifecycleAwareWidget>
    with WidgetsBindingObserver {
  final AppLifecycleAwareWidget _stateCallback;

  _LifecycleAwareState(this._stateCallback);

  @override void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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

  @override Widget build(BuildContext context) {
    final view = _stateCallback.build(context);

    // To ensure first 'onResumed' called after child's build is finished
    _stateCallback._onResumeSubject.add(AppLifecycleState.resumed);
    _stateCallback.onResumed();
    return view;
  }
}
