class CardList {
  List<UserCardlist>? userCardlist;
  int? response;
  String? errorMessage;
  String? data;
  int? count;
  String? token;

  CardList(
      {this.userCardlist,
        this.response,
        this.errorMessage,
        this.data,
        this.count,
        this.token});

  CardList.fromJson(Map<String, dynamic> json) {
    if (json['userCardlist'] != null) {
      userCardlist = <UserCardlist>[];
      json['userCardlist'].forEach((v) {
        userCardlist!.add(new UserCardlist.fromJson(v));
      });
    }
    response = json['response'];
    errorMessage = json['errorMessage'];
    data = json['data'];
    count = json['count'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userCardlist != null) {
      data['userCardlist'] = this.userCardlist!.map((v) => v.toJson()).toList();
    }
    data['response'] = this.response;
    data['errorMessage'] = this.errorMessage;
    data['data'] = this.data;
    data['count'] = this.count;
    data['token'] = this.token;
    return data;
  }
}

class UserCardlist {
  int? userId;
  int? cardId;
  String? cardHolderName;
  String? cardNumber;
  String? cvvNumber;
  String? expiryDate;
  String? bankName;

  UserCardlist(
      {this.userId,
        this.cardId,
        this.cardHolderName,
        this.cardNumber,
        this.cvvNumber,
        this.expiryDate,
        this.bankName});

  UserCardlist.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    cardId = json['cardId'];
    cardHolderName = json['cardHolderName'];
    cardNumber = json['cardNumber'];
    cvvNumber = json['cvvNumber'];
    expiryDate = json['expiryDate'];
    bankName = json['bankName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['cardId'] = this.cardId;
    data['cardHolderName'] = this.cardHolderName;
    data['cardNumber'] = this.cardNumber;
    data['cvvNumber'] = this.cvvNumber;
    data['expiryDate'] = this.expiryDate;
    data['bankName'] = this.bankName;
    return data;
  }
}