class Category {
  String id;
  String name;

  Category({required this.id, required this.name});

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }
}
