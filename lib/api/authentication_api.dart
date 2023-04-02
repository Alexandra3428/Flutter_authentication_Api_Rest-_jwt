import 'package:logger/logger.dart';
import 'package:meta/meta.dart' show required;
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthenticationAPI {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<void> register({
    required String email,
    required String password,
    required String password_confirmation,
  }) async {
    try {
      await Future.delayed(Duration(seconds: 2));

      var headers = {
        'Authorization': 'c5LTA6WPbMwHhEabYu77nN9cn4VcMj',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      var request = http.Request('GET',
          Uri.parse('http://localhost:3000/api_rest_curl/register_curl.php'));
      request.bodyFields = {
        'email': "",
        'password': "",
        'password_confirmation': "",
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
    required String email,
    required String password,
  }) async {
    var headers = {
      'Authorization': 'c5LTA6WPbMwHhEabYu77nN9cn4VcMj',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'GET', Uri.parse('http://localhost:3000/api_rest_curl/login_curl.php'));
    request.bodyFields = {
      'email': 'developer@test.local',
      'password': 'mC*f*IrvUW^RPJ8z',
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
