// To parse this JSON data, do
//
//     final typesOfFood = typesOfFoodFromJson(jsonString);
class ServiceSummary {
  ServiceSummary({
    this.bookingId,
    this.bookingDate,
    this.partySize,
    this.serviceType,
    this.specialEvent,
    this.specialRequest,
    this.userId,
    this.restaurantId,
    this.isDeleted,
    this.isActive,
    this.isCanceled,
    this.createdOn,
    this.tip,
    this.paymentTypeId,
    this.cardId,
    this.bookingConfirmationAmount,
    this.totalAmount,
    this.statusId,
    this.bookingTime,
    this.card,
    this.paymentType,
    this.restaurant,
    this.serviceTypeNavigation,
    this.user,
    this.ratings,
    this.userBookingOrder,
    this.isOrderAdded,
    this.slotId,
  });

  int? bookingId;
  String? bookingDate;
  String? partySize;
  int? serviceType;
  dynamic specialEvent;
  dynamic specialRequest;
  int? userId;
  int? restaurantId;
  bool? isDeleted;
  bool? isActive;
  bool? isCanceled;
  DateTime? createdOn;
  dynamic tip;
  dynamic paymentTypeId;
  dynamic cardId;
  int? bookingConfirmationAmount;
  dynamic totalAmount;
  dynamic statusId;
  String? bookingTime;
  dynamic card;
  dynamic paymentType;
  dynamic restaurant;
  dynamic serviceTypeNavigation;
  dynamic user;
  List<dynamic>? ratings;
  List<dynamic>? userBookingOrder;
  bool? isOrderAdded;
  int?slotId;



  factory ServiceSummary.fromJson(Map<String, dynamic> json) => ServiceSummary(
        bookingId: json["bookingId"],
        bookingDate: json["bookingDate"],
        partySize: json["partySize"],
        serviceType: json["serviceType"],
        specialEvent: json["specialEvent"],
        specialRequest: json["specialRequest"],
        userId: json["userId"],
        restaurantId: json["restaurantId"],
        isDeleted: json["isDeleted"],
        isActive: json["isActive"],
        isCanceled: json["isCanceled"],
        createdOn: DateTime.parse(json["createdOn"]),
        tip: json["tip"],
        paymentTypeId: json["paymentTypeId"],
        cardId: json["cardId"],
        bookingConfirmationAmount: json["bookingConfirmationAmount"].toInt(),
        totalAmount: json["totalAmount"],
        statusId: json["statusId"],
        bookingTime: json["bookingTime"],
        card: json["card"],
        paymentType: json["paymentType"],
        restaurant: json["restaurant"],
        serviceTypeNavigation: json["serviceTypeNavigation"],
        user: json["user"],
        ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
        userBookingOrder:
            List<dynamic>.from(json["userBookingOrder"].map((x) => x)),
        isOrderAdded: false,
      slotId :json['slotId'],
      );

  Map<String, dynamic> toJson() => {
        "bookingId": bookingId,
        "bookingDate": bookingDate,
        "partySize": partySize,
        "serviceType": serviceType,
        "specialEvent": specialEvent,
        "specialRequest": specialRequest,
        "userId": userId,
        "restaurantId": restaurantId,
        "isDeleted": isDeleted,
        "isActive": isActive,
        "isCanceled": isCanceled,
        "createdOn": createdOn!.toIso8601String(),
        "tip": tip,
        "paymentTypeId": paymentTypeId,
        "cardId": cardId,
        "bookingConfirmationAmount": bookingConfirmationAmount,
        "totalAmount": totalAmount,
        "statusId": statusId,
        "bookingTime": bookingTime,
        "card": card,
        "paymentType": paymentType,
        "restaurant": restaurant,
        "serviceTypeNavigation": serviceTypeNavigation,
        "user": user,
        "ratings": List<dynamic>.from(ratings!.map((x) => x)),
        "userBookingOrder": List<dynamic>.from(userBookingOrder!.map((x) => x)),
        "isOrderAdded": isOrderAdded,
    "slotId":slotId,
      };
}
