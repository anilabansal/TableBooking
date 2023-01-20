// To parse this JSON data, do
//
//     final partySize = partySizeFromJson(jsonString);


class PartySize {
  PartySize({
    this.number,
  });
  int? number;
  factory PartySize.fromJson(Map<String, dynamic> json) => PartySize(
    number: json["number"],
  );
  Map<String, dynamic> toJson() => {
    "number": number,
  };
}
