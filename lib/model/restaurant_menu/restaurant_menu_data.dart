import 'dart:convert';

import 'menu.dart';

class RestaurantMenuData {
  int? categoryId;
  String? categoryName;
  List<Menu>? menu;

  RestaurantMenuData({this.categoryId, this.categoryName, this.menu});

  @override
  String toString() {
    return 'Datum(categoryId: $categoryId, categoryName: $categoryName, menu: $menu)';
  }

  factory RestaurantMenuData.fromMap(Map<String, dynamic> data) =>
      RestaurantMenuData(
        categoryId: data['categoryId'] as int?,
        categoryName: data['categoryName'] as String?,
        menu: (data['menu'] as List<dynamic>?)
            ?.map((e) => Menu.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'categoryId': categoryId,
        'categoryName': categoryName,
        'menu': menu?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory RestaurantMenuData.fromJson(String data) {
    return RestaurantMenuData.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  RestaurantMenuData copyWith({
    int? categoryId,
    String? categoryName,
    List<Menu>? menu,
  }) {
    return RestaurantMenuData(
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      menu: menu ?? this.menu,
    );
  }
}
