import 'package:booking_table/view/profile_screen/widgets/create_profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile/profile_controller.dart';

class CreateProfileScreen extends StatelessWidget {
  CreateProfileScreen({Key? key}) : super(key: key);

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreateProfileScreenBody(profileController: profileController),
    );
  }
}
