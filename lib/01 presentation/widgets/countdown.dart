import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

int useCountDown(int countSec, bool onOrOff) {
  return use(_CounterTimer(countSec: countSec, timerOn: onOrOff));
}

class _CounterTimer extends Hook<int> {
  final int countSec;
  final bool timerOn;

  const _CounterTimer({
    required this.countSec,
    required this.timerOn,
  });

  @override
  _CounterTimerState createState() => _CounterTimerState();
}

class _CounterTimerState extends HookState<int, _CounterTimer> {
  Timer? _timer;
  int _currentNumber = 0;

  @override
  void initHook() {
    super.initHook();
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentNumber = timer.tick;
        if ((hook.countSec - _currentNumber == 0) || (hook.timerOn == false)) {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  int build(BuildContext context) {
    return (((_currentNumber - hook.countSec) == 0) || (hook.timerOn == false))
        ? 0
        : hook.countSec - _currentNumber;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
