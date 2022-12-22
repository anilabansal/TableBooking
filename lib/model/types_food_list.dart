
class TypesOfFood {
  TypesOfFood({
    this.id,
    this.foodType,
    this.restaurant,
  });

  int? id;
  String? foodType;
  List<dynamic>? restaurant;

  factory TypesOfFood.fromJson(Map<String, dynamic> json) => TypesOfFood(
    id: json["id"],
    foodType: json["foodType"],
    restaurant: List<dynamic>.from(json["restaurant"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "foodType": foodType,
    "restaurant": List<dynamic>.from(restaurant!.map((x) => x)),
  };
}
