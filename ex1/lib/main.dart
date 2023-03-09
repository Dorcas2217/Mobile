import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget nobelPrises = Container(
      padding:  EdgeInsets.all(10),
      child : Column(
        children: [
          Text(laureate1["motivation"]!,),
          Row(
            children: [
              Text(laureate1["surname"]!),
              Text(" "),
              Text(laureate1["firstname"]!),

            ],
          )
        ]
        ),
      );


    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('View a Nobel Prise '),
        ),
        body: ListView(
          children: [
            Text('Prises'),
            nobelPrises,
          ]
        ),
      ),
    );
  }
}

const laureate1 = {
  "id": "819",
  "firstname": "Al",
  "surname": "Gore",
  "motivation":
  "\"for their efforts to build up and disseminate greater knowledge about man-made climate change, and to lay the foundations for the measures that are needed to counteract such change\"",
  "share": "2"
};
