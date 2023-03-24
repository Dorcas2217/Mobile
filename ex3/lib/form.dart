import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notes.dart';

class MyForm extends StatefulWidget {
  final void Function(Notes) addNote;

  const MyForm({Key? key, required  this.addNote}) : super(key: key);


  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

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

    return Form(
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
                  widget.addNote(Notes(titre: controllerTitle.text, texte: controllerContent.text));
                  controllerContent.text ="";
                  controllerTitle.text= "";
                }
              },
            )
          ],
        )
    );
  }
}
