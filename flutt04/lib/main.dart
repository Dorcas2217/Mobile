import 'package:flutt04/view_model/click_view_model.dart';
import 'package:flutt04/views/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClickViewModel>(
      create: (context) => ClickViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: "/first",
        routes: {
          "/first": (context) => const FirstScreen(),
          "/second": (context) => const SecondScreen(),
        },
      ),
    );
  }

}
