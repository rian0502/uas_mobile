
import 'dart:convert';

BukuAjar bukuAjarFromJson(String str) => BukuAjar.fromJson(json.decode(str));

class BukuAjar {
  bool? status;
  String? message;
  double? latency;
  List<Data>? data;

  BukuAjar({this.status, this.message, this.latency, this.data});

  BukuAjar.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    latency = json['latency'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['latency'] = this.latency;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? idBukuAjar;
  String? judulBuku;
  String? isbn;
  String? tanggalTerbit;
  String? penerbit;
  String? waktuDataDitambahkan;
  String? terakhirDiubah;

  Data(
      {this.idBukuAjar,
        this.judulBuku,
        this.isbn,
        this.tanggalTerbit,
        this.penerbit,
        this.waktuDataDitambahkan,
        this.terakhirDiubah});

  Data.fromJson(Map<String, dynamic> json) {
    idBukuAjar = json['id_buku_ajar'];
    judulBuku = json['judul_buku'];
    isbn = json['isbn'];
    tanggalTerbit = json['tanggal_terbit'];
    penerbit = json['penerbit'];
    waktuDataDitambahkan = json['waktu_data_ditambahkan'];
    terakhirDiubah = json['terakhir_diubah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_buku_ajar'] = this.idBukuAjar;
    data['judul_buku'] = this.judulBuku;
    data['isbn'] = this.isbn;
    data['tanggal_terbit'] = this.tanggalTerbit;
    data['penerbit'] = this.penerbit;
    data['waktu_data_ditambahkan'] = this.waktuDataDitambahkan;
    data['terakhir_diubah'] = this.terakhirDiubah;
    return data;
  }
  Map<String, dynamic> toMap() {
    return {
      'id_buku_ajar': idBukuAjar,
      'judul_buku': judulBuku,
      'isbn': isbn,
      'tanggal_terbit': tanggalTerbit,
      'penerbit': penerbit,
      'waktu_data_ditambahkan': waktuDataDitambahkan,
      'terakhir_diubah': terakhirDiubah,
    };
  }
  // to map
  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      idBukuAjar: map['id_buku_ajar'],
      judulBuku: map['judul_buku'],
      isbn: map['isbn'],
      tanggalTerbit: map['tanggal_terbit'],
      penerbit: map['penerbit'],
      waktuDataDitambahkan: map['waktu_data_ditambahkan'],
      terakhirDiubah: map['terakhir_diubah'],
    );
  }

}