import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:read_pdf_text/read_pdf_text.dart';
import 'package:file_picker/file_picker.dart';

class BloodTestUploader extends StatefulWidget {
  @override
  _BloodTestUploaderState createState() => _BloodTestUploaderState();
}

class _BloodTestUploaderState extends State<BloodTestUploader> {
  String _pdfText = '';
  String _resultText = '';

  Future<String> generateText(String messages) async {
    var res = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ....api_key....',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            'role': 'user',
            'content':
                "Return only the values which are outside the provided limits and what disease they can suggest, from the results of the following blood test: " +
                    messages
          }
        ],
      }),
    );
    var result = jsonDecode(res.body)['choices'][0]['message']['content'];
    return result;
  }

  Future<String> getPDFtext(String path) async {
    String text = "";
    try {
      text = await ReadPdfText.getPDFtext(path);
    } on PlatformException {}
    return text;
  }

  Future<void> _uploadPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      String? path = result.files.single.path;
      if (path != null) {
        String pdfText = await getPDFtext(path);
        String resultText = await generateText(pdfText);
        setState(() {
          _pdfText = pdfText;
          _resultText = resultText;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Test Uploader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _uploadPDF,
              child: Text('Upload PDF'),
            ),
            SizedBox(height: 16),
            Text('PDF Text: $_pdfText'),
            SizedBox(height: 16),
            Text('Result Text: $_resultText'),
          ],
        ),
      ),
    );
  }
}