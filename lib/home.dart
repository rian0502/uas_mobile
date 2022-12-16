import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unila_data/screen/mahasiswa_screen.dart';


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
    MahasiswaScreen(),
    MahasiswaScreen(),
    MahasiswaScreen(),
  ];

  @override
  void initState() {
    super.initState();
    getCurrentIndex();
    //create db
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
          'Fooderlich',
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
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To Buy',
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
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/profile_pics/person_stef.jpeg',
          ),
        ),
        onTap: () {
          context.goNamed('profile', params: {
            'tab': '$currentTab',
          });
        },
      ),
    );
  }
}
