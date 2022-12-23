import 'package:flutter/material.dart';

import '../models/buku_ajar.dart';


class DetailBukuAjar extends StatelessWidget {
  final Data? bukuAjar;
  const DetailBukuAjar({Key? key, this.bukuAjar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buku'),
        ),
        body: Column(
          children: [
            const Center(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 20,top: 20),
                    child: Text(
                      'Detail Buku',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(64, 105, 225, 1),
                      ),
                    ))),
            buildUserInfoDisplay('ISBN',bukuAjar!.isbn ?? '-'),
            buildUserInfoDisplay('Judul',bukuAjar!.judulBuku ?? '-'),
            buildUserInfoDisplay('Penerbit',bukuAjar!.penerbit ?? '-'),
            buildUserInfoDisplay('Tahun Terbit',bukuAjar!.tanggalTerbit ?? '-'),

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
            height: 50,
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
