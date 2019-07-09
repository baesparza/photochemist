import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraView extends StatefulWidget {
  CameraView({
    Key key,
  }) : super(key: key);

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController controller;
  List<CameraDescription> cameras;

  Future<void> _loadCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      print({e.code, e.description});
    }
  }

  @override
  void initState() {
    super.initState();
    this._loadCameras().then((_) {
      controller = CameraController(cameras[1], ResolutionPreset.medium);

      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null)
      return Center(
        child: Text('Loading...'),
      );

    if (!controller.value.isInitialized) {
      return Container();
    }

    return Column(
      children: <Widget>[
        AspectRatio(aspectRatio: controller.value.aspectRatio, child: CameraPreview(controller)),
        Expanded(
          child: Center(
            child: IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () {
                Firestore.instance
                    .collection('Test')
                    .document()
                    .setData({'title': 'title', 'author': 'author'});
              },
            ),
          ),
        )
      ],
    );
  }
}
