import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
String expected = "";



  Future<void> _initDonnes() async{
    const url = "https://sebstreb.github.io/flutter-fiche-5/ghibli-films";
    try{
      setState(() {
        expected = "Loading, please wait...";
      });
      var reponse = await http.get(Uri.parse(url));
      setState(() {
        expected = reponse.body;
      });
    } catch(error){
      setState(() {
        expected = error.toString();
      });
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text("Tutoriel 5")),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(child: Center(child: Text(expected))),
          ElevatedButton(
            onPressed: _initDonnes,
            child: const Text("Fetch movie n°1"),
          ),
        ],
      ),
    ),
  );
}
}
