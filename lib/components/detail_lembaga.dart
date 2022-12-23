import 'package:flutter/material.dart';

import '../models/lembaga.dart';




class DetailLembaga extends StatelessWidget {
  final Data? lembaga;
  const DetailLembaga({Key? key, this.lembaga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lembaga'),
        ),
        body: Column(
          children: [
            const Center(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 20,top: 20),
                    child: Text(
                      'Detail Lembaga',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(64, 105, 225, 1),
                      ),
                    ))),
            buildUserInfoDisplay('Nama Lembaga',lembaga!.nmLemb ?? '-'),
            buildUserInfoDisplay('Email',lembaga!.email ?? '-'),
            buildUserInfoDisplay('Gelar Lulusan',lembaga!.gelarLulusan ?? '-'),
            buildUserInfoDisplay('No FAX',lembaga!.noFax ?? '-'),
            buildUserInfoDisplay('No Telepon',lembaga!.noTel ?? '-'),
            buildUserInfoDisplay('Akreditasi',lembaga!.statProdi ?? '-'),
            buildUserInfoDisplay('Tanggal Didirikan',lembaga!.tglBerdiri ?? '-'),

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
