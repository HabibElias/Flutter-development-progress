import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:working_with_api/Api_folder/models.dart';

Future<Questions?> fetchdata() async {
  var headers = {
    'x-apihub-key': 'FsyQcqG8srTyDAit7P9FLkHXiwcsx5Vu16ZNnjv33j1yfhMVHM',
    'x-apihub-host': 'Open-Trivia-API.allthingsdev.co',
    'x-apihub-endpoint': 'e39df3a7-4e1c-40c4-8449-b7ff3ed7b16c'
  };
  var request = await http.get(
    Uri.parse(
        'https://Open-Trivia-API.proxy-production.allthingsdev.co/api.php?amount=1&category=24&difficulty=easy'),
    headers: headers,
  );

  if (request.statusCode == 200) {
    return Questions.fromJson(jsonDecode(request.body) as Map<String, dynamic>);
  }
  return null;
}

