import 'dart:convert';

class RestaurantAboutUsDetails {
  int? restaurantId;
  dynamic restaurantName;
  dynamic restaurantPic;
  dynamic address;
  dynamic zipCode;
  dynamic aboutUs;
  dynamic officialWebsite;
  dynamic contactNumber;
  dynamic email;
  dynamic distance;
  dynamic rating;
  int? ratingCount;
  dynamic latitude;
  dynamic longitude;
  bool? isFavourite;

  RestaurantAboutUsDetails({
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
    return 'Datum(restaurantId: $restaurantId, restaurantName: $restaurantName, restaurantPic: $restaurantPic, address: $address, zipCode: $zipCode, aboutUs: $aboutUs, officialWebsite: $officialWebsite, contactNumber: $contactNumber, email: $email, distance: $distance, rating: $rating, ratingCount: $ratingCount, latitude: $latitude, longitude: $longitude, isFavourite: $isFavourite)';
  }

  factory RestaurantAboutUsDetails.fromMap(Map<String, dynamic> data) =>
      RestaurantAboutUsDetails(
        restaurantId: data['restaurantId'] as int?,
        restaurantName: data['restaurantName'] as dynamic,
        restaurantPic: data['restaurantPic'] as dynamic,
        address: data['address'] as dynamic,
        zipCode: data['zipCode'] as dynamic,
        aboutUs: data['aboutUs'] as dynamic,
        officialWebsite: data['officialWebsite'] as dynamic,
        contactNumber: data['contactNumber'] as dynamic,
        email: data['email'] as dynamic,
        distance: data['distance'] as dynamic,
        rating: data['rating'] as dynamic,
        ratingCount: data['ratingCount'] as int?,
        latitude: data['latitude'] as dynamic,
        longitude: data['longitude'] as dynamic,
        isFavourite: data['isFavourite'] as bool?,
      );

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
  /// Parses the string and returns the resulting Json object as [RestaurantAboutUsDetails].
  factory RestaurantAboutUsDetails.fromJson(String data) {
    return RestaurantAboutUsDetails.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestaurantAboutUsDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  RestaurantAboutUsDetails copyWith({
    int? restaurantId,
    dynamic restaurantName,
    dynamic restaurantPic,
    dynamic address,
    dynamic zipCode,
    dynamic aboutUs,
    dynamic officialWebsite,
    dynamic contactNumber,
    dynamic email,
    dynamic distance,
    dynamic rating,
    int? ratingCount,
    dynamic latitude,
    dynamic longitude,
    bool? isFavourite,
  }) {
    return RestaurantAboutUsDetails(
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
