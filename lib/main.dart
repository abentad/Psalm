import 'package:Psalm/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xff3a1e5d),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Psalms',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff7f7f7),
        primaryColor: Color(0xff3a1e5d),
        secondaryHeaderColor: Color(0xfffc4d4d),
        accentColor: Color(0xffeebf18),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
