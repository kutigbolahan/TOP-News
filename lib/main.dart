import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nigeriannews/views/splashscreen.dart';


import 'package:nigeriannews/viewsmodel/news.dart';
import 'package:nigeriannews/widgets/theme.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final themeNotifier= Provider.of<ThemeNotifier>(context);
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider<HttpService>(
          create: (context) => HttpService(),
        ),
        ChangeNotifierProvider<ThemeState>(
          create: (context) => ThemeState(),
        ),
      ],
      child: MaterialAppWithTheme(
       
      ),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  // static const primaryColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    final themeData= Provider.of<ThemeState>(context);
    return MaterialApp(
       debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: themeData.getTheme()
        
        // ThemeData(
        //   primaryColor: primaryColor,
        //   scaffoldBackgroundColor: primaryColor,
        //   canvasColor: Colors.black,
          
         
          
        // ),
        );
  }
}
