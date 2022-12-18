import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unila_data/models/mahasiswa.dart';

class MahasiswaThumbnail extends StatelessWidget {
  final Data? mahasiswa;
  const MahasiswaThumbnail({Key? key, this.mahasiswa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          mahasiswa!.periodeMasuk!.substring(0, 4).toString(),
          style: GoogleFonts.salsa(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      title: Text(mahasiswa!.nPM!.toString()),
      subtitle: Text(mahasiswa!.namaMahasiswa!.toString()),
    ));
  }
}
