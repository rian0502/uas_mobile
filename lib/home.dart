import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unila_data/screens/dosen_screen.dart';
import 'package:unila_data/screens/explore_screen.dart';
import 'package:unila_data/screens/grocery_screen.dart';
import 'package:unila_data/screens/lembaga_screen.dart';
import 'package:unila_data/screens/mahasiswa_screen.dart';
import 'package:unila_data/screens/recipes_screen.dart';
import 'package:unila_data/sqlite/database_helper.dart';


class Home extends StatefulWidget {
  const Home({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  final int currentTab;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const String prefSelectedIndexKey = 'selectedIndex';
  static List<Widget> pages = <Widget>[
    const MahasiswaScreen(),
    const DosenScreen(),
    const LembagaScreen(),
  ];

  @override
  void initState() {
    super.initState();
    getCurrentIndex();
    //create db
    DatabaseHelper.db.database;
  }

  void getCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSelectedIndexKey)) {
      setState(() {
        final index = prefs.getInt(prefSelectedIndexKey);
        if (index != null) {
          _selectedIndex = index;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'One Data Unila',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          favoritButton(widget.currentTab),
          profileButton(widget.currentTab),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,


        onTap: (index) {

          setState(() {
            _selectedIndex = index;
          });
          saveCurrentIndex();
          /*
          Provider.of<AppStateManager>(context, listen: false).goToTab(index);
          context.goNamed(
            'home',
            params: {
              'tab': '$index',
            },
          );*/
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mahasiswa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Dosen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Lembaga',
          ),

        ],
      ),
    );
  }

  void saveCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(prefSelectedIndexKey, _selectedIndex);
  }

  Widget favoritButton(int currentTab) {
      return IconButton(
        icon: const Icon(Icons.favorite, color: Colors.red,),
        onPressed: () {
          context.goNamed('favorite', params: {
            'tab': '$currentTab',
          });
        },
      );
  }
  Widget profileButton(int currentTab) {
    return IconButton(
      icon: const Icon(Icons.settings, color: Colors.red,),
      onPressed: () {
        context.goNamed('profile', params: {
          'tab': '$currentTab',
        });
      },
    );
  }
}
