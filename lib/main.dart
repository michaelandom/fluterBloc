import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/logic/cubit/counter_cubit.dart';

import 'presentation/screens/home_screen.dart';
import 'presentation/screens/second_screen.dart';
import 'presentation/screens/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (_) => BlocProvider.value(
              value: counterCubit,
              child: HomeScreen(title: "Home Screen", colors: Colors.red),
            ),
        "/SecondScreen": (_) => BlocProvider.value(
              value: counterCubit,
              child: SecondScreen(title: "Second Screen", colors: Colors.blue),
            ),
        "/ThirdScreen": (_) => BlocProvider.value(
              value: counterCubit,
              child:
                  ThirdScreen(title: "Third Screen", colors: Colors.pinkAccent),
            ),
      },
    );
  }
}
