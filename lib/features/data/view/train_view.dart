import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart'; // Import path_provider package
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart' as excelUse; // Use 'excel' as an alias

import '../model/data.dart' as projectData;

class TrainPage extends StatefulWidget {
  const TrainPage({Key? key}) : super(key: key);

  @override
  _TrainPageState createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> {
  String selectedFileName =
      "None"; // Seçilen dosya adını saklamak için bir değişken

  List<String> getFeatureNames() {
    return projectData.Data().toJson().keys.toList();
  }

  Future<void> _sendTrainApi() async {
    try {
      if (selectedFileName == "None") {
        print("Please choose a file before training.");
        return;
      }
      print(selectedFileName);
      Map<String, dynamic> data = {"file_path": selectedFileName};
      final response = await http.post(
        Uri.parse("http://127.0.0.1:5000/train"),
        headers: {
          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials":
              "true", // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        },
        body: jsonEncode(data),
      );
      print(response);
      if (response.statusCode == 200) {
        final Map<String, dynamic> result = json.decode(response.body);
        String message = result["message"] ?? "Successfully trained.";
        print(message);
      } else {
        print("API request failed. Error code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        selectedFileName = file.name; // Seçilen dosya adını güncelle
      });
    } else {
      // Dosya seçme işlemi iptal edildi veya hata oluştu
      print("Dosya seçme işlemi iptal edildi veya hata oluştu.");
    }
  }

  Future<void> _createExampleExcel() async {
    try {
      var excel = excelUse.Excel.createExcel();
      var sheet = excel['Sheet1'];

      List<String> labels = getFeatureNames();
      labels.insert(0, 'diagnosis');

      for (var label in labels) {
        sheet.appendRow([label]);
      }

      final excelFile = await excel.encode() ?? [];
      print(excelFile);
      final directory = await getExternalStorageDirectory();
      print(directory);
      if (directory != null) {
        print(directory);
        final file = File('${directory.path}/example.xlsx');
        await file.writeAsBytes(excelFile);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Excel dosyası oluşturuldu ve kaydedildi.'),
        ));
      } else {
        print('External storage directory is null. Unable to save the file.');
      }
    } catch (e) {
      // Hata yakalandığında buraya gelir
      print('Hata Oluştu: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Excel dosyası oluşturulurken bir hata oluştu.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Choose an Excel file with labels:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Feature Names: ${getFeatureNames().join(', ')}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Selected File: $selectedFileName", // Seçilen dosya adını burada göster
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text("Choose File"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendTrainApi,
              child: Text("Train"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createExampleExcel,
              child: Text("Create Example Excel"),
            ),
          ],
        ),
      ),
    );
  }
}
