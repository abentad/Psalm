import 'package:http/http.dart' as http;

void main() {
  _fetchData();
}

_fetchData() async {
  String baseUrl = 'https://api.scripture.api.bible/v1/bibles';
  String url =
      'https://api.scripture.api.bible/v1/bibles/de4e12af7f28f599-01/verses/PSA.91.1?content-type=json&include-notes=false&include-titles=true&include-chapter-numbers=true&include-verse-numbers=true&include-verse-spans=false&use-org-id=false';
  var response = await http.get(
    url,
    headers: {
      "accept": "application/json",
      "api-key": "35e58f287386e6abe96a8b77890e8155"
    },
  );
  print(response.body);
}
