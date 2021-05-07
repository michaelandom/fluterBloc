import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_block/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CounterTest", () {
    CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test("initial state for the counterState(0)", () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
      "the cubit should emit a counterState(counterValue:1,wasIncremented:true) when incremented",
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      "the cubit should emit a counterState(counterValue:-1,wasIncremented:false) when decremented",
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
