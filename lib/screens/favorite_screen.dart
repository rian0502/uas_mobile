import 'package:flutter/material.dart';
import 'package:unila_data/components/fav_list_view.dart';
import 'package:unila_data/models/buku_ajar.dart';
import 'package:unila_data/sqlite/database_helper.dart';


class FavoriteScreen extends StatefulWidget {
  int? currentTab = 0;
  FavoriteScreen({Key? key, this.currentTab}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Data> books = [];

  @override
  void initState() {
    DatabaseHelper.db.getAllBuku().then((value) => books = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Buku Ajar Favorite",
        ),
        // automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
          future: DatabaseHelper.db.getAllBuku(),
          builder: (ontext, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return FavoriteListView(bukuAjar: snapshot.data, currentTab: widget.currentTab);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }


}
