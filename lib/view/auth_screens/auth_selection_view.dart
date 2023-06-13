import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/view/auth_screens/widgets/auth_selection_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/location/location_controller.dart';
import '../../utils/common/widgets_methods/common_text.dart';

class AuthSelectionView extends StatefulWidget {
  const AuthSelectionView({Key? key}) : super(key: key);
  @override
  State<AuthSelectionView> createState() => _AuthSelectionViewState();
}

class _AuthSelectionViewState extends State<AuthSelectionView> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<LocationController>().requestPermission();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),

                  // TOP
                  SizedBox(height: Get.height * 0.15),
                  // Middle View
                  AuthScreenViewWidget(),
                  const Spacer(),
                  // Bottom
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed('/zip-code');
                        },
                        child: CommonText(
                          text: 'Continue as Guest',
                          color: redE2211C,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}