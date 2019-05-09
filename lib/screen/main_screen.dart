import "package:flutter/material.dart";
import "../data/everyday_log.dart";

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  List<EverydayLog> _logs = [
    EverydayLog("link", "Guitar", "2019-05-09", "Nice"),
    EverydayLog("link", "Guitar", "2019-05-09", "Nice"),
    EverydayLog("link", "Guitar", "2019-05-09", "Nice"),
    EverydayLog("link", "Guitar", "2019-05-09", "Nice"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Be a guitar hero!"),
          actions: <Widget>[],
        ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: getLogs(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint("FAB pressed"),
      ),
    );
  }

  ListView getLogs() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        if (_logs.length * 2 > position) {

          if (position.isOdd) {
            return Divider();
          }

          int index = position ~/ 2;

          EverydayLog log = _logs[index];
          return generateItem(log);
        } else {
          
        }
      },
    );
  }

  Widget generateItem(EverydayLog log) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(log.date),
              Text(log.date),
            ],
          ),
          Container(
            width: 45,
            height: 45,
            padding: EdgeInsets.all(2.0),
            child: Image.asset("images/rose.jpg"),
          ),
          Column(
            children: <Widget>[
              Text(log.title),
              Text(log.description),
            ],
          ),
        ],
      ),
    );
  }
}