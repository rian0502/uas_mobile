import 'package:flutter/material.dart';
import 'package:unila_data/components/lembaga_list_view.dart';
import '../api/api_unila.dart';

class LembagaScreen extends StatelessWidget {
  const LembagaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiUnila.getLembaga(),
        builder: (context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return LembagaListView(lembaga: snapshot.data!);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
