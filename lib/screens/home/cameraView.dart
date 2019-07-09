import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class CameraView extends StatefulWidget {
  CameraView({
    Key key,
  }) : super(key: key);

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  // CameraController controller;
  // List<CameraDescription> cameras;

  // Future<void> _loadCameras() async {
  //   try {
  //     cameras = await availableCameras();
  //   } on CameraException catch (e) {
  //     print({e.code, e.description});
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   this._loadCameras().then((_) {
  //     controller = CameraController(cameras[1], ResolutionPreset.medium);

  //     controller.initialize().then((_) {
  //       if (!mounted) {
  //         return;
  //       }
  //       setState(() {});
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.photo_camera),
        onPressed: () async {
          final imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
          final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
          final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
          final VisionText visionText = await textRecognizer.processImage(visionImage);
          String text = visionText.text;
          for (TextBlock block in visionText.blocks) {
            final Rect boundingBox = block.boundingBox;
            final List<Offset> cornerPoints = block.cornerPoints;
            final String text = block.text;
            final List<RecognizedLanguage> languages = block.recognizedLanguages;

            for (TextLine line in block.lines) {
              // Same getters as TextBlock
              for (TextElement element in line.elements) {
                // Same getters as TextBlock
                print(element.text);
              }
            }
          }
          textRecognizer.close();
        },
      ),
    );
    // if (controller == null)
    //   return Center(
    //     child: Text('Loading...'),
    //   );

    // if (!controller.value.isInitialized) {
    //   return Container();
    // }

    // return Column(
    //   children: <Widget>[
    //     AspectRatio(aspectRatio: controller.value.aspectRatio, child: CameraPreview(controller)),
    //     Expanded(
    //       child: Center(
    //         child: IconButton(
    //           icon: Icon(Icons.photo_camera),
    //           onPressed: () async {
    //             final imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    //             final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
    //             final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    //             final VisionText visionText = await textRecognizer.processImage(visionImage);
    //             String text = visionText.text;
    //             for (TextBlock block in visionText.blocks) {
    //               final Rect boundingBox = block.boundingBox;
    //               final List<Offset> cornerPoints = block.cornerPoints;
    //               final String text = block.text;
    //               final List<RecognizedLanguage> languages = block.recognizedLanguages;

    //               for (TextLine line in block.lines) {
    //                 // Same getters as TextBlock
    //                 for (TextElement element in line.elements) {
    //                   // Same getters as TextBlock
    //                 }
    //               }
    //             }
    //             textRecognizer.close();
    //           },
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
