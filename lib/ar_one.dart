import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/hh.dart';

void main() => runApp(ar(cameras));

class ar extends StatelessWidget {
  final List<CameraDescription> cameras;
  ar(this.cameras);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(cameras),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<CameraDescription> cameras;
  MyHomePage(this.cameras);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ArCoreController arCoreController;
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.cameras[0],
      ResolutionPreset.medium,
    );
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VR and Camera'),
      ),
      body: Stack(
        children: <Widget>[
          ArCoreView(
            onArCoreViewCreated: _onARViewCreated,
            enableUpdateListener: true, // تفعيل تحديثات الإطار
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height / 2,
            child: CameraPreview(_controller),
          ),
        ],
      ),
    );
  }

  void _onARViewCreated(ArCoreController controller) {
    arCoreController = controller;
    // أضف تفاصيل الـ AR هنا
  }
}
