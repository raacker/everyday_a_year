import "package:flutter/material.dart";
import "dart:async";

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("images/images.jpeg"),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("By Haven", style: TextStyle(fontSize: 20),),
            ),
          ),
        ),
      ),
    );
  }

  void startTime() async {
    var _duration = new Duration(seconds: 2);
    new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed("/MainScreen");
  }
}