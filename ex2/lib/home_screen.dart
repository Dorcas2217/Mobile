import 'dart:developer';

import 'package:ex2/propriete.dart';
import 'package:ex2/propriete_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ex2/home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var aVendre = false ;

  void switchAVendre() => setState(() {
    aVendre = !aVendre;
  });


  @override
  Widget build(BuildContext context) {
  final  displayPropriete;

  if(aVendre){
    displayPropriete = [
      for (var property in defaultProprieteAvendre) property
    ];
  } else{
    displayPropriete = [
      for (var property in defaultPropertyLoc) property
    ];

  }

    return Scaffold(
      appBar: AppBar(
         title: Text("Properties to rent/sell"),
         actions: [
          Switch(value: aVendre,
              activeColor: Colors.orange,
              onChanged: (bool value){
                switchAVendre();
              })
        ],
      ),
      body: Container(
         padding: const EdgeInsets.all(30),
         child: Center(
           child: ListView.builder(
             itemCount:  displayPropriete.length,
             itemBuilder: (context, index ) => ProprieteRow(
                 propriete: displayPropriete[index],
             ),
           ),
         ),
      ),
    );
  }
}




