import 'dart:convert';

import 'restaurant_image.dart';

class GalleryImages {
  dynamic viewImage;
  List<RestaurantImage>? restaurantImages;
  int? response;
  String? errorMessage;
  dynamic data;
  dynamic token;

  GalleryImages({
    this.viewImage,
    this.restaurantImages,
    this.response,
    this.errorMessage,
    this.data,
    this.token,
  });

  @override
  String toString() {
    return 'GalleryImages(viewImage: $viewImage, restaurantImages: $restaurantImages, response: $response, errorMessage: $errorMessage, data: $data, token: $token)';
  }

  factory GalleryImages.fromMap(Map<String, dynamic> data) => GalleryImages(
        viewImage: data['viewImage'] as dynamic,
        restaurantImages: (data['restaurantImages'] as List<dynamic>?)
            ?.map((e) => RestaurantImage.fromMap(e as Map<String, dynamic>))
            .toList(),
        response: data['response'] as int?,
        errorMessage: data['errorMessage'] as String?,
        data: data['data'] as dynamic,
        token: data['token'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'viewImage': viewImage,
        'restaurantImages': restaurantImages?.map((e) => e.toMap()).toList(),
        'response': response,
        'errorMessage': errorMessage,
        'data': data,
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GalleryImages].
  factory GalleryImages.fromJson(String data) {
    return GalleryImages.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GalleryImages] to a JSON string.
  String toJson() => json.encode(toMap());

  GalleryImages copyWith({
    dynamic viewImage,
    List<RestaurantImage>? restaurantImages,
    int? response,
    String? errorMessage,
    dynamic data,
    dynamic token,
  }) {
    return GalleryImages(
      viewImage: viewImage ?? this.viewImage,
      restaurantImages: restaurantImages ?? this.restaurantImages,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }
}
