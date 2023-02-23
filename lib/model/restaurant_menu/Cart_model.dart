import '../reservation/reservation_order_more_menu.dart';

class Cart {
  int? ItemId;
  double? ItemlPriceSingleQuantity;
  int? ItemQuantity;
  String? itemName;
  int? categoryId;
  bool? isOfferItem;
  String? offerTitle;
  double? offerPrice;
  // String? ingredientName;
  double? addOnPrice;
  double? addOnPriceQuantity;
  List<AddOns>? addOns;
  double?ItemTotalPrice;
  double? addOnOfferPrice;
  double? addOnOfferQuantity;
  // List<BookedAddOns>? bookedAddOns;

  Cart(
      {this.ItemId,
      this.ItemlPriceSingleQuantity,
      this.ItemQuantity,
      this.itemName,
      this.categoryId,
      this.isOfferItem,
      this.offerTitle,
      this.offerPrice,
      // this.ingredientName,
      this.addOnPrice,
      this.addOns,
      this.addOnPriceQuantity,
        this.ItemTotalPrice,
        this.addOnOfferPrice,
        this.addOnOfferQuantity,
     //   this.bookedAddOns,
      });

  Cart.fromJson(Map<String, dynamic> json) {
    ItemId = json['ItemId'];
    ItemlPriceSingleQuantity = json['ItemlPriceSingleQuantity'];
    ItemQuantity = json['ItemQuantity'];
    itemName = json['itemName'];
    isOfferItem = json['isOfferItem'];
    offerTitle = json['offerTitle'];
    offerPrice = json['offerPrice'];
    // ingredientName = json['ingredientName'];
    addOnPriceQuantity = json['addOnPriceQuantity'];
    addOnPrice = json['addOnPrice'];
    if (json['AddOns'] != null) {
      addOns = <AddOns>[];
      json['AddOns'].forEach((v) {
        addOns!.add(AddOns.fromJson(v));
      });
    }
    ItemTotalPrice = json['ItemTotalPrice'];
    addOnOfferPrice = json['addOnOfferPrice'];
    addOnOfferQuantity = json['addOnOfferQuantity'];
    // if (json['BookedAddOns'] != null) {
    //   bookedAddOns = <BookedAddOns>[];
    //   json['BookedAddOns'].forEach((v) {
    //     bookedAddOns!.add(BookedAddOns.fromJson(v));
    //   });
    // }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['ItemId'] = this.ItemId;
   // data['ItemlPriceSingleQuantity'] = this.ItemlPriceSingleQuantity;
    data['ItemQuantity'] = this.ItemQuantity;
    // data['ingredientName'] = this.ingredientName;
   // data['addOnPriceQuantity'] = this.addOnPriceQuantity;
  //  data['addOnPrice'] = this.addOnPrice;
    if (this.addOns != null) {
      data['AddOns'] = this.addOns!.map((v) => v.toJson()).toList();
    }
    data['ItemTotalPrice'] = this.ItemTotalPrice;
   // data['addOnOfferPrice'] = this.addOnOfferPrice;
   // data['addOnOfferQuantity'] = this.addOnOfferQuantity;
    return data;
  }
}

class AddOns {
  String? ingredientName;
  double? addOnPrice;
  int? ItemAddOnId;

  AddOns({this.ingredientName, this.addOnPrice, this.ItemAddOnId});

  AddOns.fromJson(Map<String, dynamic> json) {
    ingredientName = json['ingredientName'];
    addOnPrice = json['addOnPrice'];
    ItemAddOnId = json['ItemAddOnId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    // data['ingredientName'] = this.ingredientName;
    // data['addOnPrice'] = this.addOnPrice;
    data['ItemAddOnId'] =  this.ItemAddOnId;
    return data;
  }
}
// class BookedAddOns {
//   String? ingredientName;
//   // double? addOnPrice;
//   // int? ItemAddOnId;
//
//   BookedAddOns({this.ingredientName, });
//
//   BookedAddOns.fromJson(Map<String, dynamic> json) {
//     ingredientName = json['ingredientName'];
//
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = Map<String, dynamic>();
//   //   // data['ingredientName'] = this.ingredientName;
//   //   // data['addOnPrice'] = this.addOnPrice;
//   //   data['ItemAddOnId'] =  this.ItemAddOnId;
//   //   return data;
//   // }
// }