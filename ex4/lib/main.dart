import 'package:ex4/view/article_screen.dart';
import 'package:ex4/view/form_screen.dart';
import 'package:ex4/view/list_screen.dart';
import 'package:ex4/view_model/var_etat.dart';
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
    return ChangeNotifierProvider<VarEtat>(
      create: (context) => VarEtat(),
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
       initialRoute: "/list",
      routes: {
        "/list": (context)=>const ListScreen(),
        "/article" : (context) => const ArticleScreen(),
        "/form": (context) => const FormScreen()
      },
    ),
    );
  }
}


