import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:url_launcher/url_launcher.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String imageUrl = '';
  String apiLink = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLinkANDIMG();
  }

  Future<void> fetchLinkANDIMG() async {
    try {
      final response = await http
          .get(Uri.parse('https://medait-3.github.io/jsonApiTest/data.json'));
      if (response.statusCode == 200) {
        final parsedData = jsonDecode(response.body);

        setState(() {
          imageUrl = parsedData['image'];
          apiLink = parsedData['link'];
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Widget get myImage {
  //   return imageUrl == null
  //       ? Container()
  //       : Container(
  //           height: 80.0,
  //           decoration: BoxDecoration(
  //             image: DecorationImage(
  //               fit: BoxFit.cover,
  //               image: NetworkImage(imageUrl),
  //             ),
  //           ),
  //         );
  // }

  Widget get mybutton {
    return apiLink == null
        ? Container()
        : ElevatedButton(
            child: Text('Elevated Button'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontStyle: FontStyle.normal),
            ),
            onPressed: () {
              launchUrl(Uri.parse(apiLink));
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(child: myImage),
            Center(child: mybutton)
          ],
        ),
      ),
    );
  }
}
