import 'package:flutter/material.dart';

extension NavigationContext on BuildContext {
  void pushNamed(String routeName, {Object? arguments}) =>
      Navigator.pushNamed(this, routeName, arguments: arguments);
  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  void pushNamedAndRemoveUntil(String routeName) =>
      Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  void pop() => Navigator.pop(this);
}
