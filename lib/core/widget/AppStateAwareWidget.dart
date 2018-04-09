/*
 * My first flutter project
 *
 * author: Francesco Jo(nimbusob@gmail.com)
 * since: 9 - Apr - 2018
 */
import 'package:flutter/widgets.dart';

/// Application state-aware `Widget` class. Inheriting this class causes your
/// widget respond to any state(app lifecycle, locale, memory, etc) changes and
/// let it to be redrawn; which may impact drawing performance.
abstract class AppStateAwareWidget extends StatefulWidget {
  @override State<StatefulWidget> createState() =>
      new _LifecycleAwareState(this);

  Widget build(BuildContext context);

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

  // TODO: Support state emission as Rx.PublishSubject
}

// see https://docs.flutter.io/flutter/widgets/WidgetsBindingObserver-class.html
class _LifecycleAwareState extends State<AppStateAwareWidget>
    with WidgetsBindingObserver {
  final AppStateAwareWidget _stateCallback;

  AppLifecycleState _notification;
  Locale _locale;

  _LifecycleAwareState(this._stateCallback);

  @override void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      this._notification = state;
      /*
       * Emit only iOS, Android common lifecycle to avoid platform-specific
       * problems, however this may ineffective.
       */
      if (state == AppLifecycleState.resumed) {
        _stateCallback.onResumed();
      } else if (state == AppLifecycleState.paused) {
        _stateCallback.onPaused();
      }
    });
  }

  @override void didChangeLocale(Locale locale) {
    setState(() {
      this._locale = locale;
      _stateCallback.onLocaleChanged(locale);
    });
  }

  @override Widget build(BuildContext context) => _stateCallback.build(context);
}
