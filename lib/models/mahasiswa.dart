import 'dart:convert';

Mahasiswa mahasiswaFromJson(String str) => Mahasiswa.fromJson(json.decode(str));

class Mahasiswa {
  bool? status;
  String? message;
  double? latency;
  String? currentPage;
  String? itemsPerPage;
  String? sortBy;
  List<Data>? data;

  Mahasiswa(
      {this.status,
        this.message,
        this.latency,
        this.currentPage,
        this.itemsPerPage,
        this.sortBy,
        this.data});

  Mahasiswa.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    latency = json['latency'];
    currentPage = json['currentPage'];
    itemsPerPage = json['itemsPerPage'];
    sortBy = json['sortBy'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['latency'] = latency;
    data['currentPage'] = currentPage;
    data['itemsPerPage'] = itemsPerPage;
    data['sortBy'] = sortBy;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class Data{
  String? idPesertaDidik;
  String? idRegPd;
  String? nPM;
  String? namaMahasiswa;
  String? programStudi;
  String? idProdi;
  String? periodeMasuk;
  String? semesterSekarang;
  String? ips;
  String? ipk;
  String? totalSks;
  String? status;
  String? waktuDataDitambahkan;
  String? terakhirDiubah;

  Data(
      {this.idPesertaDidik,
        this.idRegPd,
        this.nPM,
        this.namaMahasiswa,
        this.programStudi,
        this.idProdi,
        this.periodeMasuk,
        this.semesterSekarang,
        this.ips,
        this.ipk,
        this.totalSks,
        this.status,
        this.waktuDataDitambahkan,
        this.terakhirDiubah});

  Data.fromJson(Map<String, dynamic> json) {
    idPesertaDidik = json['id_peserta_didik'];
    idRegPd = json['id_reg_pd'];
    nPM = json['NPM'];
    namaMahasiswa = json['nama_mahasiswa'];
    programStudi = json['program_studi'];
    idProdi = json['id_prodi'];
    periodeMasuk = json['periode_masuk'];
    semesterSekarang = json['semester_sekarang'];
    ips = json['ips'];
    ipk = json['ipk'];
    totalSks = json['total_sks'];
    status = json['status'];
    waktuDataDitambahkan = json['waktu_data_ditambahkan'];
    terakhirDiubah = json['terakhir_diubah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_peserta_didik'] = idPesertaDidik;
    data['id_reg_pd'] = idRegPd;
    data['NPM'] = nPM;
    data['nama_mahasiswa'] = namaMahasiswa;
    data['program_studi'] = programStudi;
    data['id_prodi'] = idProdi;
    data['periode_masuk'] = periodeMasuk;
    data['semester_sekarang'] = semesterSekarang;
    data['ips'] = ips;
    data['ipk'] = ipk;
    data['total_sks'] = totalSks;
    data['status'] = status;
    data['waktu_data_ditambahkan'] = waktuDataDitambahkan;
    data['terakhir_diubah'] = terakhirDiubah;
    return data;
  }

}