import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<T?> to<T>(Widget page) {
    return Navigator.push<T>(this, MaterialPageRoute(builder: (_) => page));
  }

  void back<T extends Object?>([T? result]) {
    Navigator.pop<T>(this, result);
  }
}
