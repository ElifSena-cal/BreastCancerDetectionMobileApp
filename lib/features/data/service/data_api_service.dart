// data_api_service.dart

import 'dart:convert';

import 'package:http/http.dart' as http;

class DataApiService {
  final String baseUrl;
  DataApiService({required this.baseUrl});

  Future<String> predict(Map<String, dynamic> jsonData) async {
    try {
      List<double> doubleData = jsonData.values
          .where((value) => value is double)
          .map((value) => value as double)
          .toList();

      print(doubleData);
      final response = await http.post(
        Uri.parse('$baseUrl/predict'),
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
        body: jsonEncode({"input_data": doubleData}),
      );

      if (response.statusCode == 200) {
        print("${response.body.toString()}");
        String responseBody = response.body.toString();

// JSON yanıtını ayrıştırın
        Map<String, dynamic> jsonResponse = json.decode(responseBody);

// "prediction" anahtarının değerini alın
        String prediction = jsonResponse["prediction"];

        return prediction;
      } else {
        return "API request failed. Error Code: ${response.statusCode}";
      }
    } catch (e) {
      print(e);
      return "Error: $e";
    }
  }
}
