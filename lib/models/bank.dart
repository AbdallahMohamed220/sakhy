class Bank {
  final String color;
  final String id;
  final String identifier;
  final String logo;
  final String name;

  Bank(this.color, this.id, this.identifier, this.logo, this.name);

  Map<String, dynamic> toMap() {
    return {
      'color': color,
      'id': id,
      'identifier': identifier,
      'logo': logo,
      'name': name,
    };
  }

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      map['color'],
      map['id'],
      map['identifier'],
      map['logo'],
      map['name'],
    );
  }
}
