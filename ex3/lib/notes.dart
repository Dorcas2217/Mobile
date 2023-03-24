class Notes{
  final String titre;
  final String texte;

  Notes({required this.titre, required this.texte});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Notes &&
          runtimeType == other.runtimeType &&
          titre == other.titre;

  @override
  int get hashCode => titre.hashCode;
}

List<Notes> listNote (){
  final Notes note1 = Notes(titre: "Atelier Java ", texte: "pas mal 10/20 mais tu peux mieux faire ");
  final Notes note2 =  Notes(titre: "Langage C", texte: "c'est bien tu fais des effort 11/20 ");

  final list = [note1, note2];

  return list;
}

final defaultList = listNote();