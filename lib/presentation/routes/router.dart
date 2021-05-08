import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_block/presentation/screens/home_screen.dart';
import 'package:flutter_block/presentation/screens/second_screen.dart';
import 'package:flutter_block/presentation/screens/third_screen.dart';

class AppRouter {
  Route onGenerateRouteSetting(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) =>
                HomeScreen(title: "Home Screen", colors: Colors.red));
        break;
      case "/SecondScreen":
        return MaterialPageRoute(
            builder: (_) =>
                SecondScreen(title: "Second Screen", colors: Colors.blue));
        break;

      case "/ThirdScreen":
        return MaterialPageRoute(
            builder: (_) =>
                ThirdScreen(title: "Third Screen", colors: Colors.pinkAccent));
        break;
      default:
        return null;
    }
  }
}
