import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var nbClicks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First screen")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Hello from first screen."),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => setState(() => nbClicks++),
              child: const Text("click me"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                "/second",
                arguments: nbClicks,
              ),
              child: const Text("Go to second screen"),
            ),
          ],
        ),
      ),
    );
  }
}
