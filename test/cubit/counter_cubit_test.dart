import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_block/logic/cubit/counter_cubit.dart';
import 'package:flutter_block/logic/cubit/internet_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("Counter Test", () {
    InternetCubit internetCubit;
    CounterCubit counterCubit;
    Connectivity connectivity;
    setUp(() {
      connectivity = Connectivity();
      internetCubit = InternetCubit(connectivity: connectivity);
      counterCubit = CounterCubit(internetCubit: internetCubit);
    });

    tearDown(() {
      counterCubit.close();
      internetCubit.close();
    });

    test("initial state for the counterState(0, wasIncremented: true)", () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: true));
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
