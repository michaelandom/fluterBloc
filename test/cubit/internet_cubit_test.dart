import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_block/constants/enums.dart';
import 'package:flutter_block/logic/cubit/internet_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("internet Cubit", () {
    InternetCubit internetCubit;
    Connectivity connectivity;

    setUp(() {
      connectivity = Connectivity();
      internetCubit = InternetCubit(connectivity: connectivity);
    });
    tearDown(() {
      internetCubit.close();
    });
    test("initial state for the internet", () {
      expect(internetCubit.state, InternetLoading());
    });
    blocTest(
      "the cubit should emit a InternetConnected(connectionType:ConnectionType.Wifi) when wifi",
      build: () => InternetCubit(connectivity: connectivity),
      act: (cubit) => cubit.emitInternetConnected(ConnectionType.Wifi),
      expect: [InternetConnected(connectionType: ConnectionType.Wifi)],
    );
    blocTest(
      "the cubit should emit a InternetConnected(connectionType:ConnectionType.Mobile) when Mobile",
      build: () => InternetCubit(connectivity: connectivity),
      act: (cubit) => cubit.emitInternetConnected(ConnectionType.Mobile),
      expect: [InternetConnected(connectionType: ConnectionType.Mobile)],
    );

    blocTest(
      "the cubit should emit a InternetDisconnected() when Disconnected",
      build: () => InternetCubit(connectivity: connectivity),
      act: (cubit) => cubit.emitInternetDisconnected(),
      expect: [InternetDisconnected()],
    );
  });
}
