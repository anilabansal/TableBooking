import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
static final ProfileController profileController = ProfileController._internal();
factory ProfileController(){
  return profileController;
}
ProfileController._internal();
 var countryCode = '1'.obs;
  //var countryCode = 'USA'.obs;
var countryFlag = '🇺🇸'.obs;

}
