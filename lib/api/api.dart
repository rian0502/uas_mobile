import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login.dart';
import '../models/mahasiswa.dart';

class ServiceAPI {
  static const String _baseUrl = 'http://onedata.unila.ac.id/api/live/0.1/auth/login';
  static final dio =  Dio();


  static Future<Login> getLoginAccess() async{
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

  static Future<Mahasiswa> getMahasiswa(int currentPage) async{
    final prefs = await SharedPreferences.getInstance();
    dio.options.headers['Authorization'] = prefs.getString('token');
    var response = await dio.get('http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_mahasiswa?page=$currentPage&limit=50&sort_by=ASC&id_prodi=54BBD27B-2376-4CAE-9951-76EF54BD2CA2');
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.toString());
      return Mahasiswa.fromJson(json);
    } else {
      throw Exception('Failed to load data');
    }

  }

}