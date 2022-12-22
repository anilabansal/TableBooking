import 'dart:convert';

class UserCardlist {
  int? userId;
  int? cardId;
  String? cardHolderName;
  String? cardNumber;
  String? cvvNumber;
  String? expiryDate;
  String? bankName;

  UserCardlist({
    this.userId,
    this.cardId,
    this.cardHolderName,
    this.cardNumber,
    this.cvvNumber,
    this.expiryDate,
    this.bankName,
  });

  @override
  String toString() {
    return 'UserCardlist(userId: $userId, cardId: $cardId, cardHolderName: $cardHolderName, cardNumber: $cardNumber, cvvNumber: $cvvNumber, expiryDate: $expiryDate, bankName: $bankName)';
  }

  factory UserCardlist.fromMap(Map<String, dynamic> data) => UserCardlist(
    userId: data['userId'] as int?,
    cardId: data['cardId'] as int?,
    cardHolderName: data['cardHolderName'] as String?,
    cardNumber: data['cardNumber'] as String?,
    cvvNumber: data['cvvNumber'] as String?,
    expiryDate: data['expiryDate'] as String?,
    bankName: data['bankName'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'cardId': cardId,
    'cardHolderName': cardHolderName,
    'cardNumber': cardNumber,
    'cvvNumber': cvvNumber,
    'expiryDate': expiryDate,
    'bankName': bankName,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserCardlist].
  factory UserCardlist.fromJson(String data) {
    return UserCardlist.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserCardlist] to a JSON string.
  String toJson() => json.encode(toMap());

  UserCardlist copyWith({
    int? userId,
    int? cardId,
    String? cardHolderName,
    String? cardNumber,
    String? cvvNumber,
    String? expiryDate,
    String? bankName,
  }) {
    return UserCardlist(
      userId: userId ?? this.userId,
      cardId: cardId ?? this.cardId,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardNumber: cardNumber ?? this.cardNumber,
      cvvNumber: cvvNumber ?? this.cvvNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      bankName: bankName ?? this.bankName,
    );
  }
}