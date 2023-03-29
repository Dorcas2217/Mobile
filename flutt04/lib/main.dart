import 'package:flutt04/views/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'views/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: "/first",
      routes: {
        "/first": (context) => const FirstScreen(),
        "/second": (context) => const SecondScreen(),
      },
    );
  }
}
