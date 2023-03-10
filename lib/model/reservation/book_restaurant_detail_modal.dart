// To parse this JSON data, do
//
//     final bookRestaurantDetails = bookRestaurantDetailsFromJson(jsonString);

import 'dart:convert';



class BookRestaurantDetails {
  BookRestaurantDetails({
    required this.bookinglistresponse,
    // required this.totalPrice,
    // required this.tipAmount,
    required this.response,
    required this.errorMessage,
    // this.data,
    // required this.count,
    this.token,
  });

  Bookinglistresponse bookinglistresponse;
  // int totalPrice;
  // int tipAmount;
  int response;
  String errorMessage;
  // dynamic data;
  // int count;
  dynamic token;

  factory BookRestaurantDetails.fromJson(Map<String, dynamic> json) => BookRestaurantDetails(
    bookinglistresponse: Bookinglistresponse.fromJson(json["bookinglistresponse"]),
    // totalPrice: json["totalPrice"],
    // tipAmount: json["tipAmount"],
    response: json["response"],
    errorMessage: json["errorMessage"],
    // data: json["data"],
    // count: json["count"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "bookinglistresponse": bookinglistresponse.toJson(),
    // "totalPrice": totalPrice,
    // "tipAmount": tipAmount,
    "response": response,
    "errorMessage": errorMessage,
    // "data": data,
    // "count": count,
    "token": token,
  };
}

class Bookinglistresponse {
  Bookinglistresponse({
     this.isUserSubmitReview,
     this.restaurantPic,
     this.restaurantName,
     this.restaurantId,
     this.distance,
     this.bookingStatus,
     this.bookingDate,
     this.bookingTime,
     this.partySize,
     this.specialOccasion,
     this.typeofFood,
     this.specialRequest,
     this.serviceType,
     this.orderlistdetail,
     this.totalAmount,
     this.tip,
     this.grandTotal,
     this.preBookingConfirmationAmount,
     this.bookingId,
    // this.userId,
    // this.latitude,
    // this.longitude,
     this.paymentType,
    // this.userCardDetail,
    // this.review,
     this.contactNumber,
     this.email,
    // this.rating,
    // required this.ratingCount,
     this.isFavourite,
    // this.paymentStatus,
    this.reviewList,
    this.gotoorderlistdetail,
    this.toGoTotalAmount,
    this.tax,
  });

  bool? isUserSubmitReview;
  String? restaurantPic;
  String? restaurantName;
  int? restaurantId;
  double? distance;
  String? bookingStatus;
  String? bookingDate;
  String? bookingTime;
  String ?partySize;
  String ?specialOccasion;
  String ?typeofFood;
  String ?specialRequest;
  String ?serviceType;
  List<Orderlistdetail>? orderlistdetail;
  double? totalAmount;
  String? tip;
  double? grandTotal;
  double? preBookingConfirmationAmount;
  int? bookingId;
  // dynamic userId;
  // double? latitude;
  // double? longitude;
  String? paymentType;
  // dynamic userCardDetail;
  // dynamic review;
  String? contactNumber;
  String? email;
  // double? rating;
  // double? ratingCount;
  bool? isFavourite;
  ReviewList? reviewList;
  List<Orderlistdetail>? gotoorderlistdetail;
  double?toGoTotalAmount;
  double?tax;

  // dynamic paymentStatus;
  // List<dynamic> reviewList;

  factory Bookinglistresponse.fromJson(Map<String, dynamic> json) => Bookinglistresponse(
    isUserSubmitReview: json["isUserSubmitReview"],
    restaurantPic: json["restaurantPic"],
    restaurantName: json["restaurantName"],
    restaurantId: json["restaurantId"],
    distance: json["distance"]?.toDouble(),
    bookingStatus: json["bookingStatus"],
    bookingDate: json["bookingDate"],
    bookingTime: json["bookingTime"],
    partySize: json["partySize"],
    specialOccasion: json["specialOccasion"],
    typeofFood: json["typeofFood"],
    specialRequest: json["specialRequest"],
    serviceType: json["serviceType"],
    orderlistdetail: List<Orderlistdetail>.from(json["orderlistdetail"].map((x) => Orderlistdetail.fromJson(x))),
    totalAmount: json["totalAmount"]!=null?json["totalAmount"].toDouble():0.0,
    tip: json["tip"],
    grandTotal: json["grandTotal"]!=null?json["grandTotal"].toDouble():0.0,
    // preBookingConfirmationAmount: json["preBookingConfirmationAmount"].toDouble(),
    bookingId: json["bookingId"],
    // userId: json["userId"],
    // latitude: json["latitude"]!=null?json["latitude"].toDouble():0.0,
    // longitude: json["longitude"]!=null?json["longitude"].toDouble():0.0,
    paymentType: json["paymentType"],
    // userCardDetail: json["userCardDetail"],
    // review: json["review"],
    contactNumber: json["contactNumber"],
    email: json["email"],
    // rating: json["rating"]!=null?json["rating"].toDouble():0.0,
    // ratingCount: json["ratingCount"].toDouble(),
    isFavourite: json["isFavourite"],
    // paymentStatus: json["paymentStatus"],
    reviewList:json["reviewList"]!=null? ReviewList.fromJson(json["reviewList"]):null,
    gotoorderlistdetail: List<Orderlistdetail>.from(json["gotoorderlistdetail"].map((x) => Orderlistdetail.fromJson(x))),
      toGoTotalAmount:json['toGoTotalAmount'].toDouble(),
      tax :json["tax"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "isUserSubmitReview": isUserSubmitReview,
    "restaurantPic": restaurantPic,
    "restaurantName": restaurantName,
    "restaurantId": restaurantId,
    "distance": distance,
    "bookingStatus": bookingStatus,
    "bookingDate": bookingDate,
    "bookingTime": bookingTime,
    "partySize": partySize,
    "specialOccasion": specialOccasion,
    "typeofFood": typeofFood,
    "specialRequest": specialRequest,
    "serviceType": serviceType,
    "orderlistdetail": List<dynamic>.from(orderlistdetail!.map((x) => x.toJson())),
    "totalAmount": totalAmount,
    "tip": tip,
    "grandTotal": grandTotal,
    "preBookingConfirmationAmount": preBookingConfirmationAmount,
    "bookingId": bookingId,
    // "userId": userId,
    // "latitude": latitude,
    // "longitude": longitude,
    "paymentType": paymentType,
    // "userCardDetail": userCardDetail,
    // "review": review,
    "contactNumber": contactNumber,
    "email": email,
    // "rating": rating,
    // "ratingCount": ratingCount,
    "isFavourite": isFavourite,
    // "paymentStatus": paymentStatus,
  "reviewList": reviewList!.toJson(),
    "gotoorderlistdetail": List<dynamic>.from(gotoorderlistdetail!.map((x) => x.toJson())),
    "toGoTotalAmount":toGoTotalAmount,
    "tax":tax,
  };
}

class Orderlistdetail {
  Orderlistdetail({
     this.bookingOrderId,
     this.bookingId,
     this.itemName,
     this.itemQuantity,
     this.itemTotalPrice,
    this.addOns,

  });

  int? bookingOrderId;
  int? bookingId;
  String? itemName;
  int? itemQuantity;
  double? itemTotalPrice;
  List<AddOn>? addOns;

  factory Orderlistdetail.fromJson(Map<String, dynamic> json) => Orderlistdetail(
    bookingOrderId: json["bookingOrderId"],
    bookingId: json["bookingId"],
    itemName: json["itemName"],
    itemQuantity: json["itemQuantity"],
    itemTotalPrice: json["itemTotalPrice"]!=null? json["itemTotalPrice"].toDouble():0.0,
    addOns: List<AddOn>.from(json["addOns"].map((x) => AddOn.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bookingOrderId": bookingOrderId,
    "bookingId": bookingId,
    "itemName": itemName,
    "itemQuantity": itemQuantity,
    "itemTotalPrice": itemTotalPrice,
    "addOns": List<dynamic>.from(addOns!.map((x) => x.toJson())),
  };
}

class ReviewList {
  ReviewList({
     // this.ratingId,
     // this.ratedOnDate,
     this.rating,
     this.review,
    // this.ratingToRestaurantId,
    // this.ratingById,
    // this.bookingId,
  });

  // int ratingId;
  // DateTime ratedOnDate;
  double? rating;
  String? review;
  // dynamic ratingToRestaurantId;
  // dynamic ratingById;
  // dynamic bookingId;

  factory ReviewList.fromJson(Map<String, dynamic> json) => ReviewList(
    // ratingId: json["ratingId"],
    // ratedOnDate: DateTime.parse(json["ratedOnDate"]),
    rating:json["rating"]==null?0.0: json["rating"]?.toDouble(),
    review: json["review"],
    // ratingToRestaurantId: json["ratingToRestaurantId"],
    // ratingById: json["ratingById"],
    // bookingId: json["bookingId"],
  );

  Map<String, dynamic> toJson() => {
    // "ratingId": ratingId,
    // "ratedOnDate": ratedOnDate.toIso8601String(),
    "rating": rating,
    "review": review,
    // "ratingToRestaurantId": ratingToRestaurantId,
    // "ratingById": ratingById,
    // "bookingId": bookingId,
  };
}

class AddOn {
  AddOn({
    this.itemName,
     this.price,
    this.addOnType,
     this.addOnId,
     this.addOnName,
  });

  dynamic itemName;
  double? price;
  dynamic addOnType;
  int? addOnId;
  String? addOnName;

  factory AddOn.fromJson(Map<String, dynamic> json) => AddOn(
    itemName: json["itemName"],
    price: json["price"].toDouble(),
    addOnType: json["addOnType"],
    addOnId: json["addOnId"],
    addOnName: json["addOnName"],
  );

  Map<String, dynamic> toJson() => {
    "itemName": itemName,
    "price": price,
    "addOnType": addOnType,
    "addOnId": addOnId,
    "addOnName": addOnName,
  };
}
