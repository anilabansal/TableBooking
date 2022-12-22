class FilterRestaurant {
  int? restaurantId;
  bool? isFavourite;
  String? restaurantName;
  double? distance;
  String? restaurantPic;
  String? latitude;
  String? longitude;

  FilterRestaurant(
      {this.restaurantId,
        this.isFavourite,
        this.restaurantName,
        this.distance,
        this.restaurantPic,
        this.latitude,
        this.longitude,
      });

  FilterRestaurant.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurantId'];
    isFavourite = json['isFavourite'] ;
    restaurantName = json['restaurantName'];
    distance = json['distance'];
    restaurantPic = json['restaurantPic'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantId'] = this.restaurantId;
    data['isFavourite'] = this.isFavourite;
    data['restaurantName'] = this.restaurantName;
    data['distance'] = this.distance;
    data['restaurantPic'] = this.restaurantPic;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}