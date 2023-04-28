import 'dart:convert';

import 'package:ex6/view_model/photo_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);


  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  final controllerTitle = TextEditingController();
  final controllerUrl = TextEditingController();

  final key = GlobalKey<FormState>();



  @override
  void dispose() {
    controllerTitle.dispose();
    controllerUrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New article"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

    body: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Form(
        key: key,
        child: Column(
          children: [
            TextFormField(
              controller: controllerTitle,
              decoration: const InputDecoration(labelText: "Photo title"),
              validator: (value) => (value == null || value == "")
                  ? "Title can't be empty"
                  : null,
            ),
            TextFormField(
              controller: controllerUrl,
              decoration: const InputDecoration(labelText: "Photo url"),
              validator: (value) => (value == null || value == "")
                  ? "Author can't be empty"
                  : null,
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text("Create picture"),
              onPressed: () {
                if (key.currentState!.validate()) {
                  final widget =  Provider.of<PhotoView>(context, listen : false);
                      widget.addPictures(controllerTitle.text, controllerUrl.text);
                      controllerTitle.text="";
                      controllerUrl.text="";
                      Navigator.pop(context);

                }
              },
            )
          ],
        ),
      ),
    ),
    );
  }
}
