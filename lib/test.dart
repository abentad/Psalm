import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

void main() {
  _fetchData();
}

_fetchData() async {
  String baseUrl = 'https://api.scripture.api.bible/v1/bibles';
  // int chapter = Random().nextInt(150) + 1;
  int chapter = 91;
  // int verseNumber = Random().nextInt(4) + 1;
  int verseNumber = 1;
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
    print(verse);
  } else {
    print(response.statusCode);
  }
  print(response.body);
  print(chapter);
  print(verseNumber);
}
