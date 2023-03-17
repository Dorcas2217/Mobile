import 'dart:js_util';

class Propriete {
  final bool aVendre ;
  final bool estApartement;
  final int nbrMetresCarre;
  final int nbrChambre;
  final int prix;

  Propriete({ this.aVendre=false, this.estApartement=false,
    required this.nbrChambre, required this.nbrMetresCarre, required this.prix});

}

List<Propriete> mesListe(){

  final listePropriete1 =[
    for(var i = 3 ; i<=8; i++)
      Propriete(nbrChambre: i, nbrMetresCarre: i*200, prix: i*200*50, aVendre: true)
  ];

  final listePropriete2 = List.generate(10, (index) => Propriete(nbrChambre: index*3, nbrMetresCarre:index*3*200 , prix: index*3*200*50));

  return [...listePropriete1, ...listePropriete2 ];
}

final defaultPropriete = mesListe();