class Ingredient {
  String id;
  String name;
  double quantity;
  String unit;

  Ingredient({
    required this.id,
    required this.name,
    required this.quantity,
    required this.unit,
  });

  Ingredient.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        quantity = json['quantity'] as double,
        unit = json['unit'] as String;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'quantity': quantity,
      'unit': unit,
    };
  }
}
