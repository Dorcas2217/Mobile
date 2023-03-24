import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'notes.dart';

class NotesRow extends StatelessWidget {
  final Notes note ;

  const NotesRow({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.titre),
      subtitle: Text(note.texte),
      textColor: Colors.green,
      trailing: Icon(Icons.gpp_good),
    );
  }
}
