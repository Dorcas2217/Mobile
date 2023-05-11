import 'package:ex7/homeScreen.dart';
import 'package:ex7/view_model/SosViewModel.dart';
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
    return ChangeNotifierProvider<SosViewModel>(
      create: (context) => SosViewModel(),
      child: MaterialApp(
        title: 'SOS App',
        theme: ThemeData(primarySwatch: Colors.purple),
        initialRoute: "/home",
        routes: {
          "/home": (context) => const HomeScreen(),
        },
      ),
    );
  }
}

