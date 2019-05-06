import "package:flutter/material.dart";

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[],
        ),
      body: Text("Hello"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint("FAB pressed"),
      ),
    );
  }
}