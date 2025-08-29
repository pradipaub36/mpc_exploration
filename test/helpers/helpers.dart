import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_app.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        home: widget,
      ),
    );
  }
}