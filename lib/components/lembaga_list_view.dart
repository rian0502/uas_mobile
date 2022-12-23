import 'package:flutter/material.dart';
import 'package:unila_data/models/lembaga.dart';
import 'detail_lembaga.dart';
import 'lembaga_thumbnail.dart';

class LembagaListView extends StatelessWidget {
  final Lembaga? lembaga;
  const LembagaListView({Key? key, this.lembaga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 16),
        child: ListView.builder(
            itemCount: lembaga!.data!.length,
            itemBuilder: (context, index) {
              return GestureDetector(child: LembagaThumbnail(lembaga: lembaga!.data![index]),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailLembaga(lembaga: lembaga!.data![index])));
              },);}
            )
    );
  }
}
