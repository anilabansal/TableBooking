class BookingResponse {
  BookingResponse({
    this.bookingId,
    this.bookingDate,
    this.bookingTime,
    this.bookingSlotEndTime,
    this.bookingSlotStartTime,
    this.partySize,
    this.serviceType,
    this.specialEvent,
    this.specialRequest,
    this.userId,
    this.restaurantName,
    this.isDeleted,
    this.isActive,
    this.isCanceled,
    this.createdOn,
  });

  int? bookingId;
  String? bookingDate;
  String? bookingTime;
  String? bookingSlotEndTime;
  String? bookingSlotStartTime;
  String? partySize;
  int? serviceType;
  dynamic specialEvent;
  dynamic specialRequest;
  dynamic userId;
  dynamic restaurantName;
  bool? isDeleted;
  bool? isActive;
  bool? isCanceled;
  DateTime? createdOn;

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      BookingResponse(
        bookingId: json["bookingId"],
        bookingDate: json["bookingDate"],
        bookingTime: json["bookingTime"],
        bookingSlotEndTime: json["bookingSlotEndTime"],
        bookingSlotStartTime: json["bookingSlotStartTime"],
        partySize: json["partySize"],
        serviceType: json["serviceType"],
        specialEvent: json["specialEvent"],
        specialRequest: json["specialRequest"],
        userId: json["userId"],
        restaurantName: json["restaurantName"],
        isDeleted: json["isDeleted"],
        isActive: json["isActive"],
        isCanceled: json["isCanceled"],
        createdOn: DateTime.parse(
          json["createdOn"],
        ),
      );

  Map<String, dynamic> toJson() => {
        "bookingId": bookingId,
        "bookingDate": bookingDate,
        "bookingTime": bookingTime,
        "bookingSlotEndTime": bookingSlotEndTime,
        "bookingSlotStartTime": bookingSlotStartTime,
        "partySize": partySize,
        "serviceType": serviceType,
        "specialEvent": specialEvent,
        "specialRequest": specialRequest,
        "userId": userId,
        "restaurantName": restaurantName,
        "isDeleted": isDeleted,
        "isActive": isActive,
        "isCanceled": isCanceled,
        "createdOn": createdOn!.toIso8601String(),
      };
}
