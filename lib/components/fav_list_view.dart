import 'package:flutter/material.dart';
import 'package:unila_data/sqlite/database_helper.dart';
import '../models/buku_ajar.dart';
import 'detail_buku_ajar.dart';

class FavoriteListView extends StatefulWidget {
  final List<Data>? bukuAjar;
  const FavoriteListView({Key? key, this.bukuAjar}) : super(key: key);

  @override
  State<FavoriteListView> createState() => _FavoriteListViewState();
}

class _FavoriteListViewState extends State<FavoriteListView> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: widget.bukuAjar!.length,
        itemBuilder: (context, index) {
          return Card(
            child: GestureDetector(child: ListTile(
              title: Text(widget.bukuAjar![index].judulBuku!),
              subtitle: Text(widget.bukuAjar![index].penerbit!),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    DatabaseHelper.db.deleteBuku(widget.bukuAjar![index].idBukuAjar!);

                  });
                },
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailBukuAjar(bukuAjar: widget.bukuAjar![index])));
            },),
          );
        });
  }
}
