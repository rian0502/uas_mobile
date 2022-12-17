import 'package:flutter/material.dart';
import 'package:unila_data/api/api_unila.dart';
import 'package:unila_data/components/mahasiswa_list_view.dart';



class MahasiswaScreen extends StatefulWidget {
  const MahasiswaScreen({Key? key}) : super(key: key);

  @override
  State<MahasiswaScreen> createState() => _MahasiswaScreenState();
}

class _MahasiswaScreenState extends State<MahasiswaScreen> {
  var _currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
                future: ApiUnila.getMahasiswa(_currentPage),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return MahasiswaListView(mahasiswa: snapshot.data!);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })
        ),
        Padding(padding: const EdgeInsets.only(left: 20, right: 20,top: 5,bottom: 5),child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  if(_currentPage == 1){
                    _currentPage = 1;
                  }else{
                    _currentPage = _currentPage - 1;
                  }
                });
              },
              child: const Text('Back'),
            ),
            Text('Page : $_currentPage'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                setState(() {
                  _currentPage = _currentPage + 1;
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



