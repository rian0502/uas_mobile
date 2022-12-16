import 'dart:convert';

Mahasiswa mahasiswaFromJson(String str) => Mahasiswa.fromJson(json.decode(str));

class Mahasiswa {
  bool? status;
  String? message;
  double? latency;
  String? currentPage;
  String? itemsPerPage;
  String? sortBy;
  Data? data;

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
    currentPage = json['current_page'];
    itemsPerPage = json['items_per_page'];
    sortBy = json['sort_by'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['latency'] = this.latency;
    data['current_page'] = this.currentPage;
    data['items_per_page'] = this.itemsPerPage;
    data['sort_by'] = this.sortBy;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  Mahasiswa.toMap(Map<String, dynamic> map) {
    status = map['status'];
    message = map['message'];
    latency = map['latency'];
    currentPage = map['current_page'];
    itemsPerPage = map['items_per_page'];
    sortBy = map['sort_by'];
    data = map['data'] != null ? Data.fromMap(map['data']) : null;
  }

  Mahasiswa.fromMap(Map<String, dynamic> map) {
    status = map['status'];
    message = map['message'];
    latency = map['latency'];
    currentPage = map['current_page'];
    itemsPerPage = map['items_per_page'];
    sortBy = map['sort_by'];
    data = map['data'] != null ? Data.fromMap(map['data']) : null;
  }

}

class Data{
  String? id_peserta_didik;
  String? id_reg_pd;
  String? NPM;
  String? nama_mahasiswa;
  String? program_studi;
  String? id_prodi;
  String? periode_masuk;
  String? semester_sekarang;
  String? ips;
  String? ipk;
  String? total_sks;
  String? status;
  String? waktu_data_ditambahkan;
  String? terakhir_diubah;

  Data({this.id_peserta_didik, this.id_reg_pd, this.NPM, this.nama_mahasiswa,
  this.program_studi, this.id_prodi, this.periode_masuk, this.semester_sekarang,
  this.ips, this.ipk, this.total_sks, this.status, this.waktu_data_ditambahkan,
  this.terakhir_diubah});

  Data.fromJson(Map<String, dynamic> json){
    id_peserta_didik = json['id_peserta_didik'];
    id_reg_pd = json['id_reg_pd'];
    NPM = json['NPM'];
    nama_mahasiswa = json['nama_mahasiswa'];
    program_studi = json['program_studi'];
    id_prodi = json['id_prodi'];
    periode_masuk = json['periode_masuk'];
    semester_sekarang = json['semester_sekarang'];
    ips = json['ips'];
    ipk = json['ipk'];
    total_sks = json['total_sks'];
    status = json['status'];
    waktu_data_ditambahkan = json['waktu_data_ditambahkan'];
    terakhir_diubah = json['terakhir_diubah'];
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_peserta_didik'] = this.id_peserta_didik;
    data['id_reg_pd'] = this.id_reg_pd;
    data['NPM'] = this.NPM;
    data['nama_mahasiswa'] = this.nama_mahasiswa;
    data['program_studi'] = this.program_studi;
    data['id_prodi'] = this.id_prodi;
    data['periode_masuk'] = this.periode_masuk;
    data['semester_sekarang'] = this.semester_sekarang;
    data['ips'] = this.ips;
    data['ipk'] = this.ipk;
    data['total_sks'] = this.total_sks;
    data['status'] = this.status;
    data['waktu_data_ditambahkan'] = this.waktu_data_ditambahkan;
    data['terakhir_diubah'] = this.terakhir_diubah;
    return data;
  }
  Data.fromMap(Map<String, dynamic> map){
    id_peserta_didik = map['id_peserta_didik'];
    id_reg_pd = map['id_reg_pd'];
    NPM = map['NPM'];
    nama_mahasiswa = map['nama_mahasiswa'];
    program_studi = map['program_studi'];
    id_prodi = map['id_prodi'];
    periode_masuk = map['periode_masuk'];
    semester_sekarang = map['semester_sekarang'];
    ips = map['ips'];
    ipk = map['ipk'];
    total_sks = map['total_sks'];
    status = map['status'];
    waktu_data_ditambahkan = map['waktu_data_ditambahkan'];
    terakhir_diubah = map['terakhir_diubah'];
  }
  Data.toMap(Map<String, dynamic> map){
    id_peserta_didik = map['id_peserta_didik'];
    id_reg_pd = map['id_reg_pd'];
    NPM = map['NPM'];
    nama_mahasiswa = map['nama_mahasiswa'];
    program_studi = map['program_studi'];
    id_prodi = map['id_prodi'];
    periode_masuk = map['periode_masuk'];
    semester_sekarang = map['semester_sekarang'];
    ips = map['ips'];
    ipk = map['ipk'];
    total_sks = map['total_sks'];
    status = map['status'];
    waktu_data_ditambahkan = map['waktu_data_ditambahkan'];
    terakhir_diubah = map['terakhir_diubah'];
  }

}