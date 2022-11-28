import 'dart:convert';

class RestaurantList {
  int? restaurantId;
  String? restaurantName;
  String? restaurantPic;
  String? address;
  dynamic zipCode;
  dynamic aboutUs;
  dynamic officialWebsite;
  dynamic contactNumber;
  dynamic email;
  dynamic distance;
  dynamic rating;
  dynamic ratingCount;
  String? latitude;
  String? longitude;
  bool? isFavourite;

  RestaurantList({
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
  });

  @override
  String toString() {
    return 'Restaurantlist(restaurantId: $restaurantId, restaurantName: $restaurantName, restaurantPic: $restaurantPic, address: $address, zipCode: $zipCode, aboutUs: $aboutUs, officialWebsite: $officialWebsite, contactNumber: $contactNumber, email: $email, distance: $distance, rating: $rating, ratingCount: $ratingCount, latitude: $latitude, longitude: $longitude, isFavourite: $isFavourite)';
  }

  factory RestaurantList.fromMap(Map<String, dynamic> data) {
    return RestaurantList(
      restaurantId: data['restaurantId'] as int?,
      restaurantName: data['restaurantName'] as String?,
      restaurantPic: data['restaurantPic'] as String?,
      address: data['address'] as String?,
      zipCode: data['zipCode'] as dynamic,
      aboutUs: data['aboutUs'] as dynamic,
      officialWebsite: data['officialWebsite'] as dynamic,
      contactNumber: data['contactNumber'] as dynamic,
      email: data['email'] as dynamic,
      distance: data['distance'] as dynamic,
      rating: data['rating'] as dynamic,
      ratingCount: data['ratingCount'] as dynamic,
      latitude: data['latitude'] as String?,
      longitude: data['longitude'] as String?,
      isFavourite: data['isFavourite'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
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
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RestaurantList].
  factory RestaurantList.fromJson(String data) {
    return RestaurantList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestaurantList] to a JSON string.
  String toJson() => json.encode(toMap());

  RestaurantList copyWith({
    int? restaurantId,
    String? restaurantName,
    String? restaurantPic,
    String? address,
    dynamic zipCode,
    dynamic aboutUs,
    dynamic officialWebsite,
    dynamic contactNumber,
    dynamic email,
    dynamic distance,
    dynamic rating,
    dynamic ratingCount,
    String? latitude,
    String? longitude,
    bool? isFavourite,
  }) {
    return RestaurantList(
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantName: restaurantName ?? this.restaurantName,
      restaurantPic: restaurantPic ?? this.restaurantPic,
      address: address ?? this.address,
      zipCode: zipCode ?? this.zipCode,
      aboutUs: aboutUs ?? this.aboutUs,
      officialWebsite: officialWebsite ?? this.officialWebsite,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      distance: distance ?? this.distance,
      rating: rating ?? this.rating,
      ratingCount: ratingCount ?? this.ratingCount,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}