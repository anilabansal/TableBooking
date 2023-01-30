class RestaurantBookingList {
  List<Upcominglist>? upcominglist;
  List<Upcominglist>? previouslist;
  List<Upcominglist>? runninglist;
  int? response;
  String? errorMessage;
  dynamic data;
  int? count;
  dynamic token;

  RestaurantBookingList(
      {this.upcominglist,
        this.previouslist,
        this.runninglist,
        this.response,
        this.errorMessage,
        this.data,
        this.count,
        this.token});

  RestaurantBookingList.fromJson(Map<String, dynamic> json) {
    if (json['upcominglist'] != null) {
      upcominglist = <Upcominglist>[];
      json['upcominglist'].forEach((v) {
        upcominglist!.add( Upcominglist.fromJson(v));
      });
    }
    if (json['previouslist'] != null) {
      previouslist = <Upcominglist>[];
      json['previouslist'].forEach((v) {
        previouslist!.add( Upcominglist.fromJson(v));
      });
    }
    if (json['runninglist'] != null) {
      runninglist = <Upcominglist>[];
      json['runninglist'].forEach((v) {
        runninglist!.add( Upcominglist.fromJson(v));
      });
    }
    response = json['response'];
    errorMessage = json['errorMessage'];
    data = json['data'];
    count = json['count'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.upcominglist != null) {
      data['upcominglist'] = this.upcominglist!.map((v) => v.toJson()).toList();
    }
    if (this.previouslist != null) {
      data['previouslist'] = this.previouslist!.map((v) => v.toJson()).toList();
    }
    if (this.runninglist != null) {
      data['runninglist'] = this.runninglist!.map((v) => v.toJson()).toList();
    }
    data['response'] = this.response;
    data['errorMessage'] = this.errorMessage;
    data['data'] = this.data;
    data['count'] = this.count;
    data['token'] = this.token;
    return data;
  }
}

class Upcominglist {
  int? restaurantId;
  String? restaurantName;
  String? restaurantPic;
  String? address;
  dynamic zipCode;
  dynamic aboutUs;
  dynamic officialWebsite;
  dynamic contactNumber;
  dynamic email;
  double? distance;
  dynamic rating;
  double? ratingCount;
  dynamic latitude;
  dynamic longitude;
  bool? isFavourite;
  int? bookingId;
  String? bookingDate;
  String? bookingTime;
  int? serviceId;
  String? serviceType;
  bool? isUserSubmitReview;

  Upcominglist(
      {this.restaurantId,
        this.restaurantName,
        this.restaurantPic,
        this.address,
        this.zipCode,
        this.aboutUs,
        this.officialWebsite,
        this.contactNumber,
        this.email,
        this.distance,
        this.rating,
        this.ratingCount,
        this.latitude,
        this.longitude,
        this.isFavourite,
        this.bookingId,
        this.bookingDate,
        this.bookingTime,
        this.serviceId,
        this.serviceType,
        this.isUserSubmitReview});

  Upcominglist.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurantId'];
    restaurantName = json['restaurantName'];
    restaurantPic = json['restaurantPic'];
    address = json['address'];
    zipCode = json['zipCode'];
    aboutUs = json['aboutUs'];
    officialWebsite = json['officialWebsite'];
    contactNumber = json['contactNumber'];
    email = json['email'];
    distance = json['distance'].toDouble();
    rating = json['rating'];
    ratingCount = json['ratingCount'].toDouble();
    latitude = json['latitude'];
    longitude = json['longitude'];
    isFavourite = json['isFavourite'];
    bookingId = json['bookingId'];
    bookingDate = json['bookingDate'];
    bookingTime = json['bookingTime'];
    serviceId = json['serviceId'];
    serviceType = json['serviceType'];
    isUserSubmitReview = json['isUserSubmitReview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantId'] = this.restaurantId;
    data['restaurantName'] = this.restaurantName;
    data['restaurantPic'] = this.restaurantPic;
    data['address'] = this.address;
    data['zipCode'] = this.zipCode;
    data['aboutUs'] = this.aboutUs;
    data['officialWebsite'] = this.officialWebsite;
    data['contactNumber'] = this.contactNumber;
    data['email'] = this.email;
    data['distance'] = this.distance;
    data['rating'] = this.rating;
    data['ratingCount'] = this.ratingCount;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['isFavourite'] = this.isFavourite;
    data['bookingId'] = this.bookingId;
    data['bookingDate'] = this.bookingDate;
    data['bookingTime'] = this.bookingTime;
    data['serviceId'] = this.serviceId;
    data['serviceType'] = this.serviceType;
    data['isUserSubmitReview'] = this.isUserSubmitReview;
    return data;
  }
}