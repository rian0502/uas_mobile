import 'package:flutter/material.dart';
import 'package:unila_data/models/mahasiswa.dart';

class DetailMahasiswa extends StatelessWidget {
  final Data? mahasiswa;
  const DetailMahasiswa({Key? key, this.mahasiswa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Mahasiswa'),
        ),
        body: Column(
          children: [
            const Center(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 20,top: 20),
                    child: Text(
                      'Profile Mahasiswa',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(64, 105, 225, 1),
                      ),
                    ))),
            buildUserInfoDisplay('Nama',mahasiswa!.namaMahasiswa!),
            buildUserInfoDisplay('NPM',mahasiswa!.nPM!),
            buildUserInfoDisplay('Program Study',mahasiswa!.programStudi!),
            buildUserInfoDisplay('Periode Masuk',mahasiswa!.periodeMasuk!),
            buildUserInfoDisplay('Status',mahasiswa!.status!),
            buildUserInfoDisplay('Semester',mahasiswa!.semesterSekarang!),
            buildUserInfoDisplay('IPK',mahasiswa!.ipk!),
            buildUserInfoDisplay('IPS',mahasiswa!.ips!),
            buildUserInfoDisplay('SKS',mahasiswa!.totalSks!),
          ],
        ));
  }
}
Widget buildUserInfoDisplay(String title,String getValue) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        Container(
            width: 350,
            height: 40,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ))),
            child: Row(children: [
              Expanded(
                  child: Text(
                getValue,
                style: const TextStyle(fontSize: 16, height: 1.4),
              )),
            ]))
      ],
    ));
