import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mpc_exploration/app/app.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(App), findsOneWidget);
    });
  });
}