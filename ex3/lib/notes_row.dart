import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'notes.dart';

class NotesRow extends StatelessWidget {
  final Notes note ;
  final void Function(Notes) deleteNote;

  const NotesRow({
    Key? key,
    required this.note,
    required this.deleteNote})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.titre),
      subtitle: Text(note.texte),
      textColor: Colors.green,
      trailing: IconButton(
        icon: const Icon (Icons.delete),
        onPressed:  () {deleteNote(note);},
      ),
    );
  }
}
