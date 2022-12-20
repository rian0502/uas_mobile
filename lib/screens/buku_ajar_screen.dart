import 'package:flutter/material.dart';
import 'package:unila_data/api/api_unila.dart';

import '../components/buku_ajar_list_view.dart';

class BukuAjarScreen extends StatefulWidget {
  const BukuAjarScreen({Key? key}) : super(key: key);

  @override
  State<BukuAjarScreen> createState() => _BukuAjarScreenState();
}

class _BukuAjarScreenState extends State<BukuAjarScreen> {
  int _currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
                future: ApiUnila.getBukuAjar(_currentPage),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return BukuAjarListView(bukuAjar: snapshot.data!);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
        Padding(padding: const EdgeInsets.only(left: 20, right: 20,top: 5,bottom: 5),child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  if(_currentPage == 1){
                  }else{
                    _currentPage = _currentPage - 1;
                  }
                });
              },
              child: const Text('Prev'),
            ),
            Text('$_currentPage'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                setState(() {

                    if(_currentPage == 21) {}
                    else{
                      _currentPage = _currentPage + 1;
                    }

                });
              },
              child: const Text('Next'),
            ),
          ],
        ),)
      ],
    );
  }
}
