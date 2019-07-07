class Equation {
  final String id;
  final String value;
  final bool isFavorite;
  final String solution;

  const Equation({
    this.id,
    this.value,
    this.isFavorite,
    this.solution,
  });

  // factory Equation.fromFireStore(DocumentSnapshot doc) {
  //   Map data = doc.data;

  //   return Equation(
  //     id: doc.documentID,
  //     isFavorite: data['isFavorite'] ?? false,
  //     solution: data['solution'] ?? '',
  //     value: data['value'] ?? '',
  //   );
  // }
}
