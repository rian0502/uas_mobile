import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/buku_ajar.dart';
import '../models/dosen.dart';
import '../models/lembaga.dart';
import '../models/login.dart';
import '../models/mahasiswa.dart';

class ApiUnila {
  static const String _baseUrl =
      'http://onedata.unila.ac.id/api/live/0.1/auth/login';
  static final dio = Dio();

  static Future<Login> getLoginAccess() async {
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

  static Future<Mahasiswa> getMahasiswa(int currentPage) async {
    var token = await getLoginAccess().then((value) => value.data!.token);
    dio.options.headers['Authorization'] = "bearer${token}";
    var response = await dio.get(
        'http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_mahasiswa?page=$currentPage&limit=50&sort_by=ASC&id_prodi=54BBD27B-2376-4CAE-9951-76EF54BD2CA2');
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.toString());
      return Mahasiswa.fromJson(json);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<Lembaga> getLembaga() async {
    var token = await getLoginAccess().then((value) => value.data!.token);
    dio.options.headers['Authorization'] = "bearer${token}";
    var response = await dio
        .get('http://onedata.unila.ac.id/api/live/0.1/lembaga/daftar_lembaga');
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.toString());
      return Lembaga.fromJson(json);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<Dosen> getDosen() async {
    var token = await getLoginAccess().then((value) => value.data!.token);
    dio.options.headers['Authorization'] = "bearer${token}";
    var response = await dio.get(
        'http://onedata.unila.ac.id/api/live/0.1/mata_kuliah/list_dosen_ajar?page=1&limit=50&id_kelas=9DCF2A1B-61BE-4E72-8F93-022D58D0F17D');

    final Map<String, dynamic> json = jsonDecode(response.toString());
    return Dosen.fromJson(json);
  }

  static Future<BukuAjar> getBukuAjar(page) async{
    var token = await getLoginAccess().then((value) => value.data!.token);
    dio.options.headers['Authorization'] = "bearer${token}";
    var response = await dio.get('http://onedata.unila.ac.id/api/live/0.1/buku_ajar/daftar?page=$page&limit=25&sort_by=ASC');
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.toString());
      return BukuAjar.fromJson(json);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
