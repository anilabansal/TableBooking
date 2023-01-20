


class Cart {
  int? ItemId;
  double? ItemTotalPrice;
  int? ItemQuantity;
  String? itemName;
  int? categoryId;
  bool? isOfferItem;
  String? offerTitle;
  double? offerPrice;

  Cart({this.ItemId, this.ItemTotalPrice, this.ItemQuantity,this.itemName,this.categoryId,this.isOfferItem,this.offerTitle,this.offerPrice});

  Cart.fromJson(Map<String, dynamic> json) {
    ItemId = json['ItemId'];
    ItemTotalPrice = json['ItemTotalPrice'];
    ItemQuantity = json['ItemQuantity'];
    itemName = json['itemName'];
    isOfferItem = json['isOfferItem'];
    offerTitle = json['offerTitle'];
    offerPrice = json['offerPrice'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemId'] = this.ItemId;
    data['ItemTotalPrice'] = this.ItemTotalPrice;
    data['ItemQuantity'] = this.ItemQuantity;
    return data;
  }}