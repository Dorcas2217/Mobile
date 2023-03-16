import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'contact_row.dart';

class homeScreen extends StatelessWidget {
  const homeScreen ({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactRows = defaultContacts
        .map((contact) => ContactRow(contact: contact))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Contact list")),
      body: ListView(children: contactRows),
    );
  }

}
