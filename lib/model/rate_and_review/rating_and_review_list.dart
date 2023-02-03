import 'dart:convert';

class RatingAndReviewList {
  int? ratingId;
  dynamic restaurantName;
  dynamic ratingByName;
  String? ratedOnDate;
  double? rating;
  String? reviews;
  dynamic profilePic;

  RatingAndReviewList({
    this.ratingId,
    this.restaurantName,
    this.ratingByName,
    this.ratedOnDate,
    this.rating,
    this.reviews,
    this.profilePic,
  });

  @override
  String toString() {
    return 'RatingAndReviewList(ratingId: $ratingId, restaurantName: $restaurantName, ratingByName: $ratingByName, ratedOnDate: $ratedOnDate, rating: $rating, reviews: $reviews, profilePic: $profilePic)';
  }

  factory RatingAndReviewList.fromMap(Map<String, dynamic> data) {
    return RatingAndReviewList(
      ratingId: data['ratingId'] as int?,
      restaurantName: data['restaurantName'] as dynamic,
      ratingByName: data['ratingByName'] as dynamic,
      ratedOnDate: data['ratedOnDate'] as String?,
      rating:data['rating']!=null? data['rating'] as double?:0.0,
      reviews: data['reviews'] as String?,
      profilePic: data['profilePic'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'ratingId': ratingId,
        'restaurantName': restaurantName,
        'ratingByName': ratingByName,
        'ratedOnDate': ratedOnDate,
        'rating': rating,
        'reviews': reviews,
        'profilePic': profilePic,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RatingAndReviewList].
  factory RatingAndReviewList.fromJson(String data) {
    return RatingAndReviewList.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RatingAndReviewList] to a JSON string.
  String toJson() => json.encode(toMap());

  RatingAndReviewList copyWith({
    int? ratingId,
    dynamic restaurantName,
    dynamic ratingByName,
    String? ratedOnDate,
    double? rating,
    String? reviews,
    dynamic profilePic,
  }) {
    return RatingAndReviewList(
      ratingId: ratingId ?? this.ratingId,
      restaurantName: restaurantName ?? this.restaurantName,
      ratingByName: ratingByName ?? this.ratingByName,
      ratedOnDate: ratedOnDate ?? this.ratedOnDate,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      profilePic: profilePic ?? this.profilePic,
    );
  }
}
