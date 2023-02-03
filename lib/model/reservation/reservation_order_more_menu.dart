class ReservationOrderMoreMenu {
  int? categoryId;
  String? categoryName;
  List<Menu>? menu;

  ReservationOrderMoreMenu({this.categoryId, this.categoryName, this.menu});

  ReservationOrderMoreMenu.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add( Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    if (this.menu != null) {
      data['menu'] = this.menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menu {
  int? itemId;
  String? itemName;
  String? categoryName;
  double? itemPrice;
  String? itemdescription;
  String? itemImage;
  bool? isOfferItem;
  int? quantity;
  String? offerTitle;
  double? offerPrice;
  String? startDate;
  String? endDate;

  Menu(
      {this.itemId,
        this.itemName,
        this.categoryName,
        this.itemPrice,
        this.itemdescription,
        this.itemImage,
        this.isOfferItem,
        this.quantity,
        this.offerTitle,
        this.offerPrice,
        this.startDate,
        this.endDate});

  Menu.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    itemName = json['itemName'];
    categoryName = json['categoryName'];
    itemPrice = json['itemPrice'].toDouble();
    itemdescription = json['itemdescription'];
    itemImage = json['itemImage'];
    isOfferItem = json['isOfferItem'];
    quantity = json['quantity'];
    offerTitle = json['offerTitle'];
    offerPrice = json['offerPrice'].toDouble();
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['itemName'] = this.itemName;
    data['categoryName'] = this.categoryName;
    data['itemPrice'] = this.itemPrice;
    data['itemdescription'] = this.itemdescription;
    data['itemImage'] = this.itemImage;
    data['isOfferItem'] = this.isOfferItem;
    data['quantity'] = this.quantity;
    data['offerTitle'] = this.offerTitle;
    data['offerPrice'] = this.offerPrice;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    return data;
  }
}