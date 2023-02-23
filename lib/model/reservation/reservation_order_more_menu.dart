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
  bool?isAddOnAdded;
  int? newAddedQuantity;
  List<AddedAddOns>? addedAddOns=[];

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
        this.endDate,
        this.isAddOnAdded,
        this.newAddedQuantity,
        this.addedAddOns,
      });

  Menu.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'] ?? 0;
    itemName = json['itemName'] ?? "";
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
    isAddOnAdded = json['isAddOnAdded'];
    newAddedQuantity = 0;
    if (json['addedAddOns'] != null) {
      addedAddOns = <AddedAddOns>[];
      json['addedAddOns'].forEach((v) {
        addedAddOns!.add( AddedAddOns.fromJson(v));
      });
    }
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
    data['isAddOnAdded'] = this.isAddOnAdded;
    data['newAddedQuantity'] = this.newAddedQuantity;
    if (this.addedAddOns != null) {
      data['addedAddOns'] = this.addedAddOns!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class AddedAddOns {
  String? itemName;
  double? price;
  String? addOnType;
  int? addOnId;
  String? addOnName;

  AddedAddOns(
      {this.itemName,
        this.price,
        this.addOnType,
        this.addOnId,
        this.addOnName});

  AddedAddOns.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    price = json['price'].toDouble();
    addOnType = json['addOnType'];
    addOnId = json['addOnId'];
    addOnName = json['addOnName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemName'] = this.itemName;
    data['price'] = this.price;
    data['addOnType'] = this.addOnType;
    data['addOnId'] = this.addOnId;
    data['addOnName'] = this.addOnName;
    return data;
  }
}