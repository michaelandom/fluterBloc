import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/logic/cubit/counter_cubit.dart';
import 'package:flutter_block/presentation/screens/home_screen.dart';
import 'package:flutter_block/presentation/screens/second_screen.dart';
import 'package:flutter_block/presentation/screens/third_screen.dart';

class AppRouter {
  CounterCubit counterCubit = CounterCubit();

  Route onGenerateRouteSetting(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: counterCubit,
                  child: HomeScreen(title: "Home Screen", colors: Colors.red),
                ));
        break;
      case "/SecondScreen":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: counterCubit,
                  child:
                      SecondScreen(title: "Second Screen", colors: Colors.blue),
                ));
        break;

      case "/ThirdScreen":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: counterCubit,
                  child: ThirdScreen(
                      title: "Third Screen", colors: Colors.pinkAccent),
                ));
        break;
      default:
        return null;
    }
  }

  void dispose() {
    counterCubit.close();
  }
}
