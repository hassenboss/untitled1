import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:untitled1/ar_two.dart';
import 'package:untitled1/test.dart';

import 'ar_one.dart';
import 'hh.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(home());
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ar(cameras),
      routes: {
        '/page1': (context) => ar(cameras),
        '/page2': (context) => ar2(),
        '/page3': (context) => ar2(),
      },
    );
  }
}
