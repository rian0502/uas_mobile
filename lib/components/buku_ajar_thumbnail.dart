import 'package:flutter/material.dart';
import 'package:unila_data/models/buku_ajar.dart';

class BukuAjarThumbnail extends StatefulWidget {
  final Data? bukuAjar;
  const BukuAjarThumbnail({Key? key, this.bukuAjar}) : super(key: key);

  @override
  State<BukuAjarThumbnail> createState() => _BukuAjarThumbnailState();
}

class _BukuAjarThumbnailState extends State<BukuAjarThumbnail> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.bukuAjar!.judulBuku!),
        subtitle: Text(widget.bukuAjar!.penerbit!),
      ),
    );
  }
}
