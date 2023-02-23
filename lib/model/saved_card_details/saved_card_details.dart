// import 'dart:convert';
//
// import 'user_cardlist.dart';
//
// class SavedCardDetails {
//   List<UserCardlist>? userCardlist;
//   int? response;
//   String? errorMessage;
//   dynamic data;
//   dynamic token;
//
//   SavedCardDetails({
//     this.userCardlist,
//     this.response,
//     this.errorMessage,
//     this.data,
//     this.token,
//   });
//
//   @override
//   String toString() {
//     return 'SavedCardDetails(userCardlist: $userCardlist, response: $response, errorMessage: $errorMessage, data: $data, token: $token)';
//   }
//
//   factory SavedCardDetails.fromMap(Map<String, dynamic> data) {
//     return SavedCardDetails(
//       userCardlist: (data['userCardlist'] as List<dynamic>?)
//           ?.map((e) => UserCardlist.fromMap(e as Map<String, dynamic>))
//           .toList(),
//       response: data['response'] as int?,
//       errorMessage: data['errorMessage'] as String?,
//       data: data['data'] as dynamic,
//       token: data['token'] as dynamic,
//     );
//   }
//
//   Map<String, dynamic> toMap() => {
//     'userCardlist': userCardlist?.map((e) => e.toMap()).toList(),
//     'response': response,
//     'errorMessage': errorMessage,
//     'data': data,
//     'token': token,
//   };
//
//   /// `dart:convert`
//   ///
//   /// Parses the string and returns the resulting Json object as [SavedCardDetails].
//   factory SavedCardDetails.fromJson(String data) {
//     return SavedCardDetails.fromMap(json.decode(data) as Map<String, dynamic>);
//   }
//
//   /// `dart:convert`
//   ///
//   /// Converts [SavedCardDetails] to a JSON string.
//   String toJson() => json.encode(toMap());
//
//   SavedCardDetails copyWith({
//     List<UserCardlist>? userCardlist,
//     int? response,
//     String? errorMessage,
//     dynamic data,
//     dynamic token,
//   }) {
//     return SavedCardDetails(
//       userCardlist: userCardlist ?? this.userCardlist,
//       response: response ?? this.response,
//       errorMessage: errorMessage ?? this.errorMessage,
//       data: data ?? this.data,
//       token: token ?? this.token,
//     );
//   }
// }