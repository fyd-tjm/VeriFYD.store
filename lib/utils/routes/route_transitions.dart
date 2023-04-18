import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_colors.dart';

class TransitionsBldr {
  const TransitionsBldr._();

  static const RouteTransitionsBuilder sharedAxisScale = _sharedAxisScale;

  static Widget _sharedAxisScale(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.scaled,
      fillColor: fydPblack,
      child: child,
    );
  }

  static const RouteTransitionsBuilder sharedAxisHorizontal =
      _sharedAxisHorizontal;

  static Widget _sharedAxisHorizontal(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.horizontal,
      fillColor: fydPblack,
      child: child,
    );
  }

  static const RouteTransitionsBuilder sharedAxisVertical = _sharedAxisVertical;

  static Widget _sharedAxisVertical(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.vertical,
      fillColor: fydPblack,
      child: child,
    );
  }

  static const RouteTransitionsBuilder fadeScale = _fadeScale;

  static Widget _fadeScale(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeScaleTransition(
      animation: animation,
      child: child,
    );
  }

  static const RouteTransitionsBuilder fadeThrough = _fadeThrough;

  static Widget _fadeThrough(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeThroughTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      fillColor: fydPblack,
      child: child,
    );
  }
}
