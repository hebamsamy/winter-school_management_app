import 'package:flutter/material.dart';
import 'package:school_management_app/Screens/AddStudentScreen.dart';

import 'Screens/ListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School',
      initialRoute: "/",
      routes: {
        "/": (context) => ListScreen(),
        "add": (context) => AddStudentScreen(),
      },
    );
  }
}
