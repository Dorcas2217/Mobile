import 'package:ex6/view/homeScreen.dart';
import 'package:ex6/view/photoScreen.dart';
import 'package:ex6/view_model/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PhotoView>(
      create: (context) => PhotoView(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: "/",
        routes: {
          "/": (context)=>const HomeScreen(),
          "/photo" : (context) => const PhotoScreen(),
        },
      ),
    );
  }

}

