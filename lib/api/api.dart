import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../models/login.dart';

class ServiceAPI {
  static const String _baseUrl = 'http://onedata.unila.ac.id/api/live/0.1/auth/login';

  static Future<Login> getLoginAccess() async{
    var dio = Dio();
    var response = await dio.post(_baseUrl, data: {
      "id_aplikasi": "948df317-78f7-4b92-a53f-0a56215e07de",
      "username": "mhs-testing",
      "password": "unilajaya"
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.toString());
      return Login.fromJson(json);
    } else {
      throw Exception('Failed to load data');
    }
  }

}