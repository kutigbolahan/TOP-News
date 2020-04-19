import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeState with ChangeNotifier{
  ThemeData darkTheme =ThemeData.dark();

  ThemeData lightTheme = ThemeData(
    primaryColor: Colors.black,//Color(0xfff6f6ef),
    canvasColor: Colors.black,//Color(0xffff6600),
    accentColor:Colors.black,// Color(0xff843c0b),
    scaffoldBackgroundColor: Colors.black,//Color(0xffff6f6ef)//.withOpacity(0.6)
    //textSelectionColor: Colors.black
      //  primaryColor: Colors.black,
      //     scaffoldBackgroundColor: Colors.black,
      //     canvasColor: Colors.black,
  );

  ThemeData _themeData;
  bool isDark = false;

  ThemeState(){
    _themeData= lightTheme;
  }
  ThemeData getTheme()=> _themeData;

  setTheme(){
    if (!isDark) {
      _themeData = darkTheme;
    }else{
      _themeData=lightTheme;
    }
    isDark = !isDark;
  }
}