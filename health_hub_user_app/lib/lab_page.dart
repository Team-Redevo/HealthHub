import 'dart:io';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class LabPage extends StatefulWidget {
  const LabPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LabPage> createState() => _LabPageState();
}

class _LabPageState extends State<LabPage> {
  @override
  void initState() {
    super.initState();
  }

  bool isCtVisible = true;
  Color ctBackColor = primaryColor;
  Color ctIconColor = Colors.white;
  bool isBloodVisible = false;
  Color bloodBackColor = cardBackgroundColor;
  Color bloodIconColor = primaryColor;
  bool isRadiologyVisible = false;
  Color radiologyBackColor = cardBackgroundColor;
  Color radiologyIconColor = primaryColor;
  bool isDNAVisible = false;
  Color DNABackColor = cardBackgroundColor;
  Color DNAIconColor = primaryColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(
          children: [
            Icon(Icons.biotech, size: 50, color: primaryColor),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Lab results",
                    style: TextStyle(
                        fontSize: 30,
                        color: primaryColor,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text('Result types',
                      style: TextStyle(
                          fontSize: 17,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isCtVisible = true;
                  ctBackColor = primaryColor;
                  ctIconColor = Colors.white;
                  isBloodVisible = false;
                  bloodBackColor = cardBackgroundColor;
                  bloodIconColor = primaryColor;
                  isRadiologyVisible = false;
                  radiologyBackColor = cardBackgroundColor;
                  radiologyIconColor = primaryColor;
                  isDNAVisible = false;
                  DNABackColor = cardBackgroundColor;
                  DNAIconColor = primaryColor;
                });
              },
              child: Container(
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: ctBackColor,
                ),
                child: Column(
                  children: [
                    Icon(Symbols.rib_cage, size: 40, color: ctIconColor),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                setState(() {
                  isCtVisible = false;
                  ctBackColor = cardBackgroundColor;
                  ctIconColor = primaryColor;
                  isBloodVisible = true;
                  bloodBackColor = primaryColor;
                  bloodIconColor = Colors.white;
                  isRadiologyVisible = false;
                  radiologyBackColor = cardBackgroundColor;
                  radiologyIconColor = primaryColor;
                  isDNAVisible = false;
                  DNABackColor = cardBackgroundColor;
                  DNAIconColor = primaryColor;
                });
              },
              child: Container(
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: bloodBackColor,
                ),
                child: Column(
                  children: [
                    Icon(Symbols.fluid, size: 40, color: bloodIconColor),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                setState(() {
                  isCtVisible = false;
                  ctBackColor = cardBackgroundColor;
                  ctIconColor = primaryColor;
                  isBloodVisible = false;
                  bloodBackColor = cardBackgroundColor;
                  bloodIconColor = primaryColor;
                  isRadiologyVisible = true;
                  radiologyBackColor = primaryColor;
                  radiologyIconColor = Colors.white;
                  isDNAVisible = false;
                  DNABackColor = cardBackgroundColor;
                  DNAIconColor = primaryColor;
                });
              },
              child: Container(
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: radiologyBackColor,
                ),
                child: Column(
                  children: [
                    Icon(Symbols.radiology, size: 40, color: radiologyIconColor)
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                setState(() {
                  isCtVisible = false;
                  ctBackColor = cardBackgroundColor;
                  ctIconColor = primaryColor;
                  isBloodVisible = false;
                  bloodBackColor = cardBackgroundColor;
                  bloodIconColor = primaryColor;
                  isRadiologyVisible = false;
                  radiologyBackColor = cardBackgroundColor;
                  radiologyIconColor = primaryColor;
                  isDNAVisible = true;
                  DNABackColor = primaryColor;
                  DNAIconColor = Colors.white;
                });
              },
              child: Container(
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: DNABackColor,
                ),
                child: Column(
                  children: [
                    Icon(Symbols.genetics, size: 40, color: DNAIconColor)
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        // CT
        Visibility(
          visible: isCtVisible,
          child: Column(children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageLabelling()),
                );
              },
              child: Text('Computed Tomography',
                  style: TextStyle(
                      fontSize: 20,
                      color: primaryTextColor,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
          ]),
        ),
        // Blood
        Visibility(
          visible: isBloodVisible,
          child: Column(children: [
            Text('Blood test',
                style: TextStyle(
                    fontSize: 20,
                    color: primaryTextColor,
                    fontWeight: FontWeight.bold)),
          ]),
        ),
        // Radiology
        Visibility(
          visible: isRadiologyVisible,
          child: Column(children: [
            Text('Radiology',
                style: TextStyle(
                    fontSize: 20,
                    color: primaryTextColor,
                    fontWeight: FontWeight.bold)),
          ]),
        ),
        // DNA
        Visibility(
          visible: isDNAVisible,
          child: Column(children: [
            Text('DNA test',
                style: TextStyle(
                    fontSize: 20,
                    color: primaryTextColor,
                    fontWeight: FontWeight.bold)),
          ]),
        ),
      ]),
    ));
  }
}

class ImageLabelling extends StatefulWidget {
  const ImageLabelling({Key? key}) : super(key: key);

  @override
  _ImageLabellingState createState() => _ImageLabellingState();
}

Future<String> getModelPath(String asset) async {
  final path = '${(await getApplicationSupportDirectory()).path}/$asset';
  await Directory(dirname(path)).create(recursive: true);
  final file = File(path);
  if (!await file.exists()) {
    final byteData = await rootBundle.load(asset);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  }
  return file.path;
}

class _ImageLabellingState extends State<ImageLabelling> {
  late InputImage _inputImage;
  File? _pickedImage;

  final ImagePicker _imagePicker = ImagePicker();

  String text = "";

  pickImageFromGallery() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    setState(() {
      _pickedImage = File(image.path);
    });
    _inputImage = InputImage.fromFile(_pickedImage!);
    identifyImage(_inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Image Labelling'),
            if (_pickedImage != null)
              Image.file(
                _pickedImage!,
                height: 300,
                width: double.infinity,
                fit: BoxFit.contain,
              )
            else
              Container(
                height: 300,
                color: Colors.black,
                width: double.infinity,
              ),
            Expanded(
              child: Container(),
            ),
            Text(text, style: TextStyle(fontSize: 20)),
            Expanded(child: Container()),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Pick Image"),
                onPressed: () {
                  pickImageFromGallery();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void identifyImage(InputImage inputImage) async {
    final modelPath = await getModelPath('assets/modelCT2.tflite');
    print(modelPath);
    final _options = LocalLabelerOptions(
      confidenceThreshold: 0.8,
      modelPath: modelPath,
    );
    final imageLabeler = ImageLabeler(options: _options);
    final List<ImageLabel> image = await imageLabeler.processImage(inputImage);

    if (image.isEmpty) {
      setState(() {
        text = "Cannot identify the image";
      });
      return;
    }

    for (ImageLabel img in image) {
      setState(() {
        text = "Label: ${img.label}, Confidence: ${img.confidence}";
      });
    }

    imageLabeler.close();
  }
}
