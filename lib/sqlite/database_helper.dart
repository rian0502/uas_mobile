import 'dart:async';
import 'package:path/path.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:unila_data/models/buku_ajar.dart';

class DatabaseHelper{
  final String id = 'id_buku_ajar';
  final String judul_buku = 'judul_buku';
  final String isbn = 'isbn';
  final String tanggal_terbit = 'tanggal_terbit';
  final String penerbit = 'penerbit';
  final String waktu_data_ditambahkan = 'waktu_data_ditambahkan';
  final String terakhir_diubah = 'terakhir_diubah';
  final String tablename = 'buku_ajar';
  //private constructor
  DatabaseHelper._();
  static final DatabaseHelper db = DatabaseHelper._();
  //setup database
  static Database? _database;
  //create database
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  //create datahase
  Future<Database> initDB() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'unila.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    var sql = 'CREATE TABLE $tablename($id TEXT PRIMARY KEY,'
        '$judul_buku TEXT, $isbn TEXT, $tanggal_terbit TEXT, $penerbit TEXT,'
        '$waktu_data_ditambahkan TEXT, $terakhir_diubah TEXT)';
    await db.execute(sql);
  }
  
  Future<int> addBuku(Data buku) async{
    final dbClient = await database;
    final res = await dbClient!.insert(tablename, buku.toMap());
    print("berhasil ditambahkan");
    return res;
  }
  
  Future<int> deleteBuku(String idBuku) async{
    final dbClient = await database;
    final res = await dbClient!.delete(tablename, where: '$id = ?', whereArgs: [idBuku]);
    print("berhasil menghapus");
    return res;
  }

  Future<List> getIdBuku() async{
    final dbClient = await database;
    final res = await dbClient!.query(tablename, columns: [id]);
    List<String> list = res.isNotEmpty ? res.map((c) => c['id_buku_ajar'].toString()).toList() : [];
    print(list.runtimeType);
    return list;
  }



}