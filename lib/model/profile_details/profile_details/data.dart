import 'dart:convert';

class ProfileData {
  int? userid;
  String? firstName;
  String? lastName;
  int? roleId;
  String? email;
  String? password;
  String? mobileNo;
  String? address;
  String? deviceToken;
  String? deviceType;
  String? dateofBirth;
  String? city;
  String? state;
  dynamic profilePic;
  String? zipCode;
  dynamic authenticationId;
  dynamic authenticationType;
  bool? isTermsConfirmed;
  String? profileImage;
  dynamic token;

  ProfileData({
    this.userid,
    this.firstName,
    this.lastName,
    this.roleId,
    this.email,
    this.password,
    this.mobileNo,
    this.address,
    this.deviceToken,
    this.deviceType,
    this.dateofBirth,
    this.city,
    this.state,
    this.profilePic,
    this.zipCode,
    this.authenticationId,
    this.authenticationType,
    this.isTermsConfirmed,
    this.profileImage,
    this.token,
  });

  @override
  String toString() {
    return 'Data(userid: $userid, firstName: $firstName, lastName: $lastName, roleId: $roleId, email: $email, password: $password, mobileNo: $mobileNo, address: $address, deviceToken: $deviceToken, deviceType: $deviceType, dateofBirth: $dateofBirth, city: $city, state: $state, profilePic: $profilePic, zipCode: $zipCode, authenticationId: $authenticationId, authenticationType: $authenticationType, isTermsConfirmed: $isTermsConfirmed, profileImage: $profileImage, token: $token)';
  }

  factory ProfileData.fromMap(Map<String, dynamic> data) => ProfileData(
        userid: data['userid'] as int?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        roleId: data['roleId'] as int?,
        email: data['email'] as String?,
        password: data['password'] as String?,
        mobileNo: data['mobileNo'] as String?,
        address: data['address'] as String?,
        deviceToken: data['deviceToken'] as String?,
        deviceType: data['deviceType'] as String?,
        dateofBirth: data['dateofBirth'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        profilePic: data['profilePic'] as dynamic,
        zipCode: data['zipCode'] as String?,
        authenticationId: data['authenticationId'] as dynamic,
        authenticationType: data['authenticationType'] as dynamic,
        isTermsConfirmed: data['isTermsConfirmed'] as bool?,
        profileImage: data['profileImage'] as String?,
        token: data['token'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'userid': userid,
        'firstName': firstName,
        'lastName': lastName,
        'roleId': roleId,
        'email': email,
        'password': password,
        'mobileNo': mobileNo,
        'address': address,
        'deviceToken': deviceToken,
        'deviceType': deviceType,
        'dateofBirth': dateofBirth,
        'city': city,
        'state': state,
        'profilePic': profilePic,
        'zipCode': zipCode,
        'authenticationId': authenticationId,
        'authenticationType': authenticationType,
        'isTermsConfirmed': isTermsConfirmed,
        'profileImage': profileImage,
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory ProfileData.fromJson(String data) {
    return ProfileData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  ProfileData copyWith({
    int? userid,
    String? firstName,
    String? lastName,
    int? roleId,
    String? email,
    String? password,
    String? mobileNo,
    String? address,
    String? deviceToken,
    String? deviceType,
    String? dateofBirth,
    String? city,
    String? state,
    dynamic profilePic,
    String? zipCode,
    dynamic authenticationId,
    dynamic authenticationType,
    bool? isTermsConfirmed,
    String? profileImage,
    dynamic token,
  }) {
    return ProfileData(
      userid: userid ?? this.userid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      roleId: roleId ?? this.roleId,
      email: email ?? this.email,
      password: password ?? this.password,
      mobileNo: mobileNo ?? this.mobileNo,
      address: address ?? this.address,
      deviceToken: deviceToken ?? this.deviceToken,
      deviceType: deviceType ?? this.deviceType,
      dateofBirth: dateofBirth ?? this.dateofBirth,
      city: city ?? this.city,
      state: state ?? this.state,
      profilePic: profilePic ?? this.profilePic,
      zipCode: zipCode ?? this.zipCode,
      authenticationId: authenticationId ?? this.authenticationId,
      authenticationType: authenticationType ?? this.authenticationType,
      isTermsConfirmed: isTermsConfirmed ?? this.isTermsConfirmed,
      profileImage: profileImage ?? this.profileImage,
      token: token ?? this.token,
    );
  }
}
