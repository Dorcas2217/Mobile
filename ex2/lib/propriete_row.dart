import 'package:ex2/propriete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProprieteRow extends StatelessWidget {
  final Propriete propriete;

  const ProprieteRow({Key? key, required this.propriete}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text("Cette propriete   ${estAppartement()} "
          "\n Nombre de chambre :  ${propriete.nbrChambre}, "),
      subtitle: Text("prix :  ${propriete.prix}, Nombre de mètre de carré : ${propriete.nbrMetresCarre}"),
      textColor: Colors.black,
      trailing:
      Icon(propriete.aVendre ? Icons.notification_add : Icons.notification_important_outlined),

    );
  }

  String estAppartement(){
    String infos = " ";
    if(propriete.estApartement){
      infos+=" est un appartement ";
    }else{
      infos+= "est une maison";
    }
    return infos;
  }
}


