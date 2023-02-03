// class RecentSearch {
//   String? address;
//   double? latitude;
//   double? longitude;
//
//
//   RecentSearch({this.address, this.latitude, this.longitude,});
// }
class RecentSearch {
  RecentSearch({
    this.address,
    this.lat,
    this.long,
  });

  String? address;
  double? lat;
  double? long;

  factory RecentSearch.fromJson(Map<String, dynamic> json) => RecentSearch(
    address: json["address"],
    lat: json["lat"].toDouble(),
    long: json["long"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "lat": lat,
    "long": long,
  };
}