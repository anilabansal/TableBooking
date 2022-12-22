import 'dart:convert';

import 'restaurant_about_us_schedule_model.dart';

class RestaurantAboutUsDetails {
  bool? isUserSubmitReview;
  num? restaurantId;
  dynamic restaurantName;
  dynamic restaurantPic;
  dynamic address;
  dynamic zipCode;
  String? aboutUs;
  String? officialWebsite;
  String? contactNumber;
  String? email;
  num? distance;
  dynamic rating;
  num? ratingCount;
  dynamic latitude;
  dynamic longitude;
  bool? isFavourite;
  dynamic reviewlist;
  List<RestaurantAboutUsSchedule>? schedule;

  RestaurantAboutUsDetails({
    this.isUserSubmitReview,
    this.restaurantId,
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
    this.reviewlist,
    this.schedule,
  });

  factory RestaurantAboutUsDetails.fromMap(Map<String, dynamic> data) =>
      RestaurantAboutUsDetails(
        isUserSubmitReview: data['isUserSubmitReview'] as bool?,
        restaurantId: data['restaurantId'] as num?,
        restaurantName: data['restaurantName'] as dynamic,
        restaurantPic: data['restaurantPic'] as dynamic,
        address: data['address'] as dynamic,
        zipCode: data['zipCode'] as dynamic,
        aboutUs: data['aboutUs'] as String?,
        officialWebsite: data['officialWebsite'] as String?,
        contactNumber: data['contactNumber'] as String?,
        email: data['email'] as String?,
        distance: data['distance'] as num?,
        rating: data['rating'] as dynamic,
        ratingCount: data['ratingCount'] as num?,
        latitude: data['latitude'] as dynamic,
        longitude: data['longitude'] as dynamic,
        isFavourite: data['isFavourite'] as bool?,
        reviewlist: data['reviewlist'] as dynamic,
        schedule: (data['schedule'] as List<dynamic>?)
            ?.map((e) =>
            RestaurantAboutUsSchedule.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
    'isUserSubmitReview': isUserSubmitReview,
    'restaurantId': restaurantId,
    'restaurantName': restaurantName,
    'restaurantPic': restaurantPic,
    'address': address,
    'zipCode': zipCode,
    'aboutUs': aboutUs,
    'officialWebsite': officialWebsite,
    'contactNumber': contactNumber,
    'email': email,
    'distance': distance,
    'rating': rating,
    'ratingCount': ratingCount,
    'latitude': latitude,
    'longitude': longitude,
    'isFavourite': isFavourite,
    'reviewlist': reviewlist,
    'schedule': schedule?.map((e) => e.toMap()).toList(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RestaurantAboutUsDetails].
  factory RestaurantAboutUsDetails.fromJson(String data) {
    return RestaurantAboutUsDetails.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestaurantAboutUsDetails] to a JSON string.
  String toJson() => json.encode(toMap());
}
