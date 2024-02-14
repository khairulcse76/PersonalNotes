import 'package:flutter/material.dart';
import 'package:mynotes/activity/MyHomeActivity.dart';
import 'package:mynotes/helper/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Ubuntu',
      ),
      color: bgColor,
      home: const MyHomeActivity(),

    );
  }
}
