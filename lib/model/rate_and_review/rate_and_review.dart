import 'dart:convert';

import 'rating_and_review_list.dart';

class RateAndReview {
  int? totalReview;
  List<RatingAndReviewList>? ratingAndReviewLists;
  int? response;
  String? errorMessage;
  dynamic data;
  dynamic token;

  RateAndReview({
    this.totalReview,
    this.ratingAndReviewLists,
    this.response,
    this.errorMessage,
    this.data,
    this.token,
  });

  @override
  String toString() {
    return 'RateAndReview(totalReview: $totalReview, ratingAndReviewLists: $ratingAndReviewLists, response: $response, errorMessage: $errorMessage, data: $data, token: $token)';
  }

  factory RateAndReview.fromMap(Map<String, dynamic> data) => RateAndReview(
        totalReview: data['totalReview'] as int?,
        ratingAndReviewLists: (data['ratingAndReviewLists'] as List<dynamic>?)
            ?.map((e) => RatingAndReviewList.fromMap(e as Map<String, dynamic>))
            .toList(),
        response: data['response'] as int?,
        errorMessage: data['errorMessage'] as String?,
        data: data['data'] as dynamic,
        token: data['token'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'totalReview': totalReview,
        'ratingAndReviewLists':
            ratingAndReviewLists?.map((e) => e.toMap()).toList(),
        'response': response,
        'errorMessage': errorMessage,
        'data': data,
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RateAndReview].
  factory RateAndReview.fromJson(String data) {
    return RateAndReview.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RateAndReview] to a JSON string.
  String toJson() => json.encode(toMap());

  RateAndReview copyWith({
    int? totalReview,
    List<RatingAndReviewList>? ratingAndReviewLists,
    int? response,
    String? errorMessage,
    dynamic data,
    dynamic token,
  }) {
    return RateAndReview(
      totalReview: totalReview ?? this.totalReview,
      ratingAndReviewLists: ratingAndReviewLists ?? this.ratingAndReviewLists,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }
}
