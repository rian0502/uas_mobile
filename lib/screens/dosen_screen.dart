
import 'package:flutter/material.dart';
import 'package:unila_data/api/api_unila.dart';

import '../components/dosen_list_view.dart';

class DosenScreen extends StatelessWidget {
  const DosenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiUnila.getDosen(),
        builder: (context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return DosenListView(dosen: snapshot.data!);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
