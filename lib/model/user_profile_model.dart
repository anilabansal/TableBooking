import 'dart:convert';

class UserProfile {
  dynamic mobileNumber;
  String? token;
  int? userId;
  String? fullName;
  dynamic address;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  bool? isProfileCreated;
  int? response;
  String? errorMessage;
  dynamic data;

  UserProfile({
    this.mobileNumber,
    this.token,
    this.userId,
    this.fullName,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.isProfileCreated,
    this.response,
    this.errorMessage,
    this.data,
  });

  @override
  String toString() {
    return 'UserProfile(mobileNumber: $mobileNumber, token: $token, userId: $userId, fullName: $fullName, address: $address, city: $city, state: $state, zipCode: $zipCode, isProfileCreated: $isProfileCreated, response: $response, errorMessage: $errorMessage, data: $data)';
  }

  factory UserProfile.fromMap(Map<String, dynamic> data) => UserProfile(
        mobileNumber: data['mobileNumber'] as dynamic,
        token: data['token'] as String?,
        userId: data['userId'] as int?,
        fullName: data['fullName'] as String?,
        address: data['address'] as dynamic,
        city: data['city'] as dynamic,
        state: data['state'] as dynamic,
        zipCode: data['zipCode'] as dynamic,
        isProfileCreated: data['isProfileCreated'] as bool?,
        response: data['response'] as int?,
        errorMessage: data['errorMessage'] as String?,
        data: data['data'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'mobileNumber': mobileNumber,
        'token': token,
        'userId': userId,
        'fullName': fullName,
        'address': address,
        'city': city,
        'state': state,
        'zipCode': zipCode,
        'isProfileCreated': isProfileCreated,
        'response': response,
        'errorMessage': errorMessage,
        'data': data,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserProfile].
  factory UserProfile.fromJson(String data) {
    return UserProfile.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserProfile] to a JSON string.
  String toJson() => json.encode(toMap());

  UserProfile copyWith({
    dynamic mobileNumber,
    String? token,
    int? userId,
    String? fullName,
    dynamic address,
    dynamic city,
    dynamic state,
    dynamic zipCode,
    bool? isProfileCreated,
    int? response,
    String? errorMessage,
    dynamic data,
  }) {
    return UserProfile(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      token: token ?? this.token,
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      isProfileCreated: isProfileCreated ?? this.isProfileCreated,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }
}
