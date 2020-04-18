import 'package:flutter/material.dart';
import 'package:nigeriannews/views/splashscreen.dart';


import 'package:nigeriannews/viewsmodel/news.dart';
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
      ],
      child: MaterialAppWithTheme(
       
      ),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
   static const primaryColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
       debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: primaryColor,
          canvasColor: Colors.black,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Colors.white54),
             
          // primaryColor: Color(0xffde03),
          ),
        ));
  }
}
