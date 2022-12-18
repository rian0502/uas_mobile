import 'package:flutter/cupertino.dart';
import 'package:unila_data/models/dosen.dart';

import 'dosen_thumbnail.dart';

class DosenListView extends StatelessWidget {
  final Dosen? dosen;
  const DosenListView({Key? key, this.dosen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 15, right: 15, top: 16),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder:  (context, index) {
            return GestureDetector(
              child: DosenThumbnail(),
              onTap: () {
                print(dosen!.response!.data![index].nmDosen);
              },
            );
          }
      )
    );
  }
}
