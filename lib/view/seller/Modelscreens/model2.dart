
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Model1 extends StatelessWidget {
  const Model1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Model Viewer')),
        body: const ModelViewer(
          backgroundColor: Colors.transparent,
          src: 'assets/images/plant.glb',
          alt: 'Plant',
          ar: true,
          cameraControls: true,
          autoRotate: true,
          arPlacement: ArPlacement.floor,
        ),
      ),
    );
  }
}