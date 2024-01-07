import 'package:flutterstackapp/home/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeProvider {
  HomeProvider();

  Future<QuestionData> getData() async {
    try {
      // Create a Uri object from the API endpoint
      var apiUrl = Uri.parse('http://127.0.0.1:8000/stack/questions/?format=json');
      // Make a GET request to the API endpoint
      var res = await http.get(apiUrl);

      // Check for a successful response
      if (res.statusCode == 200 && res.body.isNotEmpty) {
        // Decode the JSON response
        var decodedJson = jsonDecode(res.body);

        // Create a new QuestionData instance
        QuestionData qd = QuestionData();

        // Initialize the 'questions' list in QuestionData
        qd.questions = [];

        // Iterate over the decoded JSON and add Questions objects to the 'questions' list
        for (var json in decodedJson) {
          qd.questions.add(Questions.fromJson(json));
        }

        // Return the populated QuestionData object
        return qd;
      } else {
        // If the server did not return a 200 OK response or the response body is empty,
        // throw an exception with the status code and reason phrase.
        throw Exception('Failed to load data: ${res.statusCode} - ${res.reasonPhrase}');
      }
    } catch (error) {
      // Handle exceptions
      print('HTTP Request Error: $error');
      throw Exception('Failed to load data: $error');
    }
  }
}
