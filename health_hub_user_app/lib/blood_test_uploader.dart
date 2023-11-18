import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:read_pdf_text/read_pdf_text.dart';
import 'package:file_picker/file_picker.dart';
class Blood_Test_Uploader {
  final List<Map<String, String>> messages = [];

  Future<String> getPDFtext(String path) async {
    String text = "";
    try {
      text = await ReadPdfText.getPDFtext(path);
    } on PlatformException {
      print('Failed to get PDF text.');
    }
    return text;
  }

  Future<void> sendMessage(String prompt) async {
    String response = await chatGPTAPI(prompt);
    setState(() {
      messages.add({
        'role': 'user',
        'content': prompt,
      });
      messages.add({
        'role': 'assistant',
        'content': response,
      });
    });
    // send response to db
  }

  // the chatGPTAPI function
  Future<String> chatGPTAPI(String prompt) async {
    const String openAiKey = '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';

    messages.add({
      'role': 'user',
      'content': prompt,
    });

    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        }),
      );

      if (res.statusCode == 200) {
        String content = jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });

        return content;
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }
}