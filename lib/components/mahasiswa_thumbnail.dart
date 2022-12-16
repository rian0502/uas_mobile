import 'package:flutter/material.dart';


class MahasiswaThumbnail extends StatefulWidget {

  const MahasiswaThumbnail({Key? key}) : super(key: key);

  @override
  State<MahasiswaThumbnail> createState() => _MahasiswaThumbnailState();
}

class _MahasiswaThumbnailState extends State<MahasiswaThumbnail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Nama'),
          Text('NPM'),
          Text('Semester'),
          Row(
            children: [
              Text('IPK'),
              Text('IPS')
            ],
          ),
          Text('Status')
        ],
      ),
    );
  }
}
