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

  void changeStateButton(note){
    setState(() {
      displayNotes.remove(note);
    });
  }

  final controllerTitle = TextEditingController();
  final controllerContent = TextEditingController();
  final key = GlobalKey<FormState>();

  // Clean up the controller when the widget is disposed.
  // mais quel widget du coup ?
  @override
  void dispose() {
    controllerTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes session Janvier 2016"),
      ),
      body: Container(
        padding: const EdgeInsets.all(80),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: displayNotes.length,
                itemBuilder: (context, index) =>
                    NotesRow(note: displayNotes[index], deleteNote: (note){
                      changeStateButton(note);
                    }),),
          ),
            const SizedBox(height: 8),
            Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children : [
                  TextFormField(
                    controller: controllerTitle,
                    decoration: const InputDecoration(labelText: "Enter a new Note : " ),
                    validator: (value) => (value == null || value.isEmpty) ? " The Title note can't be empty": null,
                                  ),
                 const SizedBox(height: 30),
                  TextFormField(
                    controller: controllerContent,
                    decoration: const InputDecoration(labelText: "Enter Note content :" ),
                      validator: (value) => (value == null || value.isEmpty) ? " The note content can't be empty": null,
                                 ),

                 Padding(padding: const EdgeInsets.symmetric(vertical: 16.0)),
                  ElevatedButton(
                    child: const Text("Create Note "),
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        setState(() {
                          displayNotes.add(
                              Notes(
                                  titre: controllerTitle.text, texte: controllerContent.text));
                          controllerTitle.text = "";
                          controllerContent.text = "";
                        });
                      }
                    },
                  )
              ],
              )
            )
        ]
      )

      ),
    );
  }
}
