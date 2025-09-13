import 'dart:convert';

import 'package:flutter_project/network/api_constants.dart';
import 'package:http/http.dart' as http;

import '../models/MovieDataa.dart';
import 'end_points.dart';
abstract class ApiRequests{
  //login
  static Future<http.Response> login(Map<String, dynamic> loginData) async {
    final url = Uri.parse('${ApiConstants.baseUrl}${EndPoints.login}');

    final response = await http.post(
      url,
      headers: {"Content-Type":"application/json"},
      body: jsonEncode(loginData),
    );

    return response;
  }
  //register
  static Future<http.Response> register(Map< String,dynamic> userData) async{
    final url = Uri.parse("${ApiConstants.baseUrl}${EndPoints.register}");

    final response = await http.post(
      url,
      headers: {"Content-Type":"application/json"},
      body: jsonEncode(userData),
    );

    return response;
  }

  //reset password
  static Future<http.Response> resetPassword(Map<String, dynamic> resetData,String token) async {
    final url = Uri.parse("${ApiConstants.baseUrl}${EndPoints.reset_password}");
    final response = await http.patch(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(resetData),
    );
    return response;
  }

  // movie list
  static Future<MovieDataa?> getMovies({int page = 1, int limit = 20}) async {
    final url = Uri.parse(
      "${ApiConstants.moviesBaseUrl}list_movies.json?page=$page&limit=$limit",
    );

    final response = await http.get(url, headers: {
      "Content-Type": "application/json",
    });

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MovieDataa.fromJson(jsonData);
    } else {
      print("Error: ${response.statusCode}, ${response.body}");
      return null;
    }
  }


}
