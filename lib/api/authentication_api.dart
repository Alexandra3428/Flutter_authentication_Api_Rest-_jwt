import 'package:logger/logger.dart';
import 'package:meta/meta.dart' show required;
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthenticationAPI {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<void> register({
    required String username_instructor,
    required String email_instructor,
    required String password_instructor,
  }) async {
    try {
      await Future.delayed(Duration(seconds: 2));

      var headers = {
        'Authorization': 'c5LTA6WPbMwHhEabYu77nN9cn4VcMj',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'http://localhost:3000/instructors?register=true&suffix=instructor'));
      request.bodyFields = {
        'username_instructor': username_instructor,
        'email_instructor': email_instructor,
        'password_instructor': password_instructor,
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
      _logger.i(response.reasonPhrase);
    } catch (e) {
      _logger.e(e);
    }
  }

  Future<void> login({
    required String email_instructor,
    required String password_instructor,
  }) async {
    var headers = {
      'Authorization': 'c5LTA6WPbMwHhEabYu77nN9cn4VcMj',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://localhost:3000/instructors?login=true&suffix=instructor'));
    request.bodyFields = {
      'email_instructor': '',
      'password_instructor': '',
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
