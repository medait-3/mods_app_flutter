import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'reponse.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> fetchDataAndNavigate() async {
    final response = await http
        .get(Uri.parse('https://medait-3.github.io/jsonApiTest/data.json'));
    if (response.statusCode == 200) {
      Map<String, dynamic> parsedJson = json.decode(response.body);
      final apiResponse = ApiResponse.fromJson(parsedJson);

      if (apiResponse.name) {
        Navigator.pushReplacementNamed(context, '/screen1');
      } else {
        Navigator.pushReplacementNamed(context, '/screen2');
      }
    } else {
      // Handle error, e.g., show an error message or retry logic
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
