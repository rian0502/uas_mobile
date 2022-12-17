import 'package:flutter/material.dart';
import 'package:unila_data/models/mahasiswa.dart';

import 'mahasiswa_thumbnail.dart';

class MahasiswaListView extends StatelessWidget {
  const MahasiswaListView({Key? key, this.mahasiswa}) : super(key: key);
  final Mahasiswa? mahasiswa;
  @override
  Widget build(BuildContext context) {

    return Padding(padding: const EdgeInsets.only(left: 15, right: 15, top: 16),
    child: ListView.builder(
        itemCount: mahasiswa!.data!.length,
        itemBuilder:  (context, index) {
          final mhs = mahasiswa!.data![index];
          return MahasiswaThumbnail(mahasiswa: mhs,);
        }
        )

    );
  }
}
