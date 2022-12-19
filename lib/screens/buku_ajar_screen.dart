import 'package:flutter/material.dart';

class BukuAjarScreen extends StatefulWidget {
  const BukuAjarScreen({Key? key}) : super(key: key);

  @override
  State<BukuAjarScreen> createState() => _BukuAjarScreenState();
}

class _BukuAjarScreenState extends State<BukuAjarScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Buku Ajar'),
    );
  }
}
