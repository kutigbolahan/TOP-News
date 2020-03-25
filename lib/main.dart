import 'package:flutter/material.dart';
import 'package:nigeriannews/views/splashscreen.dart';
import 'package:nigeriannews/views/sports.dart';
import 'package:nigeriannews/views/themestate.dart';
import 'package:provider/provider.dart';



void main() {
  // SharedPreferences.getInstance().then((prefs) {
  //   var darkModeOn= prefs.getBool('darkMode') ?? true;
  // } );
   runApp(MultiProvider(
  providers: [
     ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier(isdarkTheme: true),
        )
  ],
  child: MyApp()
)
);
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final themeNotifier= Provider.of<ThemeNotifier>(context);
    return MaterialApp(
        
      theme: themeNotifier.getThemeData,
        
        debugShowCheckedModeBanner: false,
        home: IntroScreen(),
       // initialRoute: '/',
        // routes: {
        //   SportsPage.routeName :(context) => SportsPage(),
        //   Splash.routeName :(context) => Splash()
        // },
      );
  }
}
