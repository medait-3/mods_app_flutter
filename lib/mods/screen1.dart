import 'dart:async';

import 'package:connect_google_drive/mods/myapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => App()));
  }

  startTime() async {
    var duration = new Duration(seconds: 12);
    return new Timer(duration, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("mods skibidi"),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: LinearProgressIndicator(
                backgroundColor: Colors.green,
                valueColor: AlwaysStoppedAnimation(Colors.black),
                minHeight: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
