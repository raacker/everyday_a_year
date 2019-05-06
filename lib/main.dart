import "package:flutter/material.dart";
import "screen/splash_screen.dart";
import "screen/main_screen.dart";

void main() => runApp(EverydayAYear());

class EverydayAYear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new SplashScreen(),
        routes: <String, WidgetBuilder> {
          "/MainScreen": (BuildContext context) => new MainScreen(),
        },
      );
  }
}