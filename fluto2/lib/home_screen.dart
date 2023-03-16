import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'contact_row.dart';

class homeScreen extends StatelessWidget {
  const homeScreen ({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact list")),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: 512.0,
            child: ListView.builder(
              itemCount: defaultContacts.length,
              itemBuilder: (context, index) {
                log("index : $index");
                return ContactRow(contact: defaultContacts[index]);
              },

            ),
          ),
        ),
      ),
    );
  }



}
