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