import 'package:foodiez/models/ingredient.dart';

class Recipe {
  String id;
  String name;
  String categoryId;
  List<Ingredient> ingredients;
  String instructions;

  Recipe({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.ingredients,
    required this.instructions,
  });

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        categoryId = json['categoryId'] as String,
        ingredients = (json['ingredients'] as List)
            .map((item) => Ingredient.fromJson(item as Map<String, dynamic>))
            .toList(),
        instructions = json['instructions'] as String;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'categoryId': categoryId,
      'ingredients': ingredients.map((ingredient) => ingredient.toJson()).toList(),
      'instructions': instructions,
    };
  }
}
