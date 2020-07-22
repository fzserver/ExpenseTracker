import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tesseract_ocr/tesseract_ocr.dart';

class TextDetectScreen extends StatefulWidget {
  @override
  _TextDetectScreenState createState() => _TextDetectScreenState();
}

class _TextDetectScreenState extends State<TextDetectScreen> {
  bool _scanning = false;
  String _extractText = '';
  int _scanTime = 0;

  bool _isImageLoaded = false;
  bool _isTextLoaded = false;
  String _text = "";
  File _pickedImage;
  String amn = "loading..";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tesseract OCR'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text('Select image'),
                    onPressed: () async {
                      geTextImage();
                      // var file =
                      //     await FilePicker.getFilePath(type: FileType.image);
                      // _scanning = true;
                      // setState(() {});

                      // var watch = Stopwatch()..start();
                      // _extractText = await TesseractOcr.extractText(file);
                      // _scanTime = watch.elapsedMilliseconds;

                      // _scanning = false;
                      // setState(() {});
                    },
                  ),
                  // It doesn't spin, because scanning hangs thread for now
                  _scanning ? CircularProgressIndicator() : Icon(Icons.done),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Scanning took $_scanTime ms',
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                  child: Row(
                    children: [
                      Text(
                        'Total : '
                      ),
                      Text(
                        amn
                      ),

                    ],
              )),
            ],
          ),
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
    RegExp exp = RegExp(r"(\w+)");
    String amount = "Total";

    setState(() {
      _extractText = input;
      _isTextLoaded = true;
    });
    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        if (exp.hasMatch(line.text)) {
          amount = line.text;
        }
      }
    }

    if (this.mounted) {
      setState(() {
        amn = amount;
      });
    }

  }
}
