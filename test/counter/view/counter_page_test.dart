import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mpc_exploration/counter/counter.dart';

import '../../helpers/helpers.dart';

class MockCounterCubit extends Mock implements CounterCubit {}

void main() {
  group('CounterPage', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = MockCounterCubit();
      when(() => counterCubit.state).thenReturn(0);
    });

    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(
        BlocProvider<CounterCubit>.value(
          value: counterCubit,
          child: const CounterPage(),
        ),
      );
      expect(find.byType(CounterView), findsOneWidget);
    });
  });

  group('CounterView', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = MockCounterCubit();
      when(() => counterCubit.state).thenReturn(0);
    });

    testWidgets('renders current count', (tester) async {
      await tester.pumpApp(
        BlocProvider<CounterCubit>.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      );
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('calls increment when + button is pressed', (tester) async {
      await tester.pumpApp(
        BlocProvider<CounterCubit>.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.add));
      verify(() => counterCubit.increment()).called(1);
    });

    testWidgets('calls decrement when - button is pressed', (tester) async {
      await tester.pumpApp(
        BlocProvider<CounterCubit>.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.remove));
      verify(() => counterCubit.decrement()).called(1);
    });
  });
}