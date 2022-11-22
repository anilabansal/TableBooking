import 'dart:convert';

import 'data.dart';

class ProfileDetails {
  int? response;
  String? errorMessage;
  ProfileData? data;
  dynamic token;

  ProfileDetails({this.response, this.errorMessage, this.data, this.token});

  @override
  String toString() {
    return 'ProfileDetails(response: $response, errorMessage: $errorMessage, data: $data, token: $token)';
  }

  factory ProfileDetails.fromMap(Map<String, dynamic> data) {
    return ProfileDetails(
      response: data['response'] as int?,
      errorMessage: data['errorMessage'] as String?,
      data: data['data'] == null
          ? null
          : ProfileData.fromMap(data['data'] as Map<String, dynamic>),
      token: data['token'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'response': response,
        'errorMessage': errorMessage,
        'data': data?.toMap(),
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProfileDetails].
  factory ProfileDetails.fromJson(String data) {
    return ProfileDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProfileDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  ProfileDetails copyWith({
    int? response,
    String? errorMessage,
    ProfileData? data,
    dynamic token,
  }) {
    return ProfileDetails(
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }
}
