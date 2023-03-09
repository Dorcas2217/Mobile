import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrixNobel extends StatelessWidget {
  final String motivation;
  final String? firstname;
  final String? surname;


  const PrixNobel({Key? key, required this.motivation,  this.firstname = "",  this.surname = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding:  EdgeInsets.all(30),
      color: Colors.cyanAccent,
      child : Column(
          children: [
            Text(
                textAlign: TextAlign.left,


                motivation),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(surname!),
                Text(" "),
                Text(firstname!),
              ],
            )
          ]
      ),
    );;
  }
}
