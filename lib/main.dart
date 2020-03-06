import 'package:flutter/material.dart';
import 'package:nigeriannews/views/themestate.dart';
import 'package:provider/provider.dart';
import 'package:nigeriannews/views/hompage.dart';

void main() => runApp(
  ChangeNotifierProvider<ThemeState>(
    create: (context) =>ThemeState(),
    child: MyApp())
  );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeState>(context).theme == ThemeType.DARK
          ? ThemeData.dark()
          : ThemeData.light(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
