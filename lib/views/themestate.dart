import 'package:flutter/material.dart';

enum ThemeType{DARK ,LIGHT}

class ThemeState extends ChangeNotifier {
  bool _isDarkTheme = false;

  ThemeState(){
    getTheme().then((type) {
  _isDarkTheme =type == ThemeType.DARK;
  notifyListeners();
    });
  }
  
  ThemeType get theme => _isDarkTheme ?ThemeType.DARK : ThemeType.LIGHT;
   set theme (ThemeType type)=> setTheme(type);

   void setTheme(ThemeType type) async{
     _isDarkTheme = type ==ThemeType.DARK;
     notifyListeners();
   }

  Future<ThemeType> getTheme()async{
    return _isDarkTheme?ThemeType.DARK :ThemeType.LIGHT;
  }
}