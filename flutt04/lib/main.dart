import 'package:flutt04/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'first_screen.dart';

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(primarySwatch: Colors.blue),
    initialRoute: "/first",
    routes: {
      "/first": (context) => const FirstScreen(),
      "/second": (context) => const SecondScreen(),
    },
  );
}
