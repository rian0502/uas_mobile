
import 'package:flutter/material.dart';
import 'package:unila_data/models/lembaga.dart';

class LembagaThumbnail extends StatelessWidget {
  final Data? lembaga;
  const LembagaThumbnail({Key? key, this.lembaga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(lembaga!.nmLemb!.toString()),
      subtitle: Text(lembaga!.nmJnsSms!.toString()),
    );
  }
}
