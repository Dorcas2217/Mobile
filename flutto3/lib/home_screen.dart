import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  final colors = {
    "red": Colors.red,
    "green": Colors.green,
    "blue": Colors.blue,
    "yellow": Colors.yellow,
    "black": Colors.black,
    "white": Colors.white,
  };

  var color = "blue";
  var switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tutoriel 3")),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: colors[color] ?? Colors.grey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("red"),
                Switch(
                  value: color == "green",
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.red.withOpacity(0.4),
                  onChanged: (value) =>
                      setState(() => color = value ? "green" : "red"),
                ),
                const Text("green"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


