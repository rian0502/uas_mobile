import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  int? currentTab = 0;
  Home({Key? key, this.currentTab}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unila Data',
        style: Theme.of(context).textTheme.headline6,),
      ),
      body: const Center(
        child: Text('Halaman Home')
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        onTap: (index){

        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Mahasiswa'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Dosen'),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: 'Lembaga'),
        ],
      ),
    );
  }
}
