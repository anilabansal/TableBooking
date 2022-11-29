import 'dart:convert';

class Menu {
  int? itemId;
  String? itemName;
  String? categoryName;
  double? itemPrice;
  String? itemdescription;
  dynamic itemImage;

  Menu({
    this.itemId,
    this.itemName,
    this.categoryName,
    this.itemPrice,
    this.itemdescription,
    this.itemImage,
  });

  @override
  String toString() {
    return 'Menu(itemId: $itemId, itemName: $itemName, categoryName: $categoryName, itemPrice: $itemPrice, itemdescription: $itemdescription, itemImage: $itemImage)';
  }

  factory Menu.fromMap(Map<String, dynamic> data) => Menu(
        itemId: data['itemId'] as int?,
        itemName: data['itemName'] as String?,
        categoryName: data['categoryName'] as String?,
        itemPrice: data['itemPrice'] as double?,
        itemdescription: data['itemdescription'] as String?,
        itemImage: data['itemImage'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'itemId': itemId,
        'itemName': itemName,
        'categoryName': categoryName,
        'itemPrice': itemPrice,
        'itemdescription': itemdescription,
        'itemImage': itemImage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Menu].
  factory Menu.fromJson(String data) {
    return Menu.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Menu] to a JSON string.
  String toJson() => json.encode(toMap());

  Menu copyWith({
    int? itemId,
    String? itemName,
    String? categoryName,
    double? itemPrice,
    String? itemdescription,
    dynamic itemImage,
  }) {
    return Menu(
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      categoryName: categoryName ?? this.categoryName,
      itemPrice: itemPrice ?? this.itemPrice,
      itemdescription: itemdescription ?? this.itemdescription,
      itemImage: itemImage ?? this.itemImage,
    );
  }
}
