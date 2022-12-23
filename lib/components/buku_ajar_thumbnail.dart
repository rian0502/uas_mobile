import 'package:flutter/material.dart';
import 'package:unila_data/models/buku_ajar.dart';
import 'package:unila_data/sqlite/database_helper.dart';

class BukuAjarThumbnail extends StatefulWidget {
  final Data? bukuAjar;
  const BukuAjarThumbnail({Key? key, this.bukuAjar}) : super(key: key);

  @override
  State<BukuAjarThumbnail> createState() => _BukuAjarThumbnailState();
}

class _BukuAjarThumbnailState extends State<BukuAjarThumbnail> {
  bool isFavorite = false;

  @override
  void initState() {
    DatabaseHelper.db.getIdBuku().then((value) => {
      if (value.contains(widget.bukuAjar!.idBukuAjar))
            {
              setState(() {
                isFavorite = true;
              })
            }
      });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.bukuAjar!.judulBuku!),
        subtitle: Text(widget.bukuAjar!.penerbit!),
        trailing: IconButton(icon:  Icon(Icons.bookmark, color: (isFavorite)? Colors.blue : Colors.grey ,) ,
          onPressed: (){
         setState(() {
           if(isFavorite) {
             DatabaseHelper.db.deleteBuku(widget.bukuAjar!.idBukuAjar!);
             isFavorite = false;
           } else {
             DatabaseHelper.db.addBuku(widget.bukuAjar!);
             isFavorite = true;
           }
         });
        },),
      ),
    );
  }
}
