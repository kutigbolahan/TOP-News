import 'package:flutter/material.dart';
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier= Provider.of<ThemeNotifier>(context);
    return MaterialApp(
        title: 'Flutter Demo',
      theme: themeNotifier.getThemeData,
        home: SportsPage(),
        debugShowCheckedModeBanner: false,
      );
  }
}
