import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = "Click on the button to launch the request.";

  Future<void> _initFilm() async {
    const url = "https://sebstreb.github.io/flutter-fiche-5/films-api/1";
    try {
      setState(() => result = "Loading, please wait…"); // Uncompleted
      var response = await http.get(Uri.parse(url));
      setState(() => result = response.body); // Completed with a value
    } catch (error) {
      setState(() => result = error.toString()); // Completed with an error
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
            Expanded(child: Center(child: Text(result))),
            ElevatedButton(
              onPressed: _initFilm,
              child: const Text("Fetch movie n°1"),
            ),
          ],
        ),
      ),
    );
  }
}
