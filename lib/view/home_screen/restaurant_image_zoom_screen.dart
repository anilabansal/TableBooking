import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/common/common_colors.dart';

class RestaurantZoomScreen extends StatelessWidget {
  final String? restaurantImage;

  const RestaurantZoomScreen({Key? key, this.restaurantImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  border: Border.all(color: white, width: 9),
                ),
                child: Image.asset(
                  restaurantImage.toString(),
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: white),
                    child: const Icon(
                      Icons.close,
                      color: black0D0000,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
