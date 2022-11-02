import 'package:booking_table/view/home_screen/widgets/restaurant_zoom_body.dart';
import 'package:flutter/material.dart';

class RestaurantZoomScreen extends StatelessWidget {
  final String? restaurantImage;

  const RestaurantZoomScreen({Key? key, this.restaurantImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: RestaurantZoomBody(imageUrl: restaurantImage!),
    );
  }
}
