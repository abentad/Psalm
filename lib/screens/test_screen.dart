import 'dart:convert';
import 'dart:math';

import 'package:Psalm/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String finalVerse = '';
  int ch;
  int ve;
  _fetchData() async {
    // String baseUrl = 'https://api.scripture.api.bible/v1/bibles';
    // int chapter = Random().nextInt(150) + 1;
    int chapter = 91;
    int verseNumber = Random().nextInt(15) + 1;
    print(verseNumber);
    // int verseNumber = 1;
    String url =
        'https://api.scripture.api.bible/v1/bibles/de4e12af7f28f599-01/verses/PSA.${chapter.toString()}.${verseNumber.toString()}?content-type=json&include-notes=false&include-titles=true&include-chapter-numbers=true&include-verse-numbers=true&include-verse-spans=false&use-org-id=false';
    var response = await http.get(
      url,
      headers: {
        "accept": "application/json",
        "api-key": "35e58f287386e6abe96a8b77890e8155"
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String verse = data['data']['content'][1]['items'][1]['text'].toString();
      setState(() {
        finalVerse = verse;
        ch = chapter;
        ve = verseNumber;
      });
      print(verse);
    } else {
      print(response.statusCode);
    }
    print(response.body);
    print(chapter);
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyContainer(
            borderColor: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    finalVerse,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Psalm ${ch.toString()} : ${ve.toString()}',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              _fetchData();
            },
            child: Text('Random'),
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
// ballnumber = Random().nextInt(5) + 1;
