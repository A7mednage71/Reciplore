import 'package:flutter/material.dart';

extension NavigationContext on BuildContext {
  void pushNamed(String routeName, {Object? arguments}) =>
      Navigator.pushNamed(this, routeName, arguments: arguments);
  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  void pushNamedAndRemoveUntil(String routeName) =>
      Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  void pop() => Navigator.pop(this);
  void doublePop() {
    Navigator.pop(this);
    Navigator.pop(this);
  }

  void popUntilFirst() => Navigator.popUntil(this, (route) => route.isFirst);

  void popUntilFirstWithResult<T>(T result) {
    final navigator = Navigator.of(this);
    if (navigator.canPop()) {
      navigator.popUntil((route) => route.isFirst);
      if (navigator.canPop()) {
        navigator.pop(result);
      }
    }
  }
}
