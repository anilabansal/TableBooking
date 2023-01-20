import 'menu.dart';

class RestaurantMenuData {
  int? categoryId;
  String? categoryName;
  List<Menu>? menu;

  RestaurantMenuData({this.categoryId, this.categoryName, this.menu});

  RestaurantMenuData.fromMap(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    if (this.menu != null) {
      data['menu'] = this.menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}