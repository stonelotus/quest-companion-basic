import 'package:flutter/widgets.dart';

class MiscService extends ChangeNotifier {
  // late bool timerRunning = false;
  ValueNotifier<bool> _timerRunning = ValueNotifier(false);

  ValueNotifier<bool> get timerRunningVN => _timerRunning;
  bool get timerRunning => _timerRunning.value;
  set timerRunning(bool timerRunning) {
    _timerRunning = ValueNotifier(timerRunning);
  }

  int goodStreak = 0;
}
