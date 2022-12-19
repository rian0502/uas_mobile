import 'dart:convert';

import 'package:http/http.dart';

Dosen dosenFromJson(String str) => Dosen.fromJson(json.decode(str));
Response responseFromJson(String str) => Response.fromJson(json.decode(str));
class Dosen {
  bool? status;
  String? message;
  double? latency;
  String? error;
  Response? response;

  Dosen({this.status, this.message, this.latency, this.error, this.response});

  Dosen.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    latency = json['latency'];
    error = json['error'];
    response = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['message'] = this.message;
    data['latency'] = this.latency;
    data['error'] = this.error;
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  List<Data>? data;
  Pagination? pagination;

  Response({this.data, this.pagination});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Data {
  String? idAjar;
  String? nmDosen;
  String? nmMk;
  String? prodi;
  String? sksSubstansiTotal;
  String? sksTatapMukaSubstansi;
  String? sksPraktikumSubstansi;
  String? sksPraktikumLapSubstansi;
  String? sksSimSubstansi;
  String? jmlTatapMukaRencana;
  String? jmlTatapMukaRealisasi;
  Null? jmlMhs;
  String? waktuDataDitambahkan;
  String? terakhirDiubah;

  Data(
      {this.idAjar,
        this.nmDosen,
        this.nmMk,
        this.prodi,
        this.sksSubstansiTotal,
        this.sksTatapMukaSubstansi,
        this.sksPraktikumSubstansi,
        this.sksPraktikumLapSubstansi,
        this.sksSimSubstansi,
        this.jmlTatapMukaRencana,
        this.jmlTatapMukaRealisasi,
        this.jmlMhs,
        this.waktuDataDitambahkan,
        this.terakhirDiubah});

  Data.fromJson(Map<String, dynamic> json) {
    idAjar = json['id_ajar'];
    nmDosen = json['nm_dosen'];
    nmMk = json['nm_mk'];
    prodi = json['prodi'];
    sksSubstansiTotal = json['sks_substansi_total'];
    sksTatapMukaSubstansi = json['sks_tatap_muka_substansi'];
    sksPraktikumSubstansi = json['sks_praktikum_substansi'];
    sksPraktikumLapSubstansi = json['sks_praktikum_lap_substansi'];
    sksSimSubstansi = json['sks_sim_substansi'];
    jmlTatapMukaRencana = json['jml_tatap_muka_rencana'];
    jmlTatapMukaRealisasi = json['jml_tatap_muka_realisasi'];
    jmlMhs = json['jml_mhs'];
    waktuDataDitambahkan = json['waktu_data_ditambahkan'];
    terakhirDiubah = json['terakhir_diubah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_ajar'] = this.idAjar;
    data['nm_dosen'] = this.nmDosen;
    data['nm_mk'] = this.nmMk;
    data['prodi'] = this.prodi;
    data['sks_substansi_total'] = this.sksSubstansiTotal;
    data['sks_tatap_muka_substansi'] = this.sksTatapMukaSubstansi;
    data['sks_praktikum_substansi'] = this.sksPraktikumSubstansi;
    data['sks_praktikum_lap_substansi'] = this.sksPraktikumLapSubstansi;
    data['sks_sim_substansi'] = this.sksSimSubstansi;
    data['jml_tatap_muka_rencana'] = this.jmlTatapMukaRencana;
    data['jml_tatap_muka_realisasi'] = this.jmlTatapMukaRealisasi;
    data['jml_mhs'] = this.jmlMhs;
    data['waktu_data_ditambahkan'] = this.waktuDataDitambahkan;
    data['terakhir_diubah'] = this.terakhirDiubah;
    return data;
  }
}

class Pagination {
  String? currentPage;
  String? itemsPerPage;

  Pagination({this.currentPage, this.itemsPerPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    itemsPerPage = json['itemsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['itemsPerPage'] = this.itemsPerPage;
    return data;
  }
}