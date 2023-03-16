import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'contact_row.dart';



class homeScreen extends StatefulWidget {
  const homeScreen ({Key? key, required String title}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var showFavorites = false;
  void _toggleFavorites() => setState(() => showFavorites = !showFavorites);

  @override
  Widget build(BuildContext context) {
    final displayedContacts = [
      for (var contact in defaultContacts)
        if (!showFavorites || contact.isFavorite) contact
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact list"),
        actions: [
          IconButton(
            icon: Icon(showFavorites ? Icons.star : Icons.star_border),
            onPressed: _toggleFavorites,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: 512.0,
            child: ListView.builder(
              itemCount: displayedContacts.length,
              itemBuilder: (context, index) =>
                  ContactRow(contact: displayedContacts[index]),
            ),
          ),
        ),
      ),
    );
  }

}
