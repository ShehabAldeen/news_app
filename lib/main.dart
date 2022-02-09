import 'package:flutter/material.dart';
import 'package:newsapp2/home/home_page.dart';
import 'package:newsapp2/search/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      routes: {
        HomePage.routName: (buildContext) => HomePage(),
        SearchScreen.routName: (buildContext) => SearchScreen(),
      },
      initialRoute: HomePage.routName,
    );
  }
}

class MyThemeData {
  static final lightTheme = ThemeData(
      primarySwatch: Colors.green,
      textTheme: TextTheme(
        headline5: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ));
}
