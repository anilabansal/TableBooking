class Menu {
  int? itemId;
  String? itemName;
  String? categoryName;
  double? itemPrice;
  String? itemdescription;
  String? itemImage;
  bool? isOfferItem;
  String? offerTitle;
  double? offerPrice;
  String? startDate;
  String? endDate;
  int? quantity;


  Menu(
      {this.itemId,
        this.itemName,
        this.categoryName,
        this.itemPrice,
        this.itemdescription,
        this.itemImage,
        this.isOfferItem,
        this.offerTitle,
        this.offerPrice,
        this.startDate,
        this.endDate,
        this.quantity});

  Menu.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    itemName = json['itemName'];
    categoryName = json['categoryName'];
    itemPrice = json['itemPrice'];
    itemdescription = json['itemdescription'];
    itemImage = json['itemImage'];
    isOfferItem = json['isOfferItem'];
    offerTitle = json['offerTitle'];
    offerPrice = json['offerPrice'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    quantity =0;
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
    data['offerTitle'] = this.offerTitle;
    data['offerPrice'] = this.offerPrice;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data["quantity"] =this.quantity;
    return data;
  }
}