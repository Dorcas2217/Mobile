import 'package:ex3/notes.dart';
import 'package:ex3/notes_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final displayNotes = [ for ( var note in defaultList ) note];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes session Janvier 2016"),
      ),
      body: Container(
        padding: const EdgeInsets.all(80),
        child: Center(
          child: ListView.builder(
              itemCount: displayNotes.length,
              itemBuilder: (context, index) => NotesRow(
                  note: displayNotes[index]),
          )
        )
      ),
    );
  }
}
