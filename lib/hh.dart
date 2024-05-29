import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:untitled1/ar_two.dart';
import 'package:untitled1/test.dart';

import 'ar_one.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ar(cameras)),
              );
            },
            child: null,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ar2()),
              );
            },
            child: null,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ar2()),
              );
            },
            child: null,
          )
        ]),
      ),
    );
  }
}
