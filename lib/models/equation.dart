class Equation {
  final String id;
  final String value;
  final bool isFavorite;
  final String solution;

  const Equation({
    this.id,
    this.value,
    this.isFavorite = false,
    this.solution,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'value': this.value,
      'isFavorite': this.isFavorite == true ? 1 : 0,
      'solution': this.solution,
    };
    if (this.id != null) {
      map['id'] = id;
    }
    return map;
  }

  factory Equation.fromMap(Map<String, dynamic> map) {
    return Equation(
      id: map['id'],
      value: map['value'],
      isFavorite: map['isFavorite'] == 1,
      solution: map['solution'],
    );
  }
}
