import 'package:flutter/cupertino.dart';

class PrixNobel extends StatelessWidget {
  final String motivation;
  final String? firstname;
  final String? surname;


  const PrixNobel({Key? key, required this.motivation,  this.firstname = "",  this.surname = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding:  EdgeInsets.all(10),
      child : Column(
          children: [
            Text(motivation),
            Row(
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
