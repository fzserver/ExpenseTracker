import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MLTextDetect extends StatefulWidget {
  @override
  _MLTextDetectState createState() => _MLTextDetectState();
}

class _MLTextDetectState extends State<MLTextDetect> {
  bool _scanning = false;
  String _extractText = '';
  int _scanTime = 0;

  bool _isImageLoaded = false;
  bool _isTextLoaded = false;
  String _text = "";
  File _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tesseract OCR'),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text('Select image'),
              onPressed: () async {
                geTextImage();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> geTextImage() async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _pickedImage = tempStore;
      _isImageLoaded = true;
    });

    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(_pickedImage);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(ourImage);

    String input = readText.text;

    setState(() {
      _extractText = input;
      _isTextLoaded = true;
    });

    // translator.translate(input, to: 'en').then((_translatedText) => {
    //       setState(() {
    //         _text = _translatedText;
    //         _isTextLoaded = true;
    //       })
    //     });
  }
}
