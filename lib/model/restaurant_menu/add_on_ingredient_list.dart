


class AddOnIngredientList {
  String? ingredientType;
  List<IngredientTypes>? ingredientTypes;

  AddOnIngredientList({this.ingredientType, this.ingredientTypes});

  AddOnIngredientList.fromJson(Map<String, dynamic> json) {
    ingredientType = json['ingredientType'];
    if (json['ingredientTypes'] != null) {
      ingredientTypes = <IngredientTypes>[];
      json['ingredientTypes'].forEach((v) {
        ingredientTypes!.add(new IngredientTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ingredientType'] = this.ingredientType;
    if (this.ingredientTypes != null) {
      data['ingredientTypes'] =
          this.ingredientTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IngredientTypes {
  String? name;
  double? amount;
  int?addOnId;

  IngredientTypes({this.name, this.amount,this.addOnId});

  IngredientTypes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'].toDouble();
    addOnId = json['addOnId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['addOnId'] =  this.addOnId;
    return data;
  }
}