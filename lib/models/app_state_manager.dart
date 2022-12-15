import 'package:flutter/material.dart';


class Menu{
  static const int mahasiswa = 0;
  static const int dosen = 1;
  static const int lembaga = 2;
}

class AppStateManager extends ChangeNotifier{
  int _selectedMenu = Menu.mahasiswa;
  int get selectedMenu => _selectedMenu;

  void setSelectedMenu(int index){
    _selectedMenu = index;
    notifyListeners();
  }

  void gotoTab(int index){
    _selectedMenu = index;
    notifyListeners();
  }
  
}