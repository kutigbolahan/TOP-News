import 'package:flutter/material.dart';
import 'package:nigeriannews/views/splashscreen.dart';

import 'package:nigeriannews/views/themestate.dart';
import 'package:nigeriannews/viewsmodel/news.dart';
import 'package:provider/provider.dart';



void main() {
  // SharedPreferences.getInstance().then((prefs) {
  //   var darkModeOn= prefs.getBool('darkMode') ?? true;
  // } );
   runApp(
     MultiProvider(providers: 
     [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier(isdarkTheme: true),
        ),
     ],
     child: MyApp())
);
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
   // final themeNotifier= Provider.of<ThemeNotifier>(context);
    return MultiProvider(
  providers: [
     ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier(isdarkTheme: true),
        ),
     ChangeNotifierProvider<HttpService>(
          create: (context) => HttpService(),
        ),
  ],
          child: MaterialApp(
          
        theme: Provider.of<ThemeNotifier>(context).getThemeData,
          
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
         // initialRoute: '/',
          // routes: {
          //   SportsPage.routeName :(context) => SportsPage(),
          //   Splash.routeName :(context) => Splash()
          // },
        ),
    );
  }
}
