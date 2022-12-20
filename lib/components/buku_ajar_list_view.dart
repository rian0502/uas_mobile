import 'package:flutter/material.dart';
import 'package:unila_data/components/buku_ajar_thumbnail.dart';

import '../models/buku_ajar.dart';


class BukuAjarListView extends StatelessWidget {
  final BukuAjar? bukuAjar;
  const BukuAjarListView({Key? key, this.bukuAjar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bukuAjar!.data!.length,
        itemBuilder: (context, index) {
      return BukuAjarThumbnail(bukuAjar: bukuAjar!.data![index]);
    });
  }
}
