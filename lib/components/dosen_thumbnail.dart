import 'package:flutter/material.dart';
import '../models/dosen.dart';

class DosenThumbnail extends StatelessWidget {
  final Data? dosen;
  const DosenThumbnail({Key? key, this.dosen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(dosen!.nmDosen!.toString()),
        subtitle: Text(dosen!.nmMk!.toString()),
      ),
    );
  }
}
