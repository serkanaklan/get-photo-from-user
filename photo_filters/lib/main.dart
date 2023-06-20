import 'package:flutter/material.dart';
import 'package:photo_filters/service/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final fals = false;
  void goNextPage() {
    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: fals,
      theme: ThemeData.dark(),
      home: Homepage(),
    );
  }
}
