class Equation {
  final int id;
  final String value;
  final bool isFavorite;
  final String solution;
  final DateTime createdAt;

  Equation({
    this.id,
    this.value,
    this.isFavorite = false,
    this.solution,
    DateTime createdAt,
  }) : this.createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'value': this.value,
      'isFavorite': this.isFavorite == true ? 1 : 0,
      'solution': this.solution,
      'createdAt': this.createdAt,
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
      createdAt: map['createdAt'],
    );
  }

  factory Equation.fromEquation(int id, Equation equation) {
    return Equation(
      id: id,
      value: equation.value,
      isFavorite: equation.isFavorite,
      solution: equation.solution,
      createdAt: equation.createdAt,
    );
  }
}
