import 'package:flutter/material.dart';
import 'package:intropage/pages/home_page.dart';
import 'package:intropage/pages/intro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
      routes: {
        IntroPage.id: (context)=> IntroPage(),
        HomePage.id: (context)=> HomePage(),
      },
    );
  }
}

